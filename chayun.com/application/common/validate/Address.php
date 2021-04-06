<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/3/23
 * Time: 23:35
 */

namespace app\common\validate;


use think\Validate;

class Address extends Validate
{
    protected $rule = [
        'name' => 'require',
        'phone' => 'require',
        'detailinfo'=>'require'

    ];

    protected $message = [
       'name.require'=>'姓名不能为空',
       'phone.require'=>'电话号码不能为空',
       'detailinfo.require'=>'请输入详细地址',
    ];
}