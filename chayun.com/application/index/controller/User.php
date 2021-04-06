<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/29
 * Time: 15:43
 */

namespace app\index\controller;

use think\Db;
use think\facade\Session;
use app\index\common\Base;
use think\cache\driver\Redis;
use think\Facade\Cache;

class User extends Base
{
    //默认密码登录
    public function login()
    {
        $this->alreadyLogin();
        if(request()->isAjax()) {
            $data = input('post.');
            $code = $data['code1'];
            $username = $data['username'];
            $password = md5($data['password']);
            //校验表单数据
            $validata= Validate('Login');
            if(!$validata->scene('')->check($data))
            {
                $this->error($validata->getError());
            }
            $userInfo = model('User')->checkUser($username);
            //var_dump($userInfo);exit;
            if(is_null($userInfo)) {
                $this->error('该用户不存在');
            } elseif($userInfo['status'] == 0){
                $this->error("您的账号涉嫌违规，已被禁用！");
            } elseif ($userInfo['password'] != $password) {
                $this->error('密码不正确');
            } elseif (!captcha_check($code)) {
                $this->error("验证码错误");
            }  else {
                Db::name('user')->where('username',$username)->update(['login_time'=>time()]);
                Session::set('user_name', $userInfo['username']);
                Session::set('user_info',$userInfo->toArray());
                $this->success('登录成功','index/index');
            }
        }
        $this->assign(
            [
                'lists'=>\app\index\common\Base::getNavLists()
            ]
        );
        return $this->fetch();
    }
    //短信登录
    public function smsLogin()
    {
        if(request()->isAjax()) {
            $data =input('post.');
            $validata= Validate('Login2');
            if(!$validata->scene('')->check($data))
            {
                $this->error($validata->getError());
            }
            $code = input('post.code2');
            $phone = input('post.phone');
            $userInfo = model("User")->getinfo($phone);
            if(is_null($userInfo)) {
                $this->error('该手机号未注册');
            }
            if($userInfo['status'] == 0){
                $this->error("您的账号涉嫌违规，已被禁用！");
            }
            $redisCode = Cache::store('redis')->get($code);
            if($redisCode == false) {
                $this->error('验证码不正确');
            } else {
                Db::name('user')->where('phone',$phone)->update(['login_time'=>time()]);
                Session::set('user_name', $userInfo['username']);
                Session::set('user_info',$userInfo->toArray());
                $this->success('登录成功','index/index');
            }
        }
    }
    //退出登录
    public function loginOut()
    {
        Session::delete('user_name');
        Session::delete('user_info');
        //执行成功,并返回登录界面
        $this->redirect('user/login');
    }
    //注册
    public function register()
    {
        if(request()->isAjax()) {
            $data = input('post.');
            $validata= Validate('Regist');
            if(!$validata->scene('')->check($data))
            {
                $this->error($validata->getError());
            }
            $code = $data['code'];
            $data['icon']='20210315\e1a7fad09726d7c5671f043df9b1943b.jpg';
            $redisCode = Cache::store('redis')->get($code);
            if($redisCode == false) {
                return returnJson(0,'验证码不正确');
            }
            $result = model('User')->addUser($data);
            if($result){
                $this->success('注册成功！','user/login');
            }else{
                return returnJson(0,'注册失败，请稍后重试！');
            }
        }
        $this->assign(
            [
                'lists'=>\app\index\common\Base::getNavLists()
            ]
        );
        return $this->fetch();
    }
    //个人中心
    public function index(){
        $this->isLogin();
        $id = input("id");
        //获取地址列表
        $address = Db::name("Address")->where("uid",$id)->select();
        //获取订单列表
        $orderList = Db::name('orders')
            ->alias('o')
            ->join('goods g','o.shopid=g.id')
            ->field('o.id,o.ordernumber,g.picture,o.num,o.total,o.create_time,o.status')
            ->where('o.uid',$id)
            ->where('o.softdelete',0)
            ->select();
        //不同状态下的数据
        $all =count($orderList);
        $notsend = count(Db::name('orders')->where('uid',$id)->where('status',0)->where('softdelete',0)->select());
        $sended = count(Db::name('orders')->where('uid',$id)->where('status',1)->where('softdelete',0)->select());
        $comment = count(Db::name('orders')->where('uid',$id)->where('status',2)->where('softdelete',0)->select());
        //用户相关信息
        $userInfo = Db::table('user')->field('id,username,icon,email')->where('id',$id)->find();
        $this->assign(
            [
                'addressList'=>$address,
                'orderList'=>$orderList,
                'all'=>$all,
                'notsend'=>$notsend,
                'sended'=>$sended,
                'comment'=>$comment,
                'userinfo'=>$userInfo,
                'lists'=>\app\index\common\Base::getNavLists()
            ]);
        return $this->fetch();
    }
    //修改头像
    public function updateIcon(){
        $id = input('id');
        $file = request()->file('file');//获取上传图片
        //var_dump($file);
        if ($file) {
            $info = $file->move('../public/static/uploads');
            if ($info) {
                $img = $info->getSaveName();//获取名称
                Db::table('user')->update(['icon'=>$img,'id'=>$id]);
                return json(['code'=>1,'message'=>$img]);
            } else {
                $this->error("upload error");
            }
        } else {
            $this->error("system error");
        }
    }
    //修改昵称邮箱
    public function resetinfo(){
        $data = input('post.');
        $checkname = Db::table('user')->where('username',$data['username'])->find();
        if($checkname){
            $this->error('该用户名已存在！');
        }
        $result = Db::table('user')->update($data);
        if($result){
            $this->success('保存成功');
        }else{
            $this->error('系统繁忙，请稍后！');
        }
    }


    //修改密码
    public function reset() {
        if(request()->isAjax()) {
            $data = input("post.");
            $validata= Validate('Password');
            if(!$validata->scene('')->check($data))
            {
                $this->error($validata->getError());
            }
            $userInfo = Db::name("User")->where("id",$data["uid"])->find();
            $oldpassword = md5($data['oldpassword']);
            $newpassword = md5($data['password']);
            if($oldpassword == $userInfo['password']){
                $result = Db::name("User")->update(['password'=>$newpassword,'id'=>$data['uid']]);
                if($result){
                    $this->success("密码修改成功，请重新登录！",'user/loginOut');
                }else{
                    $this->error("密码修改失败，请稍后重试！");
                }
            }else{
                $this->error("原密码错误！");
            }
        }else{
            $this->error("非法请求！");
        }
    }
    //提醒发货
    public function remind(){
        if(request()->isPost()) {
            $orderid = input('orderid');
            $redis = new Redis();
            $isExist = $redis->sIsMember("orders",$orderid);
            if($isExist) {
                $this->success('已经提醒商家了！');
            }else{
                $redis->sAdd('orders',$orderid);
                $this->success('发货提醒成功！');
            }
        }
    }
}