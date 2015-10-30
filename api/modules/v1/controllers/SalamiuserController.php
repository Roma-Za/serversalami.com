<?php
 
namespace api\modules\v1\controllers;

use Yii;
use yii\rest\ActiveController;
use yii\data\ActiveDataProvider;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\db\Query;
use yii\helpers\ArrayHelper;
use api\modules\v1\models\Salamiuser;
use api\modules\v1\models\Messages;
use api\modules\v1\models\Likes;

/**
 * Salamiuser Controller API
 */
class SalamiuserController extends ActiveController
{
    public $modelClass = 'api\modules\v1\models\Salamiuser';

    function distance($lat1, $lon1, $lat2, $lon2) {

        $theta = $lon1 - $lon2;
        $dist = sin(deg2rad($lat1)) * sin(deg2rad($lat2)) +  cos(deg2rad($lat1)) * cos(deg2rad($lat2)) * cos(deg2rad($theta));
        $dist = acos($dist);
        $dist = rad2deg($dist);
        $miles = $dist * 60 * 1.1515;

        return ($miles * 1.609344);
    }

    public function actionFindusers()
    {
        try {
            $search_params = isset($_GET['collection_type']) ? ['collection_type' => $_GET['collection_type']] : [];
            if(isset($_GET["id"])){
                $current_user = Salamiuser::find()->where(['id' => $_GET["id"]])->one();
                $salamiusers = Salamiuser::find()->where($search_params)->all();
                if (isset($_GET["distance"])) {                    
                    $selected_user_ids = [];
                    foreach ($salamiusers as $user) {
                        if ($user->id == $current_user->id || $user->getLat() == 0 || $user->getLng() == 0) continue;

                        if ($this->distance($current_user->getLat(), $current_user->getLng(), $user->getLat(), $user->getLng()) < $_GET["distance"]) {
                            $selected_user_ids[] = $user->id;
                        }
                    }

                    $salamiusers = Salamiuser::find()->joinWith('albums')->where(['id' => $selected_user_ids])->asArray()->all();
                } else {
                    $salamiusers = Salamiuser::find()->joinWith('albums')->where($search_params)->andWhere(['not in', '`salami_user`.`id`', [$_GET["id"]]])->asArray()->all();
                }
            }
        } catch (Exception $ex) {
            throw new \yii\web\HttpException(500, 'Internal server error');
        }
        return $salamiusers;
    }

    public function actionSearch()
    {
        try {
            $salamiusers = Salamiuser::find()->joinWith('albums')->where($_GET)->asArray()->all();
        } catch (Exception $ex) {
            throw new \yii\web\HttpException(500, 'Internal server error');
        }
        return $salamiusers;
    }

    public function actionConversations()
    {
        try {
            $query = new Query;
            $messages = $query->select(['`messages`.*'])
              ->from('salami_user')
              ->join('JOIN', 'messages', 'messages.recipient_id = salami_user.id')
              ->where(['messages.recipient_id' => $_GET['user_id']])
              ->orWhere(['messages.sender_id' => $_GET['user_id']])
              ->groupBy(['sender_id', 'recipient_id'])
              ->orderBy(['messages.created_at' => SORT_DESC])->all();
            $unique_users = array();
            $result = array();
            foreach ($messages as $message) {
                if ($message["sender_id"] == $_GET['user_id'] &&  !in_array($message["recipient_id"], $unique_users)) {
                    $unique_users[] = $message["recipient_id"];
                    $message["user"] = Salamiuser::find()->where(['id' => $message["recipient_id"]])->one();
                    $result[] = $message;
                }
                if ($message["recipient_id"] == $_GET['user_id'] && !in_array($message["sender_id"], $unique_users)) {
                    $unique_users[] = $message["sender_id"];
                    $message["user"] = Salamiuser::find()->where(['id' => $message["sender_id"]])->one();
                    $result[] = $message;
                }
            }
            return $result;
        } catch (Exception $ex) {
            throw new \yii\web\HttpException(500, 'Internal server error');
        }
        return [];
    }

    public function actionLikes(){
        $current_user = Salamiuser::find()->where(['id' => $_GET["user_id"]])->one();
        $query = new Query;
        $salami_ids = $query->select('salami_user.id')->from('salami_user')
              ->join('INNER JOIN', 'likes', 'likes.user2_id = salami_user.id')
              ->where(['likes.type' => 'like', 'likes.user1_id' => $current_user->id])->all();
        $salamiusers = Salamiuser::find()->joinWith('albums')->where(['id' => $salami_ids])->asArray()->all();;      
        return $salamiusers;
    }

    function removeFromArrayById($arr, $id){
        for ($i = 0; $i < count($arr); $i++) {
            if ($arr[$i]['id'] == $id){
                unset($arr[$i]);
            }
        }
        return $arr;
    }

}