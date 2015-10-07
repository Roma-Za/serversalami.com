<?php

namespace api\modules\v1\controllers;

use yii\rest\ActiveController;

/**
 * Photos Controller API
 */
class PhotosController extends ActiveController
{
    public $modelClass = 'api\modules\v1\models\Photos';
}