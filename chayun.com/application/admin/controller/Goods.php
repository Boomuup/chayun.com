<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/14
 * Time: 16:37
 */

namespace app\admin\controller;

use phpmailer\PHPMailer;
use think\Cache;
use think\cache\driver\Redis;
use app\admin\common\Base;
use think\Db;

class Goods extends Base
{
    //show goods list
    public function index()
    {
        $mark = input('mark');
        if($mark == -1) {
            $goodsInfo = model('Goods')->showList(100);
        }else{
            $goodsInfo = model('Goods')->showList();
        }
        $sum = $goodsInfo->total();
        $this->assign(
            ['goods'=>$goodsInfo,
              'sum' => $sum
                ]
        );
        return $this->fetch('goods_list');
    }
    //add goods
    public function create()
    {
        if(request()->post()) {
            $data = input('post.','','htmlentities');
            //需要Validate对字段进行验证
            $result = model('Goods')->add($data);
            if($result == 1) {
                $this->success("商品添加成功！");
            } else {
                $this->error("商品添加失败！");
            }
        }
        $cate = model('Category')->cateTree();
        $this->assign(
            ['cate'=>$cate]
        );
        return $this->fetch();
    }
    //update和降价进行邮件通知
    public function updateGoods(){
        $id = input('id');
        $goodsInfo = Db::name('goods')
            ->alias('g')
            ->join('category c','g.cate_id = c.cid')
            ->where('g.id',$id)
            ->find();
        $cate = model('Category')->cateTree();
        if(request()->isPost()) {
            $data = input('post.');
            $before = Db::name('goods')->where('id',$data['id'])->field('price')->find();
            $newprice = $data['price'];
            $result = Db::name('goods')->where('id',$data['id'])->update($data);
            if($result){
                if($before['price'] > $newprice){
                    $redis = new Redis();
                    $shopid = "shop".$data['id'];
                    $users = $redis->sMembers($shopid);
                    if($users){
                        $userInfo = Db::name('user')->field('id,username,email')->where('id','in',$users)->select();
                        foreach ($userInfo as $item){
                            $content = "Hi!".$item['username'].",您关注的"."\"".$data['goods_name']."\""."已经降价啦！"."<a href='http://chayun.com/detail/index/id/".$data['id'].".html'>点击速看</a>";
                            sendemail($item['email'],'商品降价通知',$content,$item['username']);
                            $redis->sRem($shopid,$item['id']);
                        }
                    }
                }
                $this->success('修改成功');
            }else{
                $this->error('修改失败');
            }

        }
        $this->assign(
            [
                'info'=>$goodsInfo,
                'cate'=>$cate
            ]
        );
        return $this->fetch("update");
    }

    //soft del
    public function del()
    {
        if(request()->post()) {
            $id = input('post.id');
            $result = model('Goods')->softDelete($id);
            if ($result) {
                $this->success("删除成功！");
            }else{
                $this->error("删除失败！");
            }
        }
    }
    //change status
    public function changeStatus()
    {
        if(request()->post()) {
            $data = [
                'id' => input('post.id'),
                'status' => input('post.status') ? 0 : 1
            ];
            $result = Db::table('goods')->where('id',$data['id'])->update(['status'=>$data['status']]);
            if($result) {
                $this->success('修改成功');
            }else {
                $this->error('修改失败');
            }
        }
    }
    //上传图片
    public function uploadImg()
    {
        $file = request()->file('file');//获取上传图片
        //var_dump($file);
        if ($file) {
            $info = $file->move('../public/static/uploads');
            if ($info) {
                $img = $info->getSaveName();//获取名称
                return json(['code'=>1,'message'=>$img]);
            } else {
                $this->error("upload error");
            }
        } else {
            $this->error("system error");
        }
    }
    public function delall(){
        $ids = input('ids');
        $ids = explode("@",$ids);
        $result = Db::table('goods')->where('id','in',$ids)->update(['softdel'=>1]);
        if($result){
            $this->success('删除成功！');
        }else{
            $this->error('删除失败');
        }
    }

}