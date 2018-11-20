<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/8/18
 * Time: 14:24
 */

namespace app\h5webview\controller;

use think\Controller;

class index extends Controller

{
    public function Index()
    {
        return $this->fetch();
    }
}