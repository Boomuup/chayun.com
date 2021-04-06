<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/11
 * Time: 15:50
 */

namespace app\common\model;

use think\Model;
use think\facade\Session;

class Category extends Model
{
    protected $pk = 'cid';
    public function add($data)
    {
        $result = $this->allowField(true)->save($data);
        return $result;
    }
    public function cateTree()
    {
        $data = $this->select();
        if($data) {
            $result = $this->cateSort($data);
            return $result;
        }
    }

    public function cateSort($data,$pid = 0,$level = 0)
    {
        static $arr = [];
        foreach ($data as $key=>$value) {
            if($value['pid'] == $pid) {
                $value['level'] = $level;
                $arr[] = $value;
                $this->cateSort($data,$value['cid'],$level+1);
            }
        }
        return $arr;
    }
    public function change($data)
    {

        //此处补充功能：单他是父级分类时 禁用后 子分类也要被禁用了
        // to do ......


        $info = $this->find($data['cid']);
        //判断登录者是否为超级管理员才有权力修改
        $info->status=$data['status'];
        $result = $info->save();
        return $result;
    }
    public function del($cid)
    {
        $check = self::get($cid);
        if(is_null($check)) {
             return '非法参数';
        }
        $userInfo = Session::get('user_info');
        if($userInfo['role']==0) {
             return '权限不够';
        }
        return $check->delete();
    }
    public function getone($cid)
    {
        $category = $this->find($cid);
        $parent = $this->find($category['pid']);
        $category["pname"] = $parent['cname'];
        return $category;
    }
    public function updateone($data)
    {
        $info = self::get($data['cid']);
        $info->pid = $data['pid'];
        $info->cname = $data['cname'];
        return $info->save();
    }
    //导航分类处理
    public function getCateList()
    {

    }
}