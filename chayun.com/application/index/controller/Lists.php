<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/3/2
 * Time: 21:21
 */

namespace app\index\controller;


use think\Controller;
use think\Db;

class Lists extends Controller
{
    public function index()
    {
        if(request()->isGet()) {
            $cid = input('cid');
            $checkPid = Db::table("Category")->where('cid',$cid)->field("pid")->find();
            if($checkPid['pid'] == 0){
                $res = Db::name('Category')
                    ->alias('c')
                    ->join('goods g','c.cid=g.cate_id')
                    ->field('g.id,g.goods_name,g.price,g.picture,g.sales')
                    ->where('pid',$cid)
                    ->where('g.status',1)
                    ->where('softdel',0)
                    ->paginate(12);
                $this->assign(
                    ['cateList'=>$res]
                );
            }else{
                $res = Db::name('Category')
                    ->alias('c')
                    ->join('goods g','c.cid=g.cate_id')
                    ->field('g.id,g.goods_name,g.price,g.picture,g.sales')
                    ->where('cate_id',$cid)
                    ->where('g.status',1)
                    ->where('softdel',0)
                    ->paginate(12);
                $this->assign(
                    ['cateList'=>$res]
                );
            }
            $this->assign(
                [
                    'lists'=>\app\index\common\Base::getNavLists(),
                    'cid'=>$cid,
                    'hotorder'=>'desc',
                    'priceorder'=>'desc',
                    'timeorder'=>'desc',
                    'like'=>'0'
                ]
            );
        }
        return $this->fetch();
    }
    //销量
    public function hot(){
        $like = input('like');
        $order = input('hotorder');
        if($order == "desc"){
            $new = "asc";
        }else{
            $new = "desc";
        }
        $cid = input('cid');
        if($cid != -1){
            $checkPid = Db::table("Category")->where('cid',$cid)->field("pid")->find();
            if($checkPid['pid'] == 0){
                $res = Db::name('Category')
                    ->alias('c')
                    ->join('goods g','c.cid=g.cate_id')
                    ->field('g.id,g.goods_name,g.price,g.picture,g.sales')
                    ->where('pid',$cid)
                    ->where('g.status',1)
                    ->where('softdel',0)
                    ->order('sales',$order)
                    ->paginate(12);
                $this->assign(
                    ['cateList'=>$res,'cid'=>$cid,'hotorder'=>$new,'like'=>0,'priceorder'=>'desc','timeorder'=>'desc','lists'=>\app\index\common\Base::getNavLists()]
                );
            }else{
                $res = Db::name('Category')
                    ->alias('c')
                    ->join('goods g','c.cid=g.cate_id')
                    ->field('g.id,g.goods_name,g.price,g.picture,g.sales')
                    ->where('cate_id',$cid)
                    ->where('g.status',1)
                    ->where('softdel',0)
                    ->order('sales',$order)
                    ->paginate(12);
                $this->assign(
                    ['cateList'=>$res,'cid'=>$cid,'hotorder'=>$new,'like'=>0,'priceorder'=>'desc','timeorder'=>'desc','lists'=>\app\index\common\Base::getNavLists()]
                );
            }
        }else{
            $catelist = Db::table('goods')->where('goods_name','like',$like)->where('status',1)->where('softdel',0)->order('sales',$order)->paginate(12);
            $this->assign(
                ['cateList'=>$catelist,'cid'=>-1,'hotorder'=>$new,'like'=>$like,'priceorder'=>'desc','timeorder'=>'desc','lists'=>\app\index\common\Base::getNavLists()]
            );
        }
        return $this->fetch('index');
    }
    public function time(){
        $like = input('like');
        $order = input('timeorder');
        if($order == "desc"){
            $new = "asc";
        }else{
            $new = "desc";
        }
        $cid = input('cid');
        if($cid != -1){
            $checkPid = Db::table("Category")->where('cid',$cid)->field("pid")->find();
            if($checkPid['pid'] == 0){
                $res = Db::name('Category')
                    ->alias('c')
                    ->join('goods g','c.cid=g.cate_id')
                    ->field('g.id,g.goods_name,g.price,g.picture,g.sales')
                    ->where('pid',$cid)
                    ->where('g.status',1)
                    ->where('softdel',0)
                    ->order('g.create_time',$order)
                    ->paginate(12);
                $this->assign(
                    ['cateList'=>$res,'cid'=>$cid,'hotorder'=>"desc",'like'=>0,'priceorder'=>'desc','timeorder'=>$new,'lists'=>\app\index\common\Base::getNavLists()]
                );
            }else{
                $res = Db::name('Category')
                    ->alias('c')
                    ->join('goods g','c.cid=g.cate_id')
                    ->field('g.id,g.goods_name,g.price,g.picture,g.sales')
                    ->where('cate_id',$cid)
                    ->where('g.status',1)
                    ->where('softdel',0)
                    ->order('g.create_time',$order)
                    ->paginate(12);
                $this->assign(
                    ['cateList'=>$res,'cid'=>$cid,'hotorder'=>"desc",'like'=>0,'priceorder'=>'desc','timeorder'=>$new,'lists'=>\app\index\common\Base::getNavLists()]
                );
            }
        }else{
            $catelist = Db::table('goods')->where('goods_name','like',$like)->where('status',1)->where('softdel',0)->order('create_time',$order)->paginate(12);
            $this->assign(
                ['cateList'=>$catelist,'cid'=>-1,'hotorder'=>"desc",'like'=>$like,'priceorder'=>'desc','timeorder'=>$new,'lists'=>\app\index\common\Base::getNavLists()]
            );
        }
        return $this->fetch('index');
    }
    public function price(){
        $like = input('like');
        $order = input('priceorder');
        if($order == "desc"){
            $new = "asc";
        }else{
            $new = "desc";
        }
        $cid = input('cid');
        if($cid != -1){
            $checkPid = Db::table("Category")->where('cid',$cid)->field("pid")->find();
            if($checkPid['pid'] == 0){
                $res = Db::name('Category')
                    ->alias('c')
                    ->join('goods g','c.cid=g.cate_id')
                    ->field('g.id,g.goods_name,g.price,g.picture,g.sales')
                    ->where('pid',$cid)
                    ->where('g.status',1)
                    ->where('softdel',0)
                    ->order('price',$order)
                    ->paginate(12);
                $this->assign(
                    ['cateList'=>$res,'cid'=>$cid,'hotorder'=>"desc",'like'=>0,'priceorder'=>$new,'timeorder'=>'desc','lists'=>\app\index\common\Base::getNavLists()]
                );
            }else{
                $res = Db::name('Category')
                    ->alias('c')
                    ->join('goods g','c.cid=g.cate_id')
                    ->field('g.id,g.goods_name,g.price,g.picture,g.sales')
                    ->where('cate_id',$cid)
                    ->where('g.status',1)
                    ->where('softdel',0)
                    ->order('price',$order)
                    ->paginate(12);
                $this->assign(
                    ['cateList'=>$res,'cid'=>$cid,'hotorder'=>"desc",'like'=>0,'priceorder'=>$new,'timeorder'=>'desc','lists'=>\app\index\common\Base::getNavLists()]
                );
            }
        }else{
            $catelist = Db::table('goods')->where('goods_name','like',$like)->where('status',1)->where('softdel',0)->order('price',$order)->paginate(12);
            $this->assign(
                ['cateList'=>$catelist,'cid'=>-1,'hotorder'=>"desc",'like'=>$like,'priceorder'=>$new,'timeorder'=>'desc','lists'=>\app\index\common\Base::getNavLists()]
            );
        }
        return $this->fetch('index');
    }
    //模糊查询
    public function likeList(){
        $like = input('like');
        $catelist = Db::table('goods')->where('goods_name','like',$like)->where('status',1)->where('softdel',0)->paginate(12);
        $this->assign(
            [
                'lists'=>\app\index\common\Base::getNavLists(),
                'cid'=>-1,
                'hotorder'=>'desc',
                'priceorder'=>'desc',
                'timeorder'=>'desc',
                'like'=>$like,
                'cateList'=>$catelist
            ]
        );
        return $this->fetch('index');
    }
}