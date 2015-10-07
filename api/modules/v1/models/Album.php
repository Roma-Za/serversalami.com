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
     * Define rules for validation
     */
    public function rules()
    {
        return [
            [['user_id', 'name', 'facebook_album_id', 'description', 'picture_url'], 'required']
        ];
    }

    public function getPhotos()
    {
        return $this->hasMany(Photos::className(), ['id' => 'user_id']);
    }
}