<?php
namespace app\admin\controller;

use app\admin\common\Base;
use think\Db;
use think\cache\driver\Redis;

class Index extends Base
{
    public function index()
    {
        $this->isLogin();
        return $this->fetch();
    }
    public function welcome()
    {
        //获取echart图x坐标，大分类名
        $pids = [];
        $str = "[";
        $data = Db::name('category')->where('pid',0)->select();
        //把x轴整合好
        foreach ($data as $item){
            $str .= "'".$item['cname']."'".",";
            $pids[] = $item['cid'];
        }
        $newstr = substr($str,0,strlen($str)-1);
        $name = $newstr."]";
        //获取各类销量，y轴
        $sales = [];
        foreach ($pids as $pid){
            $sales[] = Db::name('category')
                ->alias('c')
                ->join('goods g','c.cid = g.cate_id')
                ->where('pid',$pid)
                ->sum('sales');
        }
        $datastr = "[".implode(",",$sales)."]";
        //渲染子类分类数据
        $category = Db::name('category')
            ->field('cid,cname')
            ->where('pid','0')
            ->select();
        //近七天销售额
        $this->seven();
        //库存的数据
        $this->storeWarring();
        //提醒发货的数据
        $this->sendWarring();
        //获取今日订单数、销售额、用户量
        $today = strtotime(date('Y-m-d',time()));
        $ordersum = Db::name('orders')->where('create_time','>',$today)->count();
        $saleTotal = Db::name('orders')->where('create_time','>',$today)->sum('total');
        $userTotal = Db::name('user')->count();
        $todayUser = Db::name('user')->where('login_time','>',$today)->count();
        $this->assign(
            ['x'=>$name,'y'=>$datastr,'category'=>$category,'ordersum'=>$ordersum,'saleTotal'=>$saleTotal,'userTotal'=>$userTotal,'todayUser'=>$todayUser]
        );
        return $this->fetch();
    }
    //根据条件展示柱形图
    public function change(){
        if(request()->isPost()){
            $cateid = input('cateid');
            $x = [];
            $childcate = Db::name('category')->field('cid,cname')->where('pid',$cateid)->select();
            //x轴
            foreach ($childcate as $item){
                $x[] = $item['cname'];
                $cate_id[] = $item['cid'];
            }
            //y轴
            foreach ($cate_id as $cid){
                $sales[] = Db::name('category')
                    ->alias('c')
                    ->join('goods g','c.cid = g.cate_id')
                    ->where('g.cate_id',$cid)
                    ->sum('sales');
            }
            $y = $sales;
            //var_dump($x);
            //var_dump($y);
            $title = "各大分类销量表";
            $type = "bar";
            $legend = "销量"; //图例
            $describe = "销量 单位:件"; //节点或柱形图的描述
            return ['title'=>$title,'type'=>$type,'legend'=>$legend,'$describe'=>$describe,'x'=>$x,'y'=>$y];
        }else{
            return ['msg'=>'非法请求！'];
        }

    }
    //库存警告
    public function storeWarring(){
        $store = Db::name('goods')
            ->field('goods_name,store')
            ->where('store','<','99')
            ->select();
        return $this->assign(['store'=>$store]);
    }
    //发货提醒
    public function sendWarring(){
        $redis = new Redis();
        $orderInfo = $redis->sMembers("orders");
        $info = Db::name('orders')
            ->alias('o')
            ->join('user u','o.uid=u.id')
            ->field('u.username,o.ordernumber')
            ->where('o.id','in',$orderInfo)
            ->select();
        return $this->assign(['remind'=>$info]);
    }
    //近七天的销售额
    public function seven(){
        //$days[] = strtotime(date("Y-m-d",strtotime("+1 day")));
        for($i = 6; $i >= 0; $i--){
            $days[] = strtotime(date("Y-m-d",strtotime("-$i day")));
        }
        $days[] = strtotime(date("Y-m-d",strtotime("+1 day")));
        //x轴
        $str = "[";
        foreach ($days as $item) {
            /*$daysFormat[] = date('Y-m-d',$item);*/
            $str .= "'".date('Y-m-d',$item)."'".",";
        }
        $str = substr($str,0,strlen($str)-14)."]";
        for($j = 0; $j<=6; $j++){
            $temp = Db::name('orders')
                ->where('create_time','between',[$days[$j],$days[$j+1]])
                ->sum('total');
            $total[] = round($temp,2);
        }
        //y轴
        $y1 = "[".implode(",",$total)."]";
        return $this->assign(['x1'=>$str,'y1'=>$y1]);
    }
    public function getTotal(){
        $day = input('days');
        for($i = $day-1; $i >= 0; $i--){
            $days[] = strtotime(date("Y-m-d",strtotime("-$i day")));
        }
        $days[] = strtotime(date("Y-m-d",strtotime("+1 day")));
        for ($j = 0;$j<count($days)-1;$j++) {
            $x[] = date('Y-m-d',$days[$j]);
        }
        for($j = 0; $j<=$day-1; $j++){
            $temp = Db::name('orders')
                ->where('create_time','between',[$days[$j],$days[$j+1]])
                ->sum('total');
            $total[] = round($temp,2);
        }
        if($day == 7){
            $title = "近七天商品销售额";
        }elseif ($day == 15){
            $title = "近十五天商品销售额";
        }elseif($day == 30){
            $title = "近一个月商品销售额";
        }else{
            $title = "近三个月商品销售额";
        }
        return ['x'=>$x,'y'=>$total,'title'=>$title];
    }
}
