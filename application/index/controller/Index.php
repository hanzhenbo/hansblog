<?php

namespace app\index\controller;

use controller\BasicHome;
use think\captcha\Captcha;
use \think\Db;
use think\facade\Session;

class Index extends BasicHome
{

    /**
     * @return array|string
     * 首页  列表方法
     */
    public function index()
    {
//        if(!empty(session('user'))){
//            $birth = \session('user')['birthday'];
////            $after = strtotime($birth,'');
//            $rest_time = session('user')['birthday'];
//        }else{
        $rest_time = 10000;
//        }
        $where = ['status' => 1, 'is_deleted' => 0];
        $this->assign('rest_time', $rest_time);
        $db = Db::name('hans_article')->where($where)->order('click desc');
        return $this->_list($db, true);
    }

    /**
     * @return array|string
     * 文章详情页
     */
    public function article()
    {
        $aid = $this->request->param('id');
        // 点击增加量
        Db::name('hans_article')->where('id', '=', $aid)->setInc('click', '1');
        $article = Db::name('hans_article')->where('id', '=', $aid)->find();
        $disid = $this->request->param('id');
        $this->assign('article', $article);
        $discuse = Db::name('hans_discuse')
            ->alias('dis')
            ->join('hans_user u', 'dis.user_id = u.id')
            ->field('dis.*,u.name')
            ->where('dis.article_id', '=', $disid);
        return $this->_list($discuse, true);
    }

    /**
     * @return mixed
     * 博文撰写
     */
    public function writeblog()
    {
        if ($this->request->isPost()) {
            $post = $this->request->post();
            $session = Session::get()['hans_user'];
            $article = array();
            $article['user_id'] = $session['id'];
            $article['user_name'] = $session['name'];
            $article['type'] = isset($post['type']) ? $post['type'] : 0;
            $article['title'] = $post['title'];
            $article['abstracts'] = $post['abstracts'];
            $article['content'] = $post['content'];
            $article['img'] = isset($post['img']) ? $post['img'] : null;
            $article['create_at'] = time();
            $article['status'] = 1;
            Db::name('hans_article')->insert($article);
            $this->success('记录成功，快去看看吧', 'index');
        } elseif ($this->request->isGet()) {
            if (!empty(Session::get()['hans_user'])) {
                return $this->fetch();
            } else {
                $this->error('请先登录', 'index/login');
            }
        } else {
            $this->error('请求方式不正确');
        }
    }

    /**
     * 评论发表页面
     */
    public function discuse()
    {
        Session::set('url', $_SERVER['HTTP_REFERER']);
        $request = $this->request;
        $post = $request->post();
        if (empty(Session::get()['hans_user'])) {
            $this->error('请登录', 'index/login');
        }
        $user = Session::get()['hans_user'];
        $insert = array();
        $insert['user_id'] = $user['id'];
        $insert['article_id'] = $post['id'];
        $insert['content'] = $post['content'];
        $insert['create_at'] = time();
        Db::name('hans_discuse')->insert($insert);
        $this->success('发表成功');
    }

    /**
     * @return mixed|void
     * 用户登录
     */
    public function login()
    {
        $request = $this->request;
        $post = $request->post();
        if ($request->post('email')) {
            if (!empty($post['captcha'])) {
                $captcha = new Captcha();
                $res = $captcha->check($post['captcha']);
                if (!$res) {
                    return $this->error('请输入正确的验证码');
                }
            }
            $res = Db::name('hans_user')->where('email', '=', $post['email'])->find();
            if ($res['password'] == md5($post['password'])) {
                Session::set('hans_user', $res);
                $this->success('登录成功', 'Index/index');
            } elseif (!$res) {
                $this->error('用户名不存在，请重新输入');
            } else {
                $this->error('密码错误');
            }
        } else {
            return $this->fetch();
        }
    }

    /**
     * 退出登录
     */
    public function loginout()
    {
        session('hans_user', null);
        session_destroy();
        $this->success('退出登录成功！', 'index/index', ['jump' => true]);
    }

    /**
     * @return mixed
     * 用户注册页
     */
    public function register()
    {
        $request = $this->request;
        $post = $request->post();
        if ($request->post('email')) {
            $res = Db::name('hans_user')->where('email', '=', $post['email'])->find();
            if ($res) {
                $this->error('此账号已注册，请登录', 'index/login');
            }
            $post = $request->post();
            $data = array();
            $data['name'] = $post['name'];
            $data['password'] = md5($post['password']);
            $data['email'] = $post['email'];
            Db::name('hans_user')->insert($data);
            $this->success('注册成功');
        } else {
            return $this->fetch();
        }
    }

}