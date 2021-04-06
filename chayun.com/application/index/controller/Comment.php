<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/3/14
 * Time: 19:01
 */

namespace app\index\controller;


use think\Db;

class Comment extends \app\index\common\Base
{
    public function index(){
        $orderid = input('orderid');
        $info = Db::table('orders')
            ->alias('o')
            ->join('goods g','g.id=o.shopid')
            ->field('g.goods_name,g.weight,o.ordernumber,g.picture,g.unit,o.uid,o.shopid')
            ->where('o.id',$orderid)
            ->find();
        $this->assign(
            [
                'orderid'=>$orderid,
                'info'=>$info,
                'lists'=>\app\index\common\Base::getNavLists()
            ]
        );
        return $this->fetch();
    }
    //添加评论
    public function add(){
        $data = input('post.');
        $data['comment_time'] = time();
        $affected = Db::table('comment')->insert($data);
        if($affected){
            Db::table('orders')->update(['status'=>3,'id'=>$data['orderid']]);
            $this->success('发布成功！',url("user/index",["id"=>$data["uid"]]));
        }else{
            $this->error("发布出错，请稍后~");
        }
    }


    public function uploadImg()
    {
        $file = request()->file('file');
        //var_dump($file);
        if ($file) {
            $info = $file->move('../public/static/uploads');
            if ($info) {
                $img = $info->getSaveName();
                return json(['code'=>1,'message'=>$img]);
            } else {
                $this->error("upload error");
            }
        } else {
            $this->error("system error");
        }
    }
}