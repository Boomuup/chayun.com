<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/3/23
 * Time: 23:20
 */

namespace app\common\validate;


use think\Validate;

class Login2 extends Validate
{
    protected $rule = [
        'phone' => 'require',
        'code2' => 'require',
    ];

    protected $message = [
        'phone.require'=>'手机号不能为空',
        'code2.require'=>'短信验证码不能为空',
    ];
}