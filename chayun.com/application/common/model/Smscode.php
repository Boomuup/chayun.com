<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/30
 * Time: 13:44
 */

namespace app\common\model;


use think\Model;

class Smscode extends Model
{
    public function savedata($data)
    {

        $result = Smscode::create($data);
        return $result;
    }

    public function check($phone)
    {
        $data = self::where('phone',$phone)->order('expiration','desc')->find();
        if($data->expiration < time()) {
            return 90001;
        } else {
            return $data->code;
        }
    }
   /* public function limitsend($phone)
    {
        $data = self::where('phone',$phone)->order('expiration','desc')->find();

    }*/
}