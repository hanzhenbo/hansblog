<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/9
 * Time: 9:21
 */
namespace app\daytask\controller;

use think\Controller;
use think\Db;

class Calendar extends Controller
{
    public function calendarindex()
    {
        return $this->fetch();
    }

    public function task()
    {
        $db = Db::name('hans_daytask');
        $query = $db->select();
        $res = $query;
        foreach ($query as $key=>$value){
            $res[$key]['start'] = date('Y-m-d H:i:s',$value['start']);
            $res[$key]['end'] = date('Y-m-d H:i:s',$value['end']);
            if ($res[$key]['allDay'] == 1){
                $res[$key]['allDay'] = true;
                $res[$key]['end'] = '';
            }else{
                $res[$key]['allDay'] = false;
            }
        }
        echo json_encode($res);
    }

    public function updatetask()
    {
        $post = input('');
        $id = $post['taskid'];
        if (!$post){
            return ['state'=>-99,'msg'=>'参数错误'];
        }
        $update = [
            'title' => $post['taskname']
        ];
        if (!empty($post['allday'])){
            $update['allDay'] = '1';
        }else{
            list($start_addtime, $end_addtime) = explode('~', $post['taskdate']);
            $update['start'] = strtotime($start_addtime);
            $update['end'] = strtotime($end_addtime);
            $update['allDay'] = '0';
        }
        $edit = Db('hans_daytask')->where('id','=',$id)->update($update);
        if ($edit){
            return ['state'=>1,'msg'=>'修改成功'];
        }else{
            return ['state'=>0,'msg'=>'修改失败'];
        }

    }

    public function addtask()
    {
        $post = input('');
        if (!$post){
            return ['state'=>-99,'msg'=>'参数错误'];
        }
//        if (empty($post['taskdate']||$post['allday']))
        list($start_addtime, $end_addtime) = explode('~', $post['taskdate']);
        $update = [
            'title' => $post['taskname'],
            'start'=> strtotime($start_addtime),
            'end' => strtotime($end_addtime)+1,
            'color' => ''
        ];
        if (!empty($post['allday'])){
            $update['allDay'] = 1;
        }else{
            $update['allDay'] = 0;
        }
        $num = rand(100000,999999);
        $color = '#'.$num;
        $update['color'] = $color;
        $edit = Db('hans_daytask')->insert($update);
        if ($edit){
            return ['state'=>1,'msg'=>'添加成功'];
        }else{
            return ['state'=>0,'msg'=>'添加失败'];
        }

    }

    public function droptask()
    {
        $post = input('');
        $id = $post['dropid'];
        if (!empty($post['dropdays'])){
            $drop_days = $post['dropdays'];
            $start = $post['start'];
            $update = [
                'start'=> strtotime($start),
                'end' => strtotime(date("Y-m-d H:i:s", strtotime("+".$drop_days." days", strtotime($start)))),
            ];
        }else{
            $start = $post['start'];
            $end = $post['end'];
            $update = [
                'start'=> strtotime($start),
                'end' => strtotime($end),
            ];
        }

        $edit = Db('hans_daytask')->where('id','=',$id)->update($update);

        if ($edit){
            return ['state'=>1];
        }else{
            return ['state'=>0];
        }
    }
}