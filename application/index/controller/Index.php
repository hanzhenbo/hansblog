<?php
namespace app\index\controller;

use controller\BasicHome;
use think\captcha\Captcha;
use \think\Db;
use think\Session;
use think\Log;

class Index extends BasicHome
{

    public function index()
    {
//        if(!empty(session('user'))){
//            $birth = \session('user')['birthday'];
////            $after = strtotime($birth,'');
//            $rest_time = session('user')['birthday'];
//        }else{
            $rest_time = 10000;
//        }
        $this->assign('rest_time',$rest_time);
        $db = Db::name('hans_article')->where('');
        return $this->_list($db, true);
    }

    public function article()
    {
        $aid = $this->request->param('id');
        $article = Db::name('hans_article')->where('id','=',$aid)->find();
        $disid = $this->request->param('id');
        $discuse = Db::name('hans_discuse')
            ->alias('dis')
            ->join('hans_user u','dis.user_id = u.id')
            ->field('dis.*,u.name')
            ->where('dis.article_id','=',$disid)
            ->order('dis.create_at desc')
            ->select();
        return $this->fetch('',[
            'article'=>$article,
            'discuse'=>$discuse
        ]);
    }

    public function writeblog()
    {
        $request = $this->request;
        $post = $request->post();
        if ($post){
            $session = Session::get()['user'];
            $article = array();
            $article['user_id'] = $session['id'];
            $article['user_name'] = $session['name'];
            $article['type'] = isset($post['type'])?$post['type']:0;
            $article['title'] = $post['title'];
            $article['abstracts'] = $post['abstracts'];
            $article['content'] = $post['content'];
            $article['img'] = isset($post['img'])?$post['img']:null;
            $article['create_at'] = time();
            Db::name('hans_article')->insert($article);
            $this->success('记录成功，快去看看吧','index');
        }
        return $this->fetch();
    }

    public function discuse()
    {
        Session::set('url',$_SERVER['HTTP_REFERER']);
        $request = $this->request;
        $post = $request->post();
        if (empty(Session::get()['user'])){
            $this->error('请登录','index/login');
        }
        $user = Session::get()['user'];
        $insert = array();
        $insert['user_id'] = $user['id'];
        $insert['article_id'] = $post['id'];
        $insert['content'] = $post['content'];
        $insert['create_at'] = time();
        Db::name('hans_discuse')->insert($insert);
        $this->success('发表成功');

    }

    public function img()
    {
        return $this->fetch();
    }

    public function index_center()
    {
        return $this->fetch();
    }

    public function index_nosidebar()
    {
        return $this->fetch();
    }

    public function index_noslider()
    {
        return $this->fetch();
    }

    public function login()
    {
        $request = $this->request;
        $post = $request->post();
        if ($request->post('email')){
            if (!empty($post['captcha'])){
                $captcha = new Captcha();
                $res = $captcha->check($post['captcha']);
                if (!$res){
                    return $this->error('请输入正确的验证码');
                }
            }
            $res = Db::name('hans_user')->where('email','=',$post['email'])->find();
            if ($res['password'] == md5($post['password'])){
                Session::set('user',$res);
                $this->success('登录成功','Index/index');
            }elseif (!$res){
                $this->error('用户名不存在，请重新输入');
            }else{
                $this->error('密码错误');
            }
        }else{
            return $this->fetch();
        }
    }

    public function loginout(){
        session('user', null);
        session_destroy();
        $this->success('退出登录成功！', 'index/index', ['jump' => true]);
    }

    public function register()
    {
        $request = $this->request;
        $post = $request->post();
        if ($request->post('email')){
            $res = Db::name('hans_user')->where('email','=',$post['email'])->find();
            if ($res){
                $this->error('此账号已注册，请登录','index/login');
            }
            $post = $request->post();
            $data = array();
            $data['name'] = $post['name'];
            $data['password'] = md5($post['password']);
            $data['email'] = $post['email'];
            Db::name('hans_user')->insert($data);
            $this->success('注册成功');
        }else{
            return $this->fetch();
        }
    }

    public function timeline()
    {
        return $this->fetch();
    }

}