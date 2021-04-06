<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/15
 * Time: 15:34
 */

namespace app\common\upload;


use think\Controller;

class Upload extends Controller
{
    public function uploadImg()
    {
        $file = request()->file('file');//获取上传图片
        //var_dump($file);exit;
        if ($file) {
            $info = $file->move(ROOT_PATH . 'public' . DS . 'static'. DS .'uploads');
            if ($info) {
                $img = $info->getSaveName();//获取名称
                return ['status' => 1, 'src' => $img,'message'=>'success uploads'];
            } else {
                $message = '图片上传失败';
                return ['status' => 0, 'message' => $message];
            }
        } else {
            $message = '图片上传失败';
            return ['status' => 0, 'message' => $message];
        }
    }
}