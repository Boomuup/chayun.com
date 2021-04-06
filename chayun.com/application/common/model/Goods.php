<?php
/**
 * Created by PhpStorm.
 * User: #
 * Date: 2020/12/15
 * Time: 21:28
 */

namespace app\common\model;


use think\Model;

class Goods extends Model
{
    public function showList($store=1000000)
    {
        /*$order = ['id'=>'aoc'];
        $where = ['softdel'=>0];
        $result = $this->where($where)->order($order)->paginate(3);*/
        //关联查询
        $result = self::with("category")
            ->field('introduction,content',true)
            ->where(['softdel'=>0])
            ->where('store','<',$store)
            ->order(['id'=>'aoc'])
            ->paginate(8);
        return $result;
    }
    public function softList()
    {
        $result = self::with("category")
            ->field('introduction,content',true)
            ->where(['softdel'=>1])
            ->order(['id'=>'aoc'])
            ->paginate(8);
        return $result;
    }
    //撤回删除
    public function renew($id){
        $info = $this->find($id);
        $info->softdel = 0;
        $result = $info->save();
        return $result;
    }

    public function category()
    {
        return $this->belongsTo("category", "cate_id", "cid");
    }

    public function add($data)
    {
        $result = $this->allowField(true)->save($data);
        return $result;
    }

    public function showHot($limit)
    {
        $data = $this->where(['status'=>1,'softdel'=>0,'hot'=>1])->limit($limit)->select();
        return $data;
    }
    //根据cid获取商品详细信息
    public function getInfo($id)
    {
        $data = $this->where(['id'=>$id])->find();
        return $data;
    }
    //软删除
    public function softDelete($id)
    {
        $info = $this->find($id);
        $info->softdel = 1;
        $result = $info->save();
        return $result;
    }
    //彻底删除
    public function del($id)
    {
        $check = self::get($id);
        return $check->delete();
    }
}