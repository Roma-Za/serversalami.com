<?php

namespace api\modules\v1\models;

use \yii\db\ActiveRecord;

class Messages extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'messages';
    }

    /**
     * Define rules for validation
     */
    public function rules()
    {
        return [
            [['text', 'created_at', 'sender_id', 'recipient_id'], 'required']
        ];
    }
}