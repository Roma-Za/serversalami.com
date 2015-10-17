<?php
 
namespace api\modules\v1\models;
 
use \yii\db\ActiveRecord;
/**
 * Salamiuser Model
 */
class Salamiuser extends ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'salami_user';
    }

    public function getLat(){
        $coords = explode(",", $this->location);
        return floatval($coords[0]);
    }

    public function getLng(){
        $coords = explode(",", $this->location);
        return floatval($coords[1]);
    }
    /**

     * Define rules for validation

     */

    public function rules()

    {

        return [

            [['facebook_id', 'name', 'email', 'birthday', 'gender', 'profile_picture', 'collection_type','location'], 'required']

        ];

    }
	
    public function getAlbums()
    {
        return $this->hasMany(Album::className(), ['user_id' => 'id']);
    }

    public function getLikes()
    {
        return $this->hasMany(Likes::className(), ['user1_id' => 'id']);
    }

    public function getMessages()
    {
        return $this->hasMany(Messages::className(), ['sender_id' => 'id']);
    }
}