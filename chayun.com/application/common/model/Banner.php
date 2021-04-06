<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/2/20
 * Time: 14:16
 */

namespace app\common\model;


use think\Model;

class Banner extends Model
{
    public function getInfo()
    {
        $order = ['status'=>'desc'];
        $result = $this->order($order)->paginate(8);
        return $result;
    }
    public function addBanner($data) {
        $result = $this->allowField(true)->save($data);
        return $result;
    }
    public function change($data)
    {
        $info = $this->find($data['id']);
        $info->status=$data['status'];
        $result = $info->save();
        return $result;
    }
    public function del($id)
    {
        $check = self::get($id);
        /* if(is_null($check)) {
             return '非法参数';
         }
         if($check['role']==0) {
             return '权限不够';
         }*/
        return $check->delete();
    }
}