<?php

namespace api\modules\v1\models;

use \yii\db\ActiveRecord;

class Likes extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'likes';
    }

    /**
     * Define rules for validation
     */
    public function rules()
    {
        return [
            [['type', 'user1_id', 'user2_id'], 'required']
        ];
    }
}