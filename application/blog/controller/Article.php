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
}