<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2021/1/5
 * Time: 22:48
 */

namespace app\common\model;


use think\Model;

class Cart extends Model
{
    public function getCart($id)
    {
        $data = self::where(['uid'=>$id])->select();
        return $data;
    }
    public function addCart($data)
    {
        $shop = self::where(['shopid'=>$data['shopid'],'uid'=>$data['id']])->find();
        if($shop) {
            $shop->num += $data['num'];
            $shop->save();
            if($shop) {
                return 1;
            }
        } else {
            $result = $this->save([
                'uid'=>$data['id'],
                'num'=>$data['num'],
                'shopid'=>$data['shopid']
            ]);
            if($result) {
                return 1;
            }
        }
        return false;
    }
}