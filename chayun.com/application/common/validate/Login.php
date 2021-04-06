<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/3/23
 * Time: 22:44
 */

namespace app\common\validate;


use think\Validate;

class Login extends Validate
{
    protected $rule = [
    'username' => 'require',
    'password' => 'require',
    'code1'=>'require'
];

    protected $message = [
        'username.require'=>'用户名不能为空',
        'password.require'=>'密码不能为空',
        'code1.require'=>'验证码不能为空'
    ];
}