<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/3
 * Time: 21:01
 */

namespace app\common\model;

use think\Model;
use think\facade\Session;

class Admin extends Model
{
    public function getInfo()
    {
        $order = ['id'=>'asc'];
        $result = $this->order($order)->paginate(5);
        return $result;
    }
    public function addAdmin($data)
    {
        $data['password'] = md5($data['password']);
        $result = $this->allowField(true)->save($data);
        return $result;
    }
    public function change($data)
    {
        $info = $this->find($data['id']);
       //判断登录者是否为超级管理员才有权力修改

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

    public function checkLogin($username,$password)
    {
        $where = ['name'=>$username];
        $info = self::get($where);
        if(is_null($info)) {
            return '该用户不存在';
        } elseif ($info['password'] != $password) {
            return '密码错误';
        } elseif($info['status']==0) {
            return '您的账号已被禁用，请联系管理员！';
        }else {
            $info -> setInc('login_num');
            $info -> save(['last_login'=> time()]);
            Session::set('user_id', $info['name']);
            Session::set('admin_id', $info['id']);
            Session::set('user_info',$info->toArray());
            return 1;
        }
    }

    /**
     * @param $id
     * @return mixed
     * 根据id 查询权限
     */
    public function selectRole() {
        $id = Session::get('admin_id');
        $check = self::get($id);
        return $check["role"];
    }
}