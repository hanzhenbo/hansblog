<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/13
 * Time: 9:37
 */
namespace app\getnews\controller;

use controller\BasicAdmin;
use think\Db;

class Index extends BasicAdmin
{

    // php最大执行时间设置为：半个小时，php原来默认为30秒，爬不完
//    public $init = ['max_execution_time'=>'1800'];
    // 爬取页面全部数据
    function curlGetData($url)
    {
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt ($ch,  CURLOPT_HEADER,  false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $response = curl_exec($ch);
        curl_close($ch);
//        $response = str_replace('gb2312','utf-8',$response);
//        $response =  iconv("gb2312","utf-8//IGNORE",$response);
//        echo $response;
//        die;
        return $response;
    }

// 依次循环新闻id读取新闻详情信息，需要栏目id,以及url
    // 编写一个函数实现新闻详情信息读取
    function getNewsInfo($id, $cateid){
//        $url = "网站url地址/news_view.asp?id={$id}";
        $url = "http://news.baidu.com/ns?word=%E8%A5%BF%E5%AE%89&pn=120&cl=2&ct=1&tn=news&rn=20&ie=utf-8&bt=0&et=0&rsv_page=1";
        $result = $this->curlGetData($url);
        $pattern = '/<div class="right_body">[\s\S]*<div class="news_next">/is';
        preg_match_all($pattern, $result, $result);
        $result = $result[0][0];  // 文章所有内容
        // 依次获取信息
        $newsInfo = [];
        $newsInfo['id'] = $id;
        // 获取新闻标题
        $pattern = '/<h2 class="news_title">[\s\S*]+<\/h2>/is';
        preg_match($pattern, $result, $newsInfo['title']);
        $newsInfo['title'] = str_replace('<h2 class="news_title">', '', $newsInfo['title']);
        $newsInfo['title'] = str_replace('</h2>', '', $newsInfo['title']);
        $newsInfo['title'] = $newsInfo['title'][0];
        // 获取新闻来源
        $pattern = '/来源：[\w\x{4e00}-\x{9fa5}]+/ius';
        preg_match($pattern, $result, $newsInfo['nfrom']);
        $newsInfo['nfrom'] = str_replace('来源：', '', $newsInfo['nfrom']);
        $newsInfo['nfrom'] = $newsInfo['nfrom'][0];
        // 获取新闻作者
        $pattern = '/作者：[\w\x{4e00}-\x{9fa5}]+/ius';
        preg_match($pattern, $result, $newsInfo['author']);
        $newsInfo['author'] = str_replace('作者：', '', $newsInfo['author']);
        $newsInfo['author'] = $newsInfo['author'][0];
        // 获取新闻发布时间
        $pattern = '/发布：\d{2,4}\/\d{1,2}\/\d{1,2}/ius';
        preg_match($pattern, $result, $newsInfo['createtime']);
        $newsInfo['createtime'] = str_replace('发布：', '', $newsInfo['createtime']);
        $newsInfo['createtime'] = $newsInfo['createtime'][0];
        // 新闻栏目id
        $newsInfo['cateid'] = $cateid;
        // 点击量
        $pattern = '/点击：<span class="blue">\d*/is';
        preg_match($pattern, $result, $newsInfo['click']);
        $newsInfo['click'] = intval(str_replace('点击：<span class="blue">', '', $newsInfo['click'][0]));
        // 新闻内容
        $pattern = '/<div class="news_content">[\s\S]*<div class="news_next">/is';
        preg_match($pattern, $result, $newsInfo['content']);
        $newsInfo['content'] = str_replace('<div class="news_content">', '', $newsInfo['content'][0]);
        $newsInfo['content'] = str_replace('<div class="news_next">', '', $newsInfo['content']);
        $newsInfo['content'] = substr($newsInfo['content'], 0, strrpos($newsInfo['content'], '</div>'));
        // 图片url地址
        $pattern = '/src=\"\/uploadfile\/[\w.]+\"/is';
        preg_match_all($pattern, $newsInfo['content'], $newsimage);
        $newsimage = $newsimage[0];
        $newsimage = str_replace('src="', '该网站地址', $newsimage);
        $newsimage = str_replace('"', '', $newsimage);
        foreach($newsimage as $val)
        {
            $picname = str_replace('新闻网站地址/uploadfile/', '', $val);
            $im = file_get_contents($val);
            file_put_contents('./uploadfile/' . $picname, $im);
            // crabImage($val, './uploadfile/', $filename);
        }

        return $newsInfo;
    }


// 输入一个栏目id实现全部爬取
    function curlGetByCateId(){
//        echo 234;die;
//        $url = "新闻网站地址/news_category.asp?id={$cid}";
        $url = "http://www.baidu.com/s?wd=西安";
        $response = $this->curlGetData($url);
        dump($response);
        die;
        $pattern = '/<label id="total">\d+/is';
        preg_match_all($pattern, $response, $response);
        $pageTotal = ceil(intval(substr($response[0][0], 18)) / 20);  // 该栏目下新闻总页数
        // 依次循环页码，获取该栏目所有新闻的id
        $newsId = [];  // 保存所有的新闻id
        for ($i = 1; $i <= $pageTotal; $i++)
        {
            $url = "http://www.baidu.com/s?wd=西安";
            $response = $this->curlGetData($url);
            $pattern = '/href="news_view.asp\?id=\d+/is';
            preg_match_all($pattern, $response, $response);
            $response = $response[0];
            foreach ($response as $k => $v) {
                $response[$k] = intval(substr($v, 23));
            }
            $newsId = array_merge($response, $newsId);
        }


        // 连接数据库
//        $pdo = new PDO('mysql:host=主机地址;dbname=curldemo;charset=utf8', '数据库用户名', '密码');
//        $pdo->exec('set names utf8');

//        $datas = [];  //存放所有的数据
//        foreach($newsId as $val)
//        {
//            $datas = $this->getNewsInfo($val, $cid);
//            Db('getnews')->insert($datas);
////            $sql = "insert into newsinfo(id,title,nfrom,content,createtime,author,click,cateid) values(:id,:title,:nfrom,:content,:createtime,:author,:click,:cateid)";
////            $stmt = $pdo->prepare($sql);
////            $stmt->execute($datas);
//        }

    }
    // 根据栏目id爬出来该栏目总页数（因为数据量较大，一下子爬取整站数据可能需要的时间比较长，所以我做了调整，根据栏目id每次只爬取一个栏目的内容，想要一次性爬完的同学可以自行扩展，无非就是多一个循环而已）
    // 入口函数
    public function begin()
    {
        $this->curlGetByCateId(7);
        echo "爬完了！！！造作啊！" . '7';
    }
}

