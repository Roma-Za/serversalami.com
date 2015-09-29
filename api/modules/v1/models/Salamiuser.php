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
	
	  /**

     * Define rules for validation

     */

    public function rules()

    {

        return [

            [['facebook_id', 'name', 'email', 'birthday', 'gender', 'profile_picture', 'location'], 'required']

        ];

    }
	
    public function getAlbums()
    {
        return $this->hasMany(Album::className(), ['user_id' => 'id']);
    }
}