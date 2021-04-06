<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/3
 * Time: 19:53
 */

namespace app\admin\controller;

use think\Controller;
use think\Db;

class Admin extends Controller
{

    public function adminlist()
    {
        $list = model('Admin')->getInfo();
        $total = $list->total();
        $this->assign([
        'adminlist'=>$list, 'total'=>$total
         ]);
        return $this->fetch();
    }
    /**
     * 添加管理员
     * @return mixed
     */
    public function add()
    {
        if(request()->isAjax())
        {
            //防止xss攻击 对值进行过滤
            $data = input('post.','','htmlentities');
            //后台数据校验
            $validate = Validate('Admin');
            if(!$validate->check($data)) {
                $this->error($validate->getError());
            }
            $result = model('Admin')->addAdmin($data);
            if($result){
                $this->success('添加成功！');
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
            $role = model('Admin')->selectRole();
            if($role == 0){
                $this->error('您没有权限');
            }
            $result = model('Admin')->change($data);
            if($result) {
                 $this->success('修改成功');
            }else {
                 $this->error('修改失败');
            }
        }
    }
    public function edit(){
        $role = model('Admin')->selectRole();
        if($role == 0){
            $this->error('您没有权限修改');
        }
        $id = input('id');
        $data = model('Admin')::get($id);
        $this->assign('data',$data);
        if(request()->isPost()){
            $data = input('post.');
            $result = model('Admin')::where('id',$data['id'])->update($data);
            if($result) {
                $this->success('保存成功');
            }else {
                $this->error('保存失败');
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
            $result = model('Admin')->del($id);
            if($result) {
                $this->success('删除成功');
            } else {
                $this->error('删除失败');
            }
        }
    }
    public function delall(){
        $ids = input('ids');
        $role = model('Admin')->selectRole();
        if($role == 0){
            $this->error('您没有权限');
        }
        $ids = explode("@",$ids);
        $result = Db::table('admin')->where('id','in',$ids)->delete();
        if($result){
            $this->success('删除成功！');
        }else{
            $this->error('删除失败');
        }
    }
}