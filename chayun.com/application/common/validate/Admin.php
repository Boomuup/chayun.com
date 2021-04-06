<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/7
 * Time: 15:16
 */

namespace app\common\validate;


use think\Validate;

class Admin extends Validate
{
    protected $rule = [
        'name' => 'require',
        'password' => 'require',
    ];

    protected $message = [
        'name.require'=>'用户名不能为空',
        'password.require'=>'密码不能为空',
    ];
}