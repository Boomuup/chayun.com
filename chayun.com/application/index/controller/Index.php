<?php
namespace app\index\controller;

use think\Facade\Cache;
use think\Controller;
use think\Db;
use think\facade\Session;

class Index extends \app\index\common\Base
{
    public function index()
    {

        //热销商品
        $hot = model('Goods')->showHot(4);
        $wulong = Db::table('goods')
            ->alias('g')
            ->join('category c','g.cate_id=c.cid')
            ->where('c.pid',3)
            ->where('g.status',1)
            ->where('softdel',0)
            ->limit(4)
            ->select();
        $green = Db::table('goods')
            ->alias('g')
            ->join('category c','g.cate_id=c.cid')
            ->where('c.pid',12)
            ->where('g.status',1)
            ->where('softdel',0)
            ->limit(4)
            ->select();
        $red = Db::table('goods')
            ->alias('g')
            ->join('category c','g.cate_id=c.cid')
            ->where('c.pid',1)
            ->where('g.status',1)
            ->where('softdel',0)
            ->limit(4)
            ->select();
        $more = Db::table('goods')
            ->alias('g')
            ->join('category c','g.cate_id=c.cid')
            ->where('g.status',1)
            ->where('softdel',0)
            ->limit(10)
            ->select();
        $this->assign(
            [   'hot'=>$hot,
                'wulong'=>$wulong,
                'red'=>$red,
                'green'=>$green,
                'more'=>$more,
                'lists'=>\app\index\common\Base::getNavLists(),
                'banner'=>\app\index\common\Base::bannerShow()
            ]
        );
        return $this->fetch();
    }
    public function testRedis() {
        Cache::store('redis')->set('username','chen');
        $name = Cache::store('redis')->get('123');
        var_dump($name);
    }
}
