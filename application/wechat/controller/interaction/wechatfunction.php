<?php

/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/8/6
 * Time: 9:18
 */
namespace app\wechat\controller\interaction;

use Naixiaoxin\ThinkWechat\Facade;

class wechatfunction
{
    /**
     * 获取用户信息
     */
    public function get_userinfo()
    {

    }

    /**
     * 发送模板消息
     */
    public function sendtmp()
    {
        $app = Facade::officialAccount();
        $app->template_message->send([
           'touser' => 'user-openid'
        ]);
    }
}