<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/3/8
 * Time: 9:02
 */

namespace app\index\controller;

use app\index\common\Base;
use Think\Db;

class Address extends Base
{
    public function add(){
        if(request()->isAjax()){
            $data = input('post.');
            $validata= Validate('Address');
            if(!$validata->scene('')->check($data))
            {
                $this->error($validata->getError());
            }
            $affectedId = Db::name('address')->insertGetId($data);
            if($affectedId){
                $this->success("地址添加成功!",'',$affectedId);
            }else {
                $this->error("地址添加失败,请稍后重试！");
            }
        }
    }
    public function update(){
        if(request()->isPost()){
            $datas = input('post.');
            $result = Db::table('address')->where('id',$datas['id'])->update($datas);
            if($result){
                $this->success("保存成功！");
            }else{
                $this->error('系统错误，请稍后！');
            }
        }
        $id = input('id');
        $data = Db::table('address')
            ->where('id',$id)
            ->find();
        $this->assign(['data'=>$data]);
        return $this->fetch('update');
    }
    public function del(){
        $id = input('post.id');
        $result = Db::table('address')->where('id',$id)->delete();
        if($result){
            $this->success("已删除！");
        }else{
            $this->error('系统错误，请稍后！');
        }
    }
}