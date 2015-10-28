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
    public static function primaryKey()
    {
        return ['id'];
    }
    /**
     * Define rules for validation
     */
    public function rules()
    {
        return [
            [['text', 'sender_id', 'recipient_id', 'state'], 'required']
        ];
    }
}