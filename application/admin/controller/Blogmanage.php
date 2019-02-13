<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/26
 * Time: 16:31
 */

namespace app\admin\controller;

use controller\BasicAdmin;
use service\DataService;
use think\Db;

class Blogmanage extends BasicAdmin
{

    /**
     * 定义当前操作表名
     * @var string
     */
    public $table = 'hans_article';


    public function index()
    {
        list($get, $db) = [$this->request->get(), Db::name($this->table)];
        foreach (['title'] as $field) {
            (isset($get[$field]) && $get[$field] !== '') && $db->whereLike($field, "%{$get[$field]}%");
        }
        if (isset($get['date']) && $get['date'] !== '') {
            list($start, $end) = explode(' - ', $get['date']);
            $db->whereBetween('create_at', ["{$start} 00:00:00", "{$end} 23:59:59"]);
        }
        $this->title = '文章管理';
        return parent::_list($db->where(['is_deleted' => '0'])->order('create_at desc'));
    }

    /**
     * 删除文章
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function del()
    {
        if (DataService::update($this->table)) {
            $this->success("文章删除成功！", '');
        }
        $this->error("文章删除失败，请稍候再试！");
    }

    /**
     * 文章禁用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function forbid()
    {
        if (DataService::update($this->table)) {
            $this->success("文章禁用成功！", '');
        }
        $this->error("文章禁用失败，请稍候再试！");
    }

    /**
     * 文章启用
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function resume()
    {
        if (DataService::update($this->table)) {
            $this->success("文章启用成功！", '');
        }
        $this->error("文章启用失败，请稍候再试！");
    }

    /**
     * 文章编辑
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function edit()
    {
        if (!$this->request->isPost()) {
            $article_id = $this->request->get('id');
            $article = Db::name($this->table)->where(['id' => $article_id, 'is_deleted' => '0'])->find();
            return $this->fetch('edit', [
                'article' => $article
            ]);
        }
        $data = $this->request->post('');
        $article_id = $this->request->post('id');
        $article = Db::name($this->table)->where(['id' => $article_id, 'is_deleted' => '0'])->find();
        empty($article) && $this->error('文章编辑失败，请稍候再试！');
        // 更新文章
        $where = ['id' => $article_id, 'is_deleted' => '0'];
        $editres = Db::name($this->table)->where($where)->update($data);
        list($base, $spm, $url) = [url('@admin'), $this->request->get('spm'), url('admin/blogmanage/index')];
        if ($editres) {
            $this->success('修改成功', "{$base}#{$url}?spm={$spm}");
        } else {
            $this->error('修改失败');
        }
    }

    /**
     * 文章添加
     * @throws \think\Exception
     * @throws \think\exception\PDOException
     */
    public function add()
    {
        if (!$this->request->isPost()) {
            return $this->fetch('edit');
        }
        $data = $this->request->post('');
        // 更新文章
        $data['created_at'] = time();
        $data['status'] = 1;
        $res = Db::name($this->table)->insert($data);
        list($base, $spm, $url) = [url('@admin'), $this->request->get('spm'), url('admin/blogmanage/index')];
        if ($res) {
            $this->success('添加成功', "{$base}#{$url}?spm={$spm}");
        } else {
            $this->error('添加失败');
        }
    }

    /**
     * @二维码
     */
    public function qrcode()
    {
        $request = $this->request;
        if ($request->isGet()) {
            $id = $request->get()['article_id'];
            return $this->fetch('', ['id' => $id]);
        }
    }

    public function createQrCode()
    {
        $request = $this->request;
        $articleid = $request->get()['article_id'];
        if ($articleid) {
            $url = 'http://' . $_SERVER['HTTP_HOST'] . '/index/index/article?id=' . $articleid;
            $data = [
                'msg' => 1,
                'url' => $url,
                'data' => \QRCode::createQRCodeString($url, 150)
            ];
            return json_encode($data);
        } else {
            $data = [
                'msg' => 0,
                'url' => '',
                'data' => ''
            ];
            return json_encode($data);
        }
    }
}