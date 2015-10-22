<?php

namespace api\modules\v1\controllers;

use Yii;
use yii\rest\ActiveController;
use yii\data\ActiveDataProvider;

class MessagesController extends ActiveController
{
    public $modelClass = 'api\modules\v1\models\Messages';

    public function actionSearch()
    {
        if (!empty($_GET)) {
            $model = new $this->modelClass;
            foreach ($_GET as $key => $value) {
                if (!$model->hasAttribute($key)) {
                    throw new \yii\web\HttpException(404, 'Invalid attribute:' . $key);
                }
            }
            try {
                $provider = new ActiveDataProvider([
                    'query' => $model->find()->where($_GET),
                    'pagination' => false
                ]);
            } catch (Exception $ex) {
                throw new \yii\web\HttpException(500, 'Internal server error');
            }

            if ($provider->getCount() <= 0) {
                throw new \yii\web\HttpException(404, 'No entries found with this query string');
            } else {
                return $provider;
            }
        } else {
            throw new \yii\web\HttpException(400, 'There are no query string');
        }
    }

    public function actionSend(){
        if (Yii::$app->request->post("recipient")) {
            $data = array(
              'user_ids' => array(Yii::$app->request->post("recipient")),
              'notification' => array(
                "alert" => Yii::$app->request->post("message"),
                "android" => array(
                  'payload' => array(
                    "sender" => Yii::$app->request->post("sender")
                  )
                )
              )
            );
            $url = "https://push.ionic.io/api/v1/push";
            $content = json_encode($data);
            $ch = curl_init('https://push.ionic.io/api/v1/push');
            curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
            curl_setopt($ch, CURLOPT_POSTFIELDS, $content);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HTTPHEADER, array(
                'Content-Type: application/json',
                'X-Ionic-Application-Id: 70f2a984',
                'Content-Length: ' + strlen($content),
                'Authorization: Basic '.base64_encode("ec4839bfb9ea2daa2271b0149a0c18003a3672178f4e6485")
                )
            );

            $result = curl_exec($ch);
            return $result;
        }
        return "{}";
    }
}