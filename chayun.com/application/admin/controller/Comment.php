<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/3/15
 * Time: 21:25
 */

namespace app\admin\controller;


use think\Db;

class comment extends \app\admin\common\Base
{
    public function index(){
        $comment = Db::table('goods')
            ->alias('g')
            ->join('comment c','c.shopid=g.id')
            ->join('user u','u.id=c.uid')
            ->field('c.id,u.username,g.goods_name,c.score,c.desc,c.picture,c.comment_time')
            ->where('isreply',0)
            ->order('comment_time desc')
            ->paginate(8);
        $this->assign(['comment'=>$comment]);
        return $this->fetch();
    }
    public function reply(){
        $id = input('id');
        $username = input('username');
        $this->assign(['id'=>$id,'username'=>$username]);
        return $this->fetch();
    }
    public function save(){
        $data = input('post.');
        $res = Db::name('comment')->update(['reply'=>$data['reply'],'reply_time'=>time(),'isreply'=>1,'id'=>$data['id']]);
        if($res){
            $this->success('发布成功！');
        }else{
            $this->error('发布失败！');
        }
    }
    public function del(){
        $id = input('post.id');
        $result = Db::table("comment")->where('id',$id)->delete();
        if($result){
            $this->success('删除成功！');
        }else{
            $this->error('删除失败！');
        }
    }
}