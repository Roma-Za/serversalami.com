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

    public function actionSearch()
    {
        try {
            $search_params = isset($_GET['collection_type']) ? [$_GET['collection_type']] : [];
            if (isset($_GET["user_id"]) && isset($_GET["distance"])) {
                $current_user = Salamiuser::find()->where(['id' => $_GET["user_id"]])->one();
                $salamiusers = Salamiuser::find()->where($search_params)->all();
                $selected_user_ids = [];
                foreach ($salamiusers as &$user) {
                    if ($user->id == $current_user->id || $user->getLat() == 0 || $user->getLng() == 0) continue;

                    if ($this->distance($current_user->getLat(), $current_user->getLng(), $user->getLat(), $user->getLng()) < $_GET["distance"]) {
                        $selected_user_ids[] = $user->id;
                    }
                }

                $salamiusers = $salamiusers = Salamiuser::find()->joinWith('albums')->where(['id' => $selected_user_ids])->asArray()->all();
            } else {
                $salamiusers = $salamiusers = Salamiuser::find()->joinWith('albums')->where($_GET)->asArray()->all();
            }

        } catch (Exception $ex) {
            throw new \yii\web\HttpException(500, 'Internal server error');
        }
        return $salamiusers;
    }


}