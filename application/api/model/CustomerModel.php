<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2018/6/14
 * Time: 17:20
 */
namespace app\api\model;

use think\Model;

class CustomerModel extends Model
{
    public $table = 'hans_user';

    public static function getCustomer($id)
    {
        $customer = self::get(['id' => $id, 'del' => 0]);
        return $customer;
    }

    public static function get($data, $with = [], $cache = false, $failException = false)
    {
        if (is_array($data)) {
            $data = array_merge($data, []);
        }
        return parent::get($data, $with, $cache);
    }
}