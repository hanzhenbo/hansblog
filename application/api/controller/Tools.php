<?php

namespace app\api\controller;

use app\api\model\CustomerModel;
use controller\BasicApi;
use service\HttpService;
use think\facade\Cache;


/**
 * Filename: Tools.php
 * User: Jasmine2
 * Date: 2018-1-26 15:57
 * Email: youjingqiang@gmail.com
 * Copyright (c) Guangzhou Zhishen Data Service co,. Ltd
 */
class Tools extends BasicApi
{

    /**
     * 发送验证码
     * Luosimao 校验
     */
    public function identifyCodeLuosimao()
    {
//        $token = $this->request->post('token');
//        if ($this->request->has('token') && $token != '') {
//            $res = json_decode(HttpService::post('https://captcha.luosimao.com/api/site_verify', [
//                'api_key' => '652ee93d6ae2b9b3f192f02681b251c9',
//                'response' => $token
//            ]), 1);
//            if ($res['res'] !== 'success') {
//                return $this->success('人机验证失败, 请重新验证');
//            } else {
//                Cache::set($token, 1, 60);
//            }
//        } else {
//            return $this->error('请先完成人机验证');
//        }
        if ($this->request->has('mobile') && checkMobile($this->request->post('mobile'))) {
            switch ($this->request->post('check', 'register')) {
                case 'register':
                    if (CustomerModel::get(['mobile' => $this->request->post('mobile')])) {
                        return $this->error('您的手机号码已注册, 请登录', 500);
                    }
                    break;
            }
            $msg = sms_lock($this->request->post('mobile'));
            if ($msg !== false) {
                return $this->error($msg);
            }
            $code = random_int(100000, 999999);
            Cache::set('captcha_' . $this->request->post('mobile'), $code, 300);
            return $this->success('发送成功',$code);
        } else {
            return $this->error('无效的电话号码');
        }
    }

    /**
     * @return \controller\Redirect|\think\Response|\think\response\Json|\think\response\Jsonp|\think\response\Xml
     * 发送验证码，无校验
     */

    public function identifyCodeNomal()
    {
        $captcha = new \think\captcha\Captcha();
        $value = $this->request->post('token');
        $verify = $captcha->check($value);
        if (!$verify){
            return $this->error('图形验证码错误');
        }
        if ($this->request->has('mobile') && checkMobile($this->request->post('mobile'))) {
            switch ($this->request->post('check', 'register')) {
                case 'register':
                    //注册是否继续
                    if (sysconf('is_register') == 0) {
                        return $this->error('系统维护中！');
                    }
                    if (CustomerModel::get(['mobile' => $this->request->post('mobile')])) {
                        return $this->error('您的手机号码已注册, 请登录', 500);
                    }
                    break;
                case 'find-passwd':
                    if (!CustomerModel::get(['mobile' => $this->request->post('mobile')])) {
                        return $this->error('您的手机号码未注册, 请先注册');
                    }
                    break;
            }
            $msg = sms_lock($this->request->post('mobile'));
            if ($msg !== false) {
                return $this->error($msg);
            }
            $code = random_int(100000, 999999);
            if (send_sms_captcha($this->request->post('mobile'), sprintf(sysconf('sms_template_captcha'), $code)) == 0) {
                Cache::set('captcha_' . $this->request->post('mobile') . $this->app['id'], $code, 300);
                return $this->success();
            }
            return $this->error('短信发送失败');
        } else {
            return $this->error('无效的电话号码');
        }
    }
}
