<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/2
 * Time: 14:59
 */

namespace app\admin\controller;

use app\admin\common\Base;
use think\captcha\Captcha;
use think\facade\Session;

class Login extends Base
{
    public function index()
    {
        $this -> alreadyLogin();
        return $this->fetch('login');
    }

    public function showCode()
    {
        $config  = [
            'fontSize' => 30,
            'length' => 3,
            'useCurve' => false,
            'useNoise' => false,
            'codeSet' => '023456789'
        ];
        $captcha = new Captcha($config);
        return $captcha->entry();
    }

    public function check()
    {
        if(request()->isAjax()) {
            $data = input('post.');
            $validata= Validate('Admin');
            if(!$validata->scene('')->check($data))
            {
                $this->error($validata->getError());
            }
            $username = input('post.name');
            $password = md5(input('post.password'));
            $result = model('Admin')->checkLogin($username,$password);
            if($result==1) {
                $this->success("登录成功",'index/index');
            }else {
                $this->error($result,'login/index');
            }
        } else {
            $this->error('非法请求','login/index');
        }
    }
    public function loginOut()
    {
        Session::delete('user_id');
        Session::delete('user_info');
        Session::delete('admin_id');

        //执行成功,并返回登录界面
        $this->redirect('login/index');
    }
}