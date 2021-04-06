<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/1/4
 * Time: 22:52
 */

namespace app\index\controller;

use think\cache\driver\Redis;
use app\index\common\Base;
use think\Db;

class Detail extends Base
{
    public function index()
    {
        if(request()->isGet()) {
            $id = input('id');
            $shopDetail = model('Goods')->getInfo($id);
            $this->comment($id);
            $this->assign(
                [   'goods'=>$shopDetail,
                    'lists'=>\app\index\common\Base::getNavLists()
                ]
            );

        }
        return $this->fetch();
    }
    //降价通知
    public function inform() {
        if(request()->isPost()) {
            $shopid = "shop".input('shopid');
            $uid = input('id');
            $redis = new Redis();
            $isExist = $redis->sIsMember($shopid,$uid);
            if($isExist) {
                $this->success('已经提醒了，降价会立刻通知你哦！');
            }else{
                $redis->sAdd($shopid,$uid);
                $this->success('商品降价后我们会以邮件通知你哦！');
            }
        }
    }
    //获取评论信息
    public function comment($id){
        $allComment = Db::table('comment')
            ->alias('c')
            ->join('user u','c.uid=u.id')
            ->field('u.username,c.score,c.desc,c.comment_time,c.picture,c.reply,c.isreply,u.icon')
            ->where('c.shopid',$id)
            ->order('comment_time desc')
            ->select();
        $all = count($allComment);
        $good = Db::table('comment')
            ->alias('c')
            ->join('user u','c.uid=u.id')
            ->field('u.username,c.score,c.desc,c.comment_time,c.picture,c.reply,c.isreply,u.icon')
            ->where('c.shopid',$id)
            ->where('c.score','in',[4,5])
            ->order('comment_time desc')
            ->select();
        $goodtotal = count($good);
        //好评率
        if($all == 0){
            $gpercent = 0;
        }else{
            $gpercent = round($goodtotal/$all,2)*100;
        }

        $medium = Db::table('comment')
            ->alias('c')
            ->join('user u','c.uid=u.id')
            ->field('u.username,c.score,c.desc,c.comment_time,c.picture,c.reply,c.isreply,u.icon')
            ->where('c.shopid',$id)
            ->where('c.score',3)
            ->order('comment_time desc')
            ->select();
        $mediumtotal = count($medium);
        //中评率
        if($all == 0){
            $mpercent = 0;
        }else{
            $mpercent = round($mediumtotal/$all,2)*100;
        }
        $bad = Db::table('comment')
            ->alias('c')
            ->join('user u','c.uid=u.id')
            ->field('u.username,c.score,c.desc,c.comment_time,c.picture,c.reply,c.isreply,u.icon')
            ->where('c.shopid',$id)
            ->where('c.score','in',[1,2])
            ->order('comment_time desc')
            ->select();
        $badtotal = count($bad);
        //好评率
        if($all == 0){
            $bpercent = 0;
        }else{
            $bpercent = round($badtotal/$all,2)*100;
        }
        $this->assign(
            [
                'all'=>$allComment,
                'good'=>$good,
                'medium'=>$medium,
                'bad'=>$bad,
                'sum'=>$all,
                'goodtotal'=>$goodtotal,
                'mediumtotal'=>$mediumtotal,
                'badtotal'=>$badtotal,
                'gpercent'=>$gpercent,
                'mpercent'=>$mpercent,
                'bpercent'=>$bpercent
            ]
        );
    }
}