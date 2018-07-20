<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/20
 * Time: 14:46
 */
namespace app\photoswiper\controller;

use controller\BasicAdmin;

class Index extends BasicAdmin
{
    public function index()
    {
        return $this->fetch();
    }
}