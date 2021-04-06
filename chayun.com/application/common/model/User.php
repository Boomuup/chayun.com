<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/30
 * Time: 13:14
 */

namespace app\common\model;


use think\Model;

class User extends Model
{
    public function getinfo($phone)
    {
        $result = User::where('phone',$phone)->find();
        return $result;
    }

    public function addUser($data)
    {
        $data['password'] = md5($data['password']);
        $result = $this->allowField(true)->save($data);
        return $result;
    }
    public function checkUser($username)
    {
        $result = $this->where(['username'=>$username])->find();
        return $result;
    }
}