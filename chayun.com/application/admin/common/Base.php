<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/9
 * Time: 9:33
 */

namespace app\admin\common;


use think\Controller;
use think\facade\Session;

class Base extends Controller
{
    public function _initialize()
    {
        parent::_initialize();
        //$this->isLogin();
    }
    public function isLogin()
    {
        if(is_null(Session::get('user_id'))) {
            //$this->error("请登录后访问",'login/index');
            $this->redirect('login/index');
        }
    }
    public function alreadyLogin()
    {
        if (!is_null(Session::get('user_id'))) {
            $this->redirect('index/index');

        }
    }
}