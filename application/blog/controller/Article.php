<?php
namespace app\blog\controller;

use controller\BasicAdmin;
use think\Db;

class Article extends BasicAdmin
{
    public function index()
    {
        $db = Db::name('hans_article');
        return parent::_list($db);
    }

//    public function news()
//    {
//        $contents = file_get_contents('http://home.163.com');
//        $getcontent = iconv("gb2312", "utf-8",$contents);
////        var_dump($news);
//        echo $getcontent;
//        die;
//    }
}