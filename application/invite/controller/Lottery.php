<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/13
 * Time: 9:37
 */
namespace app\invite\controller;

use controller\BasicAdmin;

class Lottery extends BasicAdmin
{

    public function index()
    {
        return $this->fetch();
    }

    public function begin(){

        //prize表示奖项内容，v表示中奖几率(若数组中七个奖项的v的总和为100，如果v的值为1，则代表中奖几率为1%，依此类推)
        $jpdata = array(
            '0' => array('id' => 0, 'prize' => '谢谢参与', 'v' => 50),
            '1' => array('id' => 1, 'prize' => '苹果手机', 'v' => 1),
            '2' => array('id' => 2, 'prize' => '10元红包', 'v' => 5),
            '3' => array('id' => 3, 'prize' => '蓝牙耳机', 'v' => 5),
            '4' => array('id' => 4, 'prize' => '20元红包', 'v' => 5),
            '5' => array('id' => 5, 'prize' => '1元红包', 'v' => 20),
            '6' => array('id' => 6, 'prize' => '女士包', 'v' => 4),
            '7' => array('id' => 7, 'prize' => '1000金币', 'v' => 10),
        );

        foreach ($jpdata as $key=>$value) {
            $arr[$value['id']] = $value['v'];

        }
        //根据概率获取奖项id
        $data['id']=$this->getRand($arr);
        //获取前端奖项位置
        foreach($jpdata as $k=>$v){
            if($v['id'] == $data['id']){
                $data['prize'] = $v['prize'];
                break;
            }
        }
        $data['stoped']=$data['id'];
        echo json_encode($data);
    }

    public function getRand($proArr) {
        $data = '';
        $proSum = array_sum($proArr); //概率数组的总概率精度
        foreach ($proArr as $k => $v) { //概率数组循环
            $randNum = mt_rand(1, $proSum);
            if ($randNum <= $v) {
                $data = $k;
                break;
            } else {
                $proSum -= $v;
            }
        }
        unset($proArr);
        return $data;
    }
}

