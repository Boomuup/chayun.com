<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/3/10
 * Time: 15:15
 */

namespace app\admin\controller;


use think\Controller;
use think\Db;
use think\cache\driver\Redis;

class Orders extends Controller
{
    public function index() {
        $mark = input('mark');
        if($mark == -1){
            $redis = new Redis();
            $orderInfo = $redis->sMembers("orders");
            $orderList = Db::table('orders')
                ->alias('o')
                ->join('goods g','g.id = o.shopid')
                ->join('address a','a.id = o.addressid')
                ->field('o.id,g.goods_name,g.price,o.uid,o.num,o.ordernumber,o.total,o.create_time,a.province,a.city,a.district,a.detailinfo,a.name,a.phone')
                ->where('o.id','in',$orderInfo)
                ->where('o.status',0)
                ->paginate();
        }else{
            $orderList = Db::table('orders')
                ->alias('o')
                ->join('goods g','g.id = o.shopid')
                ->join('address a','a.id = o.addressid')
                ->field('o.id,g.goods_name,g.price,o.uid,o.num,o.ordernumber,o.total,o.create_time,a.province,a.city,a.district,a.detailinfo,a.name,a.phone')
                ->where('o.status',0)
                ->paginate();
        }
        $this->assign(['orderList'=>$orderList]);
        return $this->fetch();
    }
    public function send() {
        if(request()->isPost()) {
            $orderid = input('post.id');
            $result = Db::name('orders')->where('id',$orderid)->update(['status'=>1]);
            if($result){
                $redis = new Redis();
                $isExist = $redis->sIsMember("orders",$orderid);
                if($isExist){
                    $redis->sRem("orders",$orderid);
                }
                $info = Db::name('orders')
                    ->alias('o')
                    ->join('user u','u.id = o.uid')
                    ->join('goods g','g.id = o.shopid')
                    ->field('u.email,u.username,g.goods_name,g.id')
                    ->where('o.id',$orderid)
                    ->find();
                //????????????
                $content = "?????????".$info['username']."!????????????"."\"".$info['goods_name']."\""."?????????????????????!"."<a href='http://chayun.com/detail/index/id/".$info['id'].".html'>????????????</a>";
                $sendemail = sendemail($info['email'],'??????????????????',$content,$info['username']);
                if($sendemail != 1){
                    $this->error("????????????????????????????????????");
                }else{
                    $this->success('??????????????????????????????~');
                }

            }else{
                $this->error('????????????????????????');
            }
        }else{
            $this->error('???????????????');
        }
    }

}