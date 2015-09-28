<?php
 
namespace api\modules\v1\models;
 
use \yii\db\ActiveRecord;
/**
 * Album Model
 */
class Album extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'album';
    }
 
    /**
     * @inheritdoc
     */
    public static function primaryKey()
    {
        return ['album_id'];
    }
 
    /**
     * Define rules for validation
     */
    public function rules()
    {
        return [
            [['user_id', 'name', 'facebook_album_id'], 'required']
        ];
    }
}