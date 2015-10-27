<?php

namespace api\modules\v1\controllers;

use Yii;
use yii\rest\ActiveController;
use yii\data\ActiveDataProvider;
use api\modules\v1\models\Messages;
use api\modules\v1\models\Salamiuser;
use linslin\yii2\curl;

class MessagesController extends ActiveController
{
    public $modelClass = 'api\modules\v1\models\Messages';

    public function actionHistory()
    {
        if (!empty($_GET)) {
            try {
                $query = Messages::find()->where(['sender_id' => $_GET['user_id'], 'recipient_id' => $_GET['buddy_id']])
                                         ->orWhere(['recipient_id' => $_GET['user_id'], 'sender_id' => $_GET['buddy_id']])
                                         ->orderBy('created_at');
            } catch (Exception $ex) {
                throw new \yii\web\HttpException(500, 'Internal server error');
            }

            return $query->all();
        } else {
            throw new \yii\web\HttpException(400, 'There are no query string');
        }
    }

    public function actionSend(){
        if (Yii::$app->request->post("recipient_id")) {
            $recipient_id = Yii::$app->request->post("recipient_id");
            $text = Yii::$app->request->post("message");
            $sender_id = Yii::$app->request->post("sender_id");
            $recipientUser = Salamiuser::find()->where(['id' => $recipient_id])->one();
            $senderUser = Salamiuser::find()->where(['id' => $sender_id])->one();

            $message = new Messages;
            $message->sender_id = $senderUser->id;
            $message->recipient_id = $recipientUser->id;
            $message->text = $text;
            $message->created_at = date("Y-m-d H:i:s");
            $message->state = "new";
            $saved = $message->save();

            $data = array(
              'user_ids' => array($recipientUser->facebook_id),
              'notification' => array(
                "alert" => $text,
                "android" => array(
                  'payload' => array(
                    "sender" => $senderUser->facebook_id
                  )
                )
              )
            );
            $ionicAppId = "70f2a984";
            $ionicApiSecret = "ec4839bfb9ea2daa2271b0149a0c18003a3672178f4e6485";
            $url = "https://push.ionic.io/api/v1/push";
            $content = json_encode($data);
            $curl = new curl\Curl();
            $curl->setOption(CURLOPT_SSL_VERIFYPEER, false);
            $curl->setOption(CURLOPT_POSTFIELDS, $content);
            $curl->setOption(CURLOPT_HTTPHEADER, array(
                            'Content-Type: application/json',
                            'X-Ionic-Application-Id: '.$ionicAppId,
                            'Content-Length: '.strlen($content),
                            'Authorization: Basic '.base64_encode($ionicApiSecret)
                            )
                        );
            $response = $curl->post('https://push.ionic.io/api/v1/push');
            return $response;
        }
        return '{"error": "Invalid request parameters"}';
    }


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

}