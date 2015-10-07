<?php

namespace api\modules\v1\models;

use \yii\db\ActiveRecord;
/**
 * Photos Model
 */
class Photos extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'photos';
    }

    /**
     * Define rules for validation
     */
    public function rules()
    {
        return [
            [['picture_url', 'album_id'], 'required']
        ];
    }
}