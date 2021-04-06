<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/2/27
 * Time: 22:08
 */

namespace app\admin\controller;

use app\admin\common\Base;
use think\Db;

class Recycle extends Base
{
    //显示软删除的商品
    public function index()
    {
        $goodsInfo = model('Goods')->softList();

        $sum = $goodsInfo->total();
        $this->assign(
            ['goods'=>$goodsInfo,
                'sum' => $sum
            ]
        );
        return $this->fetch();
    }
    public function del()
    {
        if(request()->post()) {
            $id = input('post.id');
            $result = model('Goods')->del($id);
            if ($result) {
                $this->success("彻底删除成功！");
            }else{
                $this->error("彻底删除失败！");
            }
        }
    }
    public function recover()
    {
        if(request()->post()) {
            $id = input('post.id');
            $result = model('Goods')->renew($id);
            if ($result) {
                $this->success("恢复成功！");
            }else{
                $this->error("恢复失败！");
            }
        }
    }
    public function delall(){
        $ids = input('ids');
        $ids = explode("@",$ids);
        $result = Db::table('goods')->where('id','in',$ids)->delete();
        if($result){
            $this->success('删除成功！');
        }else{
            $this->error('删除失败');
        }
    }
}