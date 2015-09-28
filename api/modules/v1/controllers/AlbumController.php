<?php
 
namespace api\modules\v1\controllers;
 
use yii\rest\ActiveController;
 
/**
 * Album Controller API
 */
class AlbumController extends ActiveController
{
    public $modelClass = 'api\modules\v1\models\Album';
}