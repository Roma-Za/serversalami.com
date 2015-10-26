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
            $results1 = Messages::find()->select(['`salami_user`.`name`', '`salami_user`.`profile_picture`', '`salami_user`.`id`', '`messages`.`text`', '`messages`.`created_at`', '`messages`.`state`'])
                                        ->leftJoin('salami_user', '`messages`.`recipient_id` = `salami_user`.`id`')
                                        ->where(['sender_id' => $_GET['user_id']])
                                        ->orderBy(['created_at' => SORT_DESC])
                                        ->distinct(['`salami_user`.`id`'])
                                        ->asArray()->all();
            $results2 = Messages::find()->select(['`salami_user`.`name`', '`salami_user`.`profile_picture`', '`salami_user`.`id`', '`messages`.`text`', '`messages`.`created_at`', '`messages`.`state`'])
                                        ->leftJoin('salami_user', '`messages`.`sender_id` = `salami_user`.`id`')
                                        ->where(['recipient_id' => $_GET['user_id']])
                                        ->orderBy(['created_at' => SORT_DESC])
                                        ->distinct(['`salami_user`.`id`'])
                                        ->asArray()->all();
            
            return array_merge($results1, $results2);
        } catch (Exception $ex) {
            throw new \yii\web\HttpException(500, 'Internal server error');
        }
        return [];
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