<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/2/23
 * Time: 16:33
 */

namespace app\index\controller;

use think\Db;
/**
 * 订单处理
 * Class Orders
 * @package app\index\controller
 */
class Orders extends \app\index\common\Base
{
    //在购物车提交订单
    public function orderByCar()
    {
        if(request()->isPost()) {
            //是购物车的ids
            $ids = input('post.orderid');
            $uid = input('post.uid');
            $addressid = input('post.addressid');
            $cartIds = explode("@",$ids);
            $orderList = Db::name('cart')
                ->alias('c')
                ->join('goods g','c.shopid=g.id')
                ->field('c.uid,c.shopid,c.num,g.price')
                ->where('c.id','in',$cartIds)
                ->select();
            foreach ($orderList as $item){
                $item['addressid'] = $addressid;
                //生成随机订单号
                $ordernumber = date('YmdHis') . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
                $item['ordernumber'] = $ordernumber;
                $item['total'] = $item['num']*$item['price'];
                $item['create_time'] = time();
                $res = Db::name('orders')->strict(false)->insert($item);
                if($res){
                    Db::table('goods')->where('id',$item['shopid'])->setInc('sales',$item['num']);
                    Db::table('goods')->where('id',$item['shopid'])->setDec('store',$item['num']);
                }else{
                    $this->error($item['ordernumber']);
                    break;
                }
            }
            //下单成功后删除对应购物车
            Db::name('cart')->delete($cartIds);
            $this->success("下单成功",url("user/index",["id"=>$uid]));
        }

    }
    //在商品详情下单
    public function orderByShopId()
    {
        if(request()->isPost()) {
            $this->isLogin();
            $data['uid'] = input('post.uid');
            $data['shopid'] = input('post.orderid'); //商品id
            $data['num'] = input('post.num');
            $data['addressid'] = input('post.addressid');
            $price = Db::name('goods')
                ->field('price')
                ->where('id',$data['shopid'])
                ->find();
            $data['total'] = $price['price']*$data['num'];
            $data['ordernumber'] = date('YmdHis') . str_pad(mt_rand(1, 99999), 5, '0', STR_PAD_LEFT);
            $data['create_time'] = time();
            $res = Db::name('orders')->strict(false)->insert($data);
            if($res){
                Db::table('goods')->where('id',$data['shopid'])->setInc('sales',$data['num']);
                Db::table('goods')->where('id',$data['shopid'])->setDec('store',$data['num']);
            }else{
                $this->error($data['ordernumber']);
            }
            $this->success("下单成功!!!",url("user/index",["id"=>$data["uid"]]));
        }

    }
    //展示订单页面
    public function index()
    {
        if(request()->isGet()) {
            //立即购买传参数 shopid  uid  num
            $shopid = input('get.shopid');
            $num = input('get.num');
            //购物车ids
            $ids = input('get.ids');
            $uid = input('get.uid');
            $all = 0;
            $address = Db::name("Address")->where("uid",$uid)->select();
            //购物车批量下单
            if($ids){
                $cartIds = explode("@",$ids);
                $orderList = Db::name('cart')
                    ->alias('c')
                    ->join('goods g','c.shopid=g.id')
                    ->field('c.id,c.uid,c.num,g.goods_name,g.price,g.weight,g.picture')
                    ->where('c.id','in',$cartIds)
                    ->select();
                foreach ($orderList as $item){
                   $all+=$item['price']*$item['num'];
                }
                $num = -1;
            }else{ //立即购买返回的数据
                $orderList = Db::name('goods')
                    ->field('id,picture,goods_name,price,weight')
                    ->where('id',$shopid)
                    ->select();
                $orderList[0]['num'] = $num;
                $ids = $shopid;
                $all = $num*$orderList[0]['price'];
            }
        }
        $this->assign(
            [
                'orderList'=>$orderList,
                'addressList'=>$address,
                'orderids'=>$ids,       //购物车下单返回批量购物车ids,立即购买时返回商品id
                'num'=>$num,
                'all'=>$all,
                'lists'=>\app\index\common\Base::getNavLists()
            ]
        );
        return $this->fetch();
    }
    //确认收货
    public function confirm() {
        if(request()->isPost()) {
            $orderid = input('post.id');
            $result = Db::name('orders')->where('id',$orderid)->update(['status'=>2]);
            if($result){
                //发送邮件
                $this->success('确认收货！');
            }else{
                $this->error('状态修改失败');
            }
        }else{
            $this->error('非法请求！');
        }
    }
    //用户软删除
    public function softdel(){
        $id = input('id');
        $status = Db::table('orders')->field('status')->where('id',$id)->find();
        if($status['status'] != 3){
            $this->error('订单还没交易完成！');
        }
        $result = Db::table('orders')->update(['softdelete'=>1,'id'=>$id]);
        if($result){
            $this->success('已删除！');
        }
    }
}