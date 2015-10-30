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

    public function getLikes(){
        return $this->hasMany(Likes::className(), ['user2_id' => 'id']);
    }

    public function getLikedusers(){
        return $this->hasMany(Salamiuser::className(), ['id' => 'user2_id'])
                    ->viaTable(Likes::tableName(), ['user1_id' => 'id']);
    }
}