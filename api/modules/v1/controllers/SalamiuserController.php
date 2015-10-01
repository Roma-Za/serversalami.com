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
 
/**
 * Salamiuser Controller API
 */
class SalamiuserController extends ActiveController
{
    public $modelClass = 'api\modules\v1\models\Salamiuser';

    public function actionIndex() {
      Yii::error("Heeeeeello");
      $params=$_REQUEST;
      $filter=array();
      $sort="";

      $page=1;
      $limit=10;
             
      if(isset($params['page'])) $page=$params['page'];

      if(isset($params['limit'])) $limit=$params['limit'];

      $offset=$limit*($page-1);

      /* Filter elements */
      if(isset($params['filter'])) {
        $filter=(array)json_decode($params['filter']);
      }

      if(isset($params['datefilter'])) {
        $datefilter=(array)json_decode($params['datefilter']);
      }

      if(isset($params['sort'])) {
        $sort=$params['sort'];
        if(isset($params['order'])) {  
          if($params['order']=="false") $sort.=" desc";
          else $sort.=" asc";
        }
      }

      $query=new Query;
      $query->offset($offset)
        ->limit($limit)
        ->from('salamiuser')
        //   ->andFilterWhere(['like', 'id', $filter['id']])
        ->andFilterWhere(['like', 'name', $filter['name']])
        //   ->andFilterWhere(['like', 'age', $filter['age']])
        //->orderBy($sort)
        //   ->select("id,name,age,createdAt,updatedAt");
        ->select("id,name,facebook_id");

      // if($datefilter['from'])
      // {
      //  $query->andWhere("createdAt >= '".$datefilter['from']."' ");
      // }
      // if($datefilter['to'])
      // {
      //  $query->andWhere("createdAt <= '".$datefilter['to']."'");
      // }
      $command = $query->createCommand();
      $models = $command->queryAll();

      $totalItems=$query->count();
      $this->setHeader(200);
      echo json_encode(array('status'=>1,'data'=>$models,'totalItems'=>$totalItems),JSON_PRETTY_PRINT); 
    }

    private function setHeader($status) {
      
      $status_header = 'HTTP/1.1 ' . $status . ' ' . $this->_getStatusCodeMessage($status);
      $content_type="application/json; charset=utf-8";
    
      header($status_header);
      header('Content-type: ' . $content_type);
    }

    private function _getStatusCodeMessage($status) {
      // these could be stored in a .ini file and loaded
      // via parse_ini_file()... however, this will suffice
      // for an example
      $codes = Array(
          200 => 'OK',
          400 => 'Bad Request',
          401 => 'Unauthorized',
          402 => 'Payment Required',
          403 => 'Forbidden',
          404 => 'Not Found',
          500 => 'Internal Server Error',
          501 => 'Not Implemented',
      );
      return (isset($codes[$status])) ? $codes[$status] : '';
    }
}