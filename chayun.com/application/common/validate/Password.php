<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/3/23
 * Time: 22:45
 */

namespace app\common\validate;


use think\Validate;

class Password extends Validate
{
    protected $rule = [
        'oldpassword' => 'require',
        'password' => 'require|min:6|max:12|confirm',

    ];

    protected $message = [
        'oldpassword.require'=>"请输入原始密码",
        'password.require'=>'新密码不能为空',
        'password.min'=>'新密码长度为6~12个字符',
        'password.max'=>'新密码长度为6~12个字符',
        'password.confirm'=>'两次密码不一致',
    ];
}