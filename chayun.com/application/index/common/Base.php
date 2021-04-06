<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/29
 * Time: 15:47
 */
namespace app\index\common;

use think\Controller;
use think\facade\Session;
use think\Db;

class Base extends Controller
{
    public function _initialize()
    {
        parent::_initialize();
    }
    public function isLogin()
    {
        if(is_null(Session::get('user_name'))) {
            $this->redirect('user/login');
        }
    }
    public function alreadyLogin()
    {
        if (!is_null(Session::get('user_name'))) {
            $this->redirect('index/index');
        }
    }

    public static function getNavLists()
    {
        $navList = Db::table('Category')
            ->where('pid',0)
            ->where('status',1)
            ->select();
        //print_r($navList);
        $lists = [];
        foreach ($navList as $data) {
            $children = Db::table('Category')->where('pid',$data['cid'])->where('status',1)->select();
            //print_r($children);
            $data['children'] = $children;
            $lists[] = $data;
        }
        return $lists;
    }
    public static function bannerShow(){
        $banner = Db::table('banner')
            ->where('status',1)
            ->select();
        return $banner;
    }
}