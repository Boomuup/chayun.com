<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/1/5
 * Time: 22:08
 */

namespace app\index\controller;

use app\index\common\Base;
use Think\Db;

class Cart extends Base
{
    public function index()
    {
        $this->isLogin();
        if(request()->isGet()) {
            $id = input('id');
            $res = Db::name('cart')
                ->alias('c')
                ->join('goods g','c.shopid=g.id')
                ->field('c.id,c.uid,c.num,g.goods_name,g.price,g.picture')
                ->where('uid',$id)
                ->select();
            //var_dump($res);
            //$cart = model('Cart')->getCart($id);
            $this->assign(
                [   'cart'=>$res,
                    'lists'=>\app\index\common\Base::getNavLists()
                ]
            );
            $this->assign('empty','<div class="car-empty">购物车空空如也！快去购物吧~~</div>');
        }
        return $this->fetch();
    }
    public function add()
    {
        $this->isLogin();
        if(request()->isPost()) {
            $data = input('post.');
            $result = model('Cart')->addCart($data);
            if($result) {
                $this->success("添加购物车成功");
            } else {
                $this->error('购物车添加失败');
            }
        }
    }
    public function subnum()
    {
        if(request()->isPost()) {
            $id = input('post.id');
            $car = Db::name('Cart')->where('id',$id)->field("num")->select();
            //var_dump("现在商品数量");
            //var_dump($car[0]['num']);
            if($car[0]['num'] == 1){
                $this->error("商品数量最少为1件");
            }
            $result = Db::name('Cart')->where('id',$id)->setDec('num');
            if($result) {
                $this->success('sub success');
            } else {
                $this->error('sub filed');
            }
        }
    }
    public function addnum()
    {
        if(request()->isPost()) {
            $id = input('post.id');
            $result = Db::name('Cart')->where('id',$id)->setInc('num');
            if($result) {
                $this->success('add success');
            } else {
                $this->error('add filed');
            }
        }
    }

    public function del()
    {
        if(request()->isPost()) {
            $id = input('post.id');
            $result = Db::name('Cart')->where('id',$id)->delete();
            if($result) {
                $this->success('delete success');
            } else {
                $this->error('delete filed');
            }
        }
    }
}