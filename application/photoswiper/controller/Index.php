<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/7/20
 * Time: 14:46
 */
namespace app\photoswiper\controller;

use controller\BasicAdmin;
use think\facade\Cache;
use think\Db;

class Index extends BasicAdmin
{
    public $table = 'hans_photos';

    public function index()
    {
        $db = Db::name('hans_photos');
        return $this->_list($db);
    }

    /**
     * 批量上传照片
     */
    public function addphoto(){
        if ($this->request->isGet()){
            return $this->fetch();
        }else{
            $post = $this->request->post();
            $insert = array();
            $url = explode('|',$post['url']);
            $check = Db::name($this->table)->whereIn('url',$url)->select();
            if ($check){
                return $this->error('照片已存在');
            }
            foreach($url as $key=>$value){
                $insert['classify'] = '1';
                $insert['url'] = $value;
                $insertall[] = $insert;
            }
            $res = Db::name('hans_photos')->insertAll($insertall);
            list($base, $spm, $url) = [url('@admin'), $this->request->get('spm'), url('photoswiper/index/addphoto')];
            if ($res){
                $this->success('上传成功',"{$base}#{$url}?spm={$spm}");
            }else{
                $this->error('上传失败');
            }
        }
    }

    public function linshi()
    {
        $list = Db::name('hans_photos')->select();
        return $this->fetch('linshi',['list'=>$list]);
    }

    public function official()
    {
        if (Cache::has('photolist')){
            $list = Cache::get('photolist');
        }else{
            $list = Db::name('hans_photos')->select();
            Cache::set('photolist',$list);
        }
        return $this->fetch('official',['list'=>$list]);
    }
}