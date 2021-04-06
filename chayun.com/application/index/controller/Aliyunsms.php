<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/29
 * Time: 16:16
 */

namespace app\index\controller;

use think\Controller;
use think\facade\Env;
use think\Facade\Cache;
/**
 * Class Aliyunsms
 * @package app\index\controller
 * 发送验证码
 *
 */
class Aliyunsms extends Controller
{
    /*public function sendCode()
    {
        include Env::get('root_path').'vendor/aliyun_sms/api_demo/SmsDemo.php';

        if(request()->isAjax()) {
            $phone = input('post.phone');
            $status = model("User")->getinfo($phone);
            if($status) {
                return ['code'=>0,'msg'=>'该用户已注册'];
            } else {
                //检测发送间隔
                //$limit = model('Smscode')->limitsend($phone);
                $rand = mt_rand(1000,9999);
                $con = [
                    'rand' => $rand,
                    'phone' => $phone
                ];
                $result = \SmsDemo::sendSms($con);
                if($result->Code == 'OK')
                {
                    $sendtime = time();
                    $expiration = $sendtime + 300;
                    $data = [
                        'phone'=>$phone,
                        'code'=>$rand,
                        'sendtime'=>$sendtime,
                        'expiration'=>$expiration
                    ];
                    $savecode = model("Smscode")->savedata($data);
                    if($savecode) {
                        return ['code'=>1,'msg'=>'验证码发送成功'];
                    } else {
                        return ['code'=>0,'msg'=>'系统错误'];
                    }
                }else {
                    return ['code'=>0,'msg'=>'短信发送失败'];
                }
            }
        }
    }*/
    //注册验证码处理
    public function sendCode()
    {
        include Env::get('root_path').'vendor/aliyun_sms/api_demo/SmsDemo.php';

        if(request()->isAjax()) {
            $phone = input('post.phone');
            if(!$phone){
                return ['code'=>0,'msg'=>'请输入手机号!'];
            }
            $status = model("User")->getinfo($phone);
            if($status) {
                return ['code'=>0,'msg'=>'该用户已注册'];
            } else {
                $rand = mt_rand(1000,9999);
                $con = [
                    'rand' => $rand,
                    'phone' => $phone
                ];
                $result = \SmsDemo::sendSms($con);
                if($result->Code == 'OK')
                {
                    //保存到redis中，五分钟后过期
                    $send = Cache::store('redis')->set($rand,$rand,300);
                    if($send) {
                        return ['code'=>1,'msg'=>'验证码发送成功!'];
                    } else {
                        return ['code'=>0,'msg'=>'redis error!'];
                    }
                }else {
                    return ['code'=>0,'msg'=>'短信发送失败'];
                }
            }
        }
    }
    //短信登录保存验证码到redis
    public function loginCode()
    {
        include Env::get('root_path').'vendor/aliyun_sms/api_demo/SmsDemo.php';

        if(request()->isAjax()) {
            $phone = input('post.phone');
            //这里需要检查表单字段
            $status = model("User")->getinfo($phone);
            if(is_null($status)) {
                return ['code'=>0,'msg'=>'手机号未注册'];
            } else {
                $rand = mt_rand(1000,9999);
                $con = [
                    'rand' => $rand,
                    'phone' => $phone
                ];
                $result = \SmsDemo::sendSms($con);
                if($result->Code == 'OK')
                {
                    //保存到redis中，五分钟后过期
                    $send = Cache::store('redis')->set($rand,$rand,300);
                    if($send) {
                        return ['code'=>1,'msg'=>'验证码发送成功!'];
                    } else {
                        return ['code'=>0,'msg'=>'redis error!'];
                    }
                }else {
                    return ['code'=>0,'msg'=>'短信发送失败'];
                }
            }
        }
    }
    /*public function loginCode()
    {
        include Env::get('root_path').'vendor/aliyun_sms/api_demo/SmsDemo.php';

        if(request()->isAjax()) {
            $phone = input('post.phone');
            //这里需要检查表单字段
            $status = model("User")->getinfo($phone);
            if(is_null($status)) {
                return ['code'=>0,'msg'=>'手机号未注册'];
            } else {
                //检测发送间隔
                //$limit = model('Smscode')->limitsend($phone);
                $rand = mt_rand(1000,9999);
                $con = [
                    'rand' => $rand,
                    'phone' => $phone
                ];
                $result = \SmsDemo::sendSms($con);
                if($result->Code == 'OK')
                {
                    $sendtime = time();
                    $expiration = $sendtime + 300;
                    $data = [
                        'phone'=>$phone,
                        'code'=>$rand,
                        'sendtime'=>$sendtime,
                        'expiration'=>$expiration
                    ];
                    $savecode = model("Smscode")->savedata($data);
                    if($savecode) {
                        return ['code'=>1,'msg'=>'验证码发送成功'];
                    } else {
                        return ['code'=>0,'msg'=>'系统错误'];
                    }
                }else {
                    return ['code'=>0,'msg'=>'短信发送失败'];
                }
            }
        }
    }*/

}