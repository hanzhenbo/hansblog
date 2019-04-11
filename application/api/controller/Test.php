<?php

namespace app\api\controller;

use controller\BasicApi;
use EasyWeChat\Factory;


/**
 * Filename: Test.php
 * User: Jasmine2
 * Date: 2018-1-26 15:57
 * Email: youjingqiang@gmail.com
 * Copyright (c) Guangzhou Zhishen Data Service co,. Ltd
 */
class Test extends BasicApi
{

    /**
     * 测试方法
     */
    public function index()
    {
        $app = Factory::officialAccount([
            'app_id' => 'wx4b63c2f90bb799ea',
            'secret' => 'cxfqwertyuioplkjhgfdsazxcvbnm123',
            'oauth' => [
                'scopes' => ['snsapi_base'],
                'callback' => url("order/pay/yibao", [], true, true),
            ]
        ]);
        $response = $app->oauth
            ->scopes(['snsapi_base'])
            ->redirect();
        $response->send();
        $openid = $app->oauth->user()->getId();
        dump($openid);
    }
}
