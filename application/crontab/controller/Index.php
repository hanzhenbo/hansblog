<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/20
 * Time: 12:04
 */

namespace app\crontab\controller;

use think\Db;

class Index
{
    public function index()
    {
        $insert = array();
        $insert['title'] = 'hanstest' . time();
        $insert['content'] = '距离第一次见面已经过去'.floor((time()-1506164400)/86400).'天'.floor((time()-1506164400)%86400/3600).'小时'.floor((((time()-1506164400)%86400)/60)%60).'分钟'.floor((time()-1506164400)%86400%60).'秒';
        $insert['created_time'] = time();
        $insert['auth'] = 'hans';
        Db::name('index')->insert($insert);
    }
}