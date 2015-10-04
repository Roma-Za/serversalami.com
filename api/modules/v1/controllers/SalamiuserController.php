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

}