<?php
 
namespace api\modules\v1\controllers;
 
use yii\rest\ActiveController;
 
/**
 * User Controller API
 */
class UserController extends ActiveController
{
    public $modelClass = 'api\modules\v1\models\User';
}