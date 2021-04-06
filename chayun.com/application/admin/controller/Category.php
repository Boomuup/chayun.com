<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/11
 * Time: 14:48
 */

namespace app\admin\controller;

use app\admin\common\Base;

class Category extends Base
{
    public function categoryList()
    {
        $cate = model('Category')->cateTree();
        //print_r($cate);
        $this->assign(
            ['cate'=>$cate]
        );
        return $this->fetch();
    }

    public function categoryAdd()
    {
        //分类选择
        $cate = model('Category')->cateTree();
        $this->assign(
            ['cate'=>$cate]
        );
        if(request()->isAjax())
        {
            $data = input('post.','','htmlentities');
            //validate后台字段验证
            $result = model('Category')->add($data);
            if($result==1) {
                $this->success("分类添加成功！");
            } else {
                $this->error('分类添加失败');
            }
        }
        return $this->fetch();
    }
    public function changeStatus()
    {
        if(request()->post()) {
            $data = [
                'cid' => input('post.id'),
                'status' => input('post.status') ? 0 : 1
            ];
            $result = model('Category')->change($data);
            if($result) {
                $this->success('修改成功');
            }else {
                $this->error('修改失败');
            }
        }
    }
    public function del()
    {
        if(request()->isPost()) {
            $cid = input('post.cid');
            $role = model('Admin')->selectRole();
            if($role == 0){
                $this->error('您没有权限');
            }
            $result = model('Category')->del($cid);
            if($result == 1) {
                $this->success('删除成功');
            } else {
                $this->error($result);
            }
        }
    }
    public function cateEdit()
    {
        if(request()->isGet()) {
            $cid = input('get.cid');
            $info = model('Category')->getone($cid);
            //print_r($info);
            $cate = model('Category')->cateTree();
            $this->assign(
                ['cate'=>$cate,
                 'info'=>$info
                ]
            );
            return $this->fetch();
        }

    }
    public function cateupdate()
    {
        if(request()->isAjax())
        {
            $data = input('post.','','htmlentities');
            //validate后台字段验证
            $result = model('Category')->updateone($data);
            if($result==1) {
                $this->success("修改成功！");
            } else {
                $this->error('修改失败！');
            }
        }
    }
}