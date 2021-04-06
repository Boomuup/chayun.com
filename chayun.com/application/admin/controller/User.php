<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/3/21
 * Time: 20:18
 */

namespace app\admin\controller;


use think\Controller;
use think\Db;

class User extends Controller
{
    public function index(){
        $data = Db::table('user')->paginate();
        $total = $data->total();
        $this->assign(['data'=>$data,'total'=>$total]);
        return $this->fetch();
    }
    public function changeStatus()
    {
        if(request()->post()) {
            $data = [
                'id' => input('post.id'),
                'status' => input('post.status') ? 0 : 1
            ];
            $result = Db::table('user')->where('id',$data['id'])->update(['status'=>$data['status']]);
            if($result) {
                $this->success('修改成功');
            }else {
                $this->error('修改失败');
            }
        }
    }
}