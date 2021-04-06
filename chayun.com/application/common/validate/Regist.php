<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/3/23
 * Time: 22:45
 */

namespace app\common\validate;


use think\Validate;

class Regist extends Validate
{
    protected $rule = [
        'username' => 'require|max:10',
        'email'=>'email|require',
        'password' => 'require|min:6|max:12|confirm',
        'phone'=>'require',
        'code'=>'require'
    ];

    protected $message = [
        'username.require'=>'用户名不能为空',
        'username.max'=>'用户名不能超过10个字符',
        'email.email'=>'请输入正确的邮箱',
        'email.require'=>'邮箱不能为空',
        'password.require'=>'密码不能为空',
        'password.min'=>'密码长度为6~12个字符',
        'password.max'=>'密码长度为6~12个字符',
        'password.confirm'=>'两次密码不一致',
        'phone.require'=>'电话号码不能为空',
        'code.require'=>'验证码不能为空',


    ];
}