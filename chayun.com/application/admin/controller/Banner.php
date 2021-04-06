<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/2/20
 * Time: 14:15
 */

namespace app\admin\controller;


use think\Controller;
use think\Db;
use think\Model;

class Banner extends Controller
{
    public function bannerlist()
    {
        $list = model('Banner')->getInfo();
        $total = $list->total();
        $this->assign([
            'bannerlist'=>$list,
            'total'=>$total
        ]);
        return $this->fetch();
    }

    public function add()
    {
        if(request()->isAjax())
        {
            //防止xss攻击 对值进行过滤
            $data = input('post.','','htmlentities');
            //后台数据校验
           /* $validate = Validate('Banner');
            if(!$validate->check($data)) {
                $this->error($validate->getError());
            }*/
            $result = model('Banner')->addBanner($data);
            if($result){
                $this->success('添加成功!');
            }else{
                $this->error('添加失败！');
            }
        }
        return $this->fetch();

    }

    public function changeStatus()
    {
        if(request()->post()) {
            $data = [
                'id' => input('post.id'),
                'status' => input('post.status') ? 0 : 1
            ];
            $result = model('Banner')->change($data);
            if($result) {
                $this->success('状态修改成功');
            }else {
                $this->error('状态修改失败');
            }
        }
    }

    public function edit(){
        $id = input('id');
        $data = Db::table('banner')->where('id',$id)->find();
        $this->assign(['data'=>$data]);
        if(request()->isPost()){
            $data = input('post.');
            $data['update_time']=time();
            $result = model('banner')::where('id',$data['id'])->update($data);
            if($result){
                $this->success("保存成功！");
            }else{
                $this->error("保存失败！");
            }
        }
        return $this->fetch();
    }
    public function del()
    {
        if(request()->post()) {
            $id = input('post.id');
            $role = model('Admin')->selectRole();
            if($role == 0){
                $this->error('您没有权限');
            }
            $result = model('Banner')->del($id);
            if($result) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        }
    }
    public function delall(){
        $ids = input('ids');
        $ids = explode("@",$ids);
        $result = Db::table('banner')->where('id','in',$ids)->delete();
        if($result){
            $this->success('删除成功！');
        }else{
            $this->error('删除失败');
        }
    }
}