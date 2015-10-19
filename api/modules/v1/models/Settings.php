<?php

namespace api\modules\v1\models;

use \yii\db\ActiveRecord;

class Settings extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'settings';
    }
    public static function primaryKey()
    {
        return ['salami_user_id'];
    }
    /**
     * Define rules for validation
     */
    public function rules()
    {
        return [
            [['salami_user_id', 'distance', 'collection_type'], 'required']
        ];
    }
}