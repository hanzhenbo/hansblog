<?php

// +----------------------------------------------------------------------
// | ThinkAdmin
// +----------------------------------------------------------------------
// | 版权所有 2014~2017 广州楚才信息科技有限公司 [ http://www.cuci.cc ]
// +----------------------------------------------------------------------
// | 官方网站: http://think.ctolog.com
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// +----------------------------------------------------------------------
// | github开源项目：https://github.com/zoujingli/ThinkAdmin
// +----------------------------------------------------------------------

use service\DataService;
use service\NodeService;
use think\Db;

use think\facade\Cache;
use service\HttpService;
use think\exception\HttpResponseException;
use think\helper\Time;

//require_once 'html_helper.php';

/**
 * 打印输出数据到文件
 * @param mixed $data 输出的数据
 * @param bool $force 强制替换
 * @param string|null $file
 */
function p($data, $force = false, $file = null)
{
    is_null($file) && $file = env('runtime_path') . date('Ymd') . '.txt';
    $str = (is_string($data) ? $data : (is_array($data) || is_object($data)) ? print_r($data, true) : var_export($data, true)) . PHP_EOL;
    $force ? file_put_contents($file, $str) : file_put_contents($file, $str, FILE_APPEND);
}

/**
 * RBAC节点权限验证
 * @param string $node
 * @return bool
 */
function auth($node)
{
    return NodeService::checkAuthNode($node);
}

/**
 * 设备或配置系统参数
 * @param string $name 参数名称
 * @param bool $value 默认是null为获取值，否则为更新
 * @return string|bool
 * @throws \think\Exception
 * @throws \think\exception\PDOException
 */
function sysconf($name, $value = null)
{
    static $config = [];
    if ($value !== null) {
        list($config, $data) = [[], ['name' => $name, 'value' => $value]];
        return DataService::save('SystemConfig', $data, 'name');
    }
    if (empty($config)) {
        $config = Db::name('SystemConfig')->column('name,value');
    }
    return isset($config[$name]) ? $config[$name] : '';
}

/**
 * 日期格式标准输出
 * @param string $datetime 输入日期
 * @param string $format 输出格式
 * @return false|string
 */
function format_datetime($datetime, $format = 'Y年m月d日 H:i:s')
{
    return date($format, strtotime($datetime));
}

/**
 * UTF8字符串加密
 * @param string $string
 * @return string
 */
function encode($string)
{
    list($chars, $length) = ['', strlen($string = iconv('utf-8', 'gbk', $string))];
    for ($i = 0; $i < $length; $i++) {
        $chars .= str_pad(base_convert(ord($string[$i]), 10, 36), 2, 0, 0);
    }
    return $chars;
}

/**
 * UTF8字符串解密
 * @param string $string
 * @return string
 */
function decode($string)
{
    $chars = '';
    foreach (str_split($string, 2) as $char) {
        $chars .= chr(intval(base_convert($char, 36, 10)));
    }
    return iconv('gbk', 'utf-8', $chars);
}

/**
 * 下载远程文件到本地
 * @param string $url 远程图片地址
 * @return string
 */
function local_image($url)
{
    return \service\FileService::download($url)['url'];
}




function get_random_string($prefix = '', $length = 32)
{
    $ss = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $str = $prefix;
    for ($i = 0; $i < $length - strlen($prefix); $i++) {
        $str .= $ss[random_int(0, 61)];
    }
    return $str;
}


/**
 * 下划线转驼峰
 * 思路:
 * step1.原字符串转小写,原字符串中的分隔符用空格替换,在字符串开头加上分隔符
 * step2.将字符串中每个单词的首字母转换为大写,再去空格,去字符串首部附加的分隔符.
 */
function camelize($uncamelized_words, $separator = '_')
{
    $uncamelized_words = $separator . str_replace($separator, " ", strtolower($uncamelized_words));
    return ltrim(str_replace(" ", "", ucwords($uncamelized_words)), $separator);
}

/**
 * 驼峰命名转下划线命名
 * 思路:
 * 小写和大写紧挨一起的地方,加上分隔符,然后全部转小写
 */
function uncamelize($camelCaps, $separator = '_')
{
    return strtolower(preg_replace('/([a-z])([A-Z])/', "$1" . $separator . "$2", $camelCaps));
}


/**
 * array_column 函数兼容
 */
if (!function_exists("array_column")) {

    function array_column(array &$rows, $column_key, $index_key = null)
    {
        $data = [];
        foreach ($rows as $row) {
            if (empty($index_key)) {
                $data[] = $row[$column_key];
            } else {
                $data[$row[$index_key]] = $row[$column_key];
            }
        }
        return $data;
    }

}

/**
 * send_sms 发送短信,验证码
 */
if (!function_exists("send_sms_captcha")) {

    function send_sms_captcha($mobile, $content, $id = '', $sign = '')
    {
        $channel = sysconf('sms_type_captcha');
        $channel = "\\sms\\" . $channel;
        $sms_channel = new $channel('captcha');
        return $sms_channel->send($mobile, $content, $id, $sign, '1');
    }
}
/**
 * api_encrypt API加密 , 私钥
 */
if (!function_exists("api_encrypt")) {

    function api_encrypt($in, $key = false, $iv = false)
    {
        if (!is_string($in)) {
            $in = \GuzzleHttp\json_encode($in);
        }
        $un_encrypt = base64_encode($in);
        $key = $key === false ? config('api_key') : $key;
        $iv = $iv === false ? config('api_iv') : $iv;
        if (!$key || !$iv) {
            return "未配置接口秘钥";
        }
        $encrypted = openssl_encrypt($un_encrypt, 'aes-128-cbc', $key, false, $iv);
        return base64_encode($encrypted);
    }
}

/**
 * api_decrypt  api解密 ,私钥
 */
if (!function_exists("api_decrypt")) {

    function api_decrypt($in, $key = false, $iv = false)
    {
        $un_decrypt = base64_decode($in);
        $key = $key === false ? config('api_key') : $key;
        $iv = $iv === false ? config('api_iv') : $iv;
        $decrypted = openssl_decrypt($un_decrypt, 'aes-128-cbc', $key, false, $iv);
        if ($decrypted) {
            try {
                return \GuzzleHttp\json_decode(base64_decode($decrypted), 1);
            } catch (\Exception $e) {
                return [];
            }
        } else {
            return [];
        }
    }
}

/**
 * get_mime 取文件后缀名
 */
if (!function_exists('get_mime')) {
    function get_mime($mime)
    {
        $all = config('mines');
        $r = '';
        foreach ($all as $key => $item) {
            if (is_array($item)) {
                if (in_array($mime, $item)) {
                    $r = $key;
                    break;
                }
            } elseif ($item == $mime) {
                $r = $key;
                break;
            }
        }
        return $r;
    }

    function get_mime_by_ext($ext)
    {
        $all = config('mines');
        if (isset($all[$ext])) {
            if (is_array($all[$ext])) {
                return $all[$ext][0];
            } else {
                return $all[$ext];
            }
        }
        return null;
    }
}

/**
 * mobile_mask 手机号码脱敏
 */
if (!function_exists('mobile_mask')) {
    function mobile_mask($mobile)
    {
        if (strlen($mobile) == 11) {
            return substr($mobile, 0, 3) . "****" . substr($mobile, -4, 4);
        }
    }
}
/**
 * mobile_mask 身份证号码脱敏
 */
if (!function_exists('sfz_mask')) {
    function sfz_mask($mobile)
    {
        if (strlen($mobile) == 18) {
            return substr($mobile, 0, 6) . "********" . substr($mobile, -4, 4);
        }
    }
}
/**
 * mobile_mask 银行卡号码脱敏
 */
if (!function_exists('bank_mask')) {
    function bank_mask($bank, $mask = '')
    {
        return $mask . substr($bank, -4, 4);
    }
}
/**
 * mobile_mask 姓名脱敏
 */
if (!function_exists('name_mask')) {
    function name_mask($name)
    {
        if (mb_strlen($name) >= 1) {
            return mb_substr($name, 0, 1) . '**';
        }
        return $name . '**';
    }
}
/**
 * mobile_mask 其他号码脱敏
 */
if (!function_exists('other_mask')) {
    function other_mask($number)
    {
        if (!empty($number)) {
            return substr($number, 0, 4) . "****" . substr($number, -2, 2);
        } else {
            return '未填写';
        }

    }
}
/**
 * getBankByCode 取银行名称
 */
if (!function_exists('getBankByCode')) {
    function getBankByCode($key)
    {
        if (Cache::has('banklist')) {
            $data = Cache::get('banklist');
        } else {
            $data = \think\Db::table('v9_gn_banklist')->column('bank_name', 'bank_code');
            Cache::set('banklist', $data, 3600);
        }
        if (isset($data[$key])) {
            return $data[$key];
        }
        return 'not set';
    }
}
/**
 * getIpRegion 获取ip对应地址
 */
if (!function_exists('getIpRegion')) {
    function getIpRegion($ip)
    {
        $ipr = new \Ip2Region();
        $result = $ipr->binarySearch($ip);
        $result = isset($result['region']) ? $result['region'] : '';
        return str_replace(['|0|0|0|0', '|'], ['', ' '], $result);
    }
}
/**
 * getMobileRegion 获取手机号码归属地
 */
if (!function_exists('getMobileRegion')) {
    function getMobileRegion($mobiles)
    {
        $mobile = substr($mobiles, 0, 7);
        if (Cache::has('mobile_list_' . $mobile)) {
            $data = Cache::get('mobile_list_' . $mobile);
        } else {
            $data = \app\common\model\MobileRegion::where(['mobile' => $mobile])->find();
            if ($data) {
                Cache::set('mobile_list_' . $mobile, $data);
            }
        }
        if (count($data) > 0) {
            if ($data['corp'] == 1) {
                $corp = '中国移动';
            } elseif ($data['corp'] == 2) {
                $corp = '中国联通';
            } elseif ($data['corp'] == 3) {
                $corp = '中国电信';
            } else {
                $corp = $data['corp'];
            }
            return sprintf("<span class='hidden-md'>%s|%s%s</span>", $corp, $data['province'], $data['city']);
        }
        return '<a data-tips-text="点击更新" data-update="' . $mobiles . '" data-field="update" data-action="' . url('@admin/tools/updateMobile') . '" href="javascript:void(0)"><i class="fa fa-refresh"></i></a>';
    }
}
/**
 * getIdRegion 获取身份证归属地
 */
if (!function_exists('getIdRegion')) {
    function getIdRegion($sfz)
    {
        $id = substr($sfz, 0, 6);
        if (Cache::has('sfz_list')) {
            $data = Cache::get('sfz_list');
        } else {
            $data = \app\common\model\SfzRegion::column('desc', 'zone');
            if ($data) {
                Cache::set('sfz_list', $data);
            }
        }
        if (isset($data[$id])) {
            return $data[$id];
        }
        return '';
    }
}

/**
 * getSexLabel 获取性别 1,男,0,女
 */
if (!function_exists('getSexLabel')) {
    function getSexLabel($key)
    {
        if ($key === 1) {
            return '男<span class="hidden-xs"> <i class="fa fa-mars-stroke" style="color: blue"></i></span>';
        }
        return '女<span class="hidden-xs"> <i class="fa fa-venus" style="color: hotpink"></i></span>';
    }
}



/**
 * checkCode 检测短信验证码
 */
if (!function_exists('checkCode')) {
    function checkCode($mobile, $code)
    {
        $request = \think\Request::instance();
        if (CustomCache::has('captcha_' . $mobile . $request->app['id'])) {
            $_code = CustomCache::get('captcha_' . $mobile . $request->app['id']);
            return boolval($code == $_code);
        } else {
            return false;
        }
    }
}

/**
 * sms_lock 短信锁
 */
if (!function_exists('sms_lock')) {
    function sms_lock($mobile)
    {
        /**
         * ip 限制
         * 手机号码限制
         * 5分钟限制
         */
        if (Cache::has('lock_' . $mobile)) {
            return '短信验证码每分钟只能发送一次';
        } else {
            Cache::set('lock_' . $mobile, 1, 60);
        }
        if (Cache::has('sms_lock_' . $mobile)) {
            $times = Cache::get('sms_lock_' . $mobile);
            if ($times >= 10) {
                return '短信验证码每天只能发送10次';
            } else {
                Cache::set('sms_lock_' . $mobile, $times + 1, strtotime(date('Y-m-d')) + 86400 - time());
            }
        } else {
            Cache::set('sms_lock_' . $mobile, 1, strtotime(date('Y-m-d')) + 86400 - time());
        }
        $ip = request()->ip(1);
        if (Cache::has('sms_lock_' . $ip)) {
            $times = Cache::get('sms_lock_' . $ip);
            if ($times >= 100) {
                return '短信验证码每天只能发送100次';
            } else {
                Cache::set('sms_lock_' . $ip, $times + 1, strtotime(date('Y-m-d')) + 86400 - time());
            }
        } else {
            Cache::set('sms_lock_' . $ip, 1, strtotime(date('Y-m-d')) + 86400 - time());
        }
        return false;
    }
}

/**
 * @param $sfz
 * @return array|bool
 * checkID 检查身份证
 * 若校验成功则返回身份证号码、性别和年龄
 */
if (!function_exists('checkID')) {
    function checkID($sfz)
    {
        $sfz = strtoupper(trim($sfz));
        $len = strlen($sfz);
        if ($len != 18) {
            return false;
        }
        $a = str_split($sfz, 1);
        $w = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
        $c = [1, 0, 'X', 9, 8, 7, 6, 5, 4, 3, 2];
        $sum = 0;
        for ($i = 0; $i < 17; $i++) {
            $sum = $sum + $a[$i] * $w[$i];
        }
        $r = $sum % 11;
        $res = $c[$r];
        if ($res == $a[17]) {
            return [
                'id' => $sfz,
                'gender' => substr($sfz, -2, 1) % 2 == 0 ? 0 : 1,
                'age' => date('Y') - substr($sfz, 6, 4),
                'area' => getIdRegion($sfz),
                'birth' => substr($sfz, 6, 8)
            ];
        } else {
            return false;
        }
    }
}
/**
 * @param $name
 * @return bool
 * checkName 检查姓名
 */
if (!function_exists('checkName')) {
    function checkName($name)
    {
        if (preg_match('/^[\x{4e00}-\x{9fa5}]{2,10}(?:·[\x{4e00}-\x{9fa5}]{2,10})*$/u', $name)) {
            return true;
        }
        return false;
    }
}

/**
 * @param $url
 * @return bool
 * checkURL 检查URL
 */
if (!function_exists('checkURL')) {
    function checkURL($url)
    {
        if (preg_match('#(https?://(\S*?\.\S*?))([\s)\[\]{},;"\':<]|\.\s|$)#i', $url)) {
            return true;
        }
        return false;
    }
}
/**
 * @param $url
 * @return bool
 * checkURL 检查手机号码
 */
if (!function_exists('checkMobile')) {
    function checkMobile($mobile)
    {
        $mobile = preg_replace('# #', '', $mobile);
        if (preg_match('/^1[3456789]\d{9}$/', $mobile)) {
            return true;
        }
        return false;
    }
}

if (!function_exists('checkQQ')) {
    function checkQQ($qq)
    {
        if (preg_match('/^[1-9][0-9]{4,14}$/', $qq)) {
            return true;
        }
        return false;
    }
}

if (!function_exists('checkWeiXin')) {
    function checkWeiXin($weixin)
    {
        if (preg_match('/^[a-zA-Z1-9]{1}[-_a-zA-Z0-9]{5,19}$/', $weixin)) {
            return true;
        }
        return false;
    }
}

/**
 * @return mixed|string
 * checkURL 检查URL
 */
if (!function_exists('getIP')) {
    function getIP()
    {
        if (Cache::has('host_ip')) {
            $ip = Cache::get('host_ip');
        } else {
            try {
                $res = file_get_contents('http://city.ip138.com/ip2city.asp');
                preg_match('/\[(.*)\]/', $res, $ip);
                $ip = $ip[1];
                Cache::set('host_ip', $ip, 0);
            } catch (\Exception $e) {
                $ip = '未获取到服务器IP,请刷新试试';
            }
        }
        return $ip;
    }
}

/**
 * @param array $post_data
 * @param bool $encode
 * @return bool|string
 * get_post_str
 */
if (!function_exists('get_post_str')) {
    function get_post_str($post_data = [], $encode = true)
    {
        $o = "";
        foreach ($post_data as $k => $v) {
            if ($encode) {
                $o .= "$k=" . urlencode($v) . "&";
            } else {
                $o .= "$k=" . $v . "&";
            }
        }
        $o = substr($o, 0, -1);
        return $o;
    }
}
/**
 * @param $url
 * @param $type
 * @return mixed
 * checkURL 检查URL
 */
if (!function_exists('download_file')) {
    function download_file($url, $type)
    {
        $request = \think\Request::instance();
        $type = get_mime_by_ext($type);
        $data = [
            'type' => $type,
            'base64' => base64_encode(file_get_contents($url)),
            'app_name' => $request->request('app_name'),
            'app_version' => $request->request('app_version'),
        ];
        $res = json_decode(\service\HttpService::post($request->domain() . '/api/v1/upload', $data), 1);
        return $res['data']['url'];
    }
}

/**
 * 获取当前登录用户的所有下级
 */
if (!function_exists('getAllChildren')) {

    function getAllChildren($userid, $stopid = 1)
    {
        $user = Db::name('system_user')
            ->field('id,pid,username,authorize,phone')
            ->where('pid', '=', $userid)
            ->select();
        $childrens = [];
        if (!empty($user)) {
            foreach ($user as $k => $r) {
                $childrens[] = $r;
                $childrens = array_merge($childrens, getAllChildren($r['id'], $stopid));
            }
        }
        return $childrens;
    }
}
/**
 * 递归取上级数组
 * @param $userid
 */
if (!function_exists('getParent')) {

    function getParent($pid, $stopid = 1)
    {
        $user = Db::name('system_user')
            ->field('id,pid,username,authorize,phone')
            ->where('id', '=', $pid)
            ->find();
        $parent = [];
        if (!empty($user)) {
            $parent[] = $user;
            $parent = array_merge($parent, getParent($user['pid'], $stopid));
        }
        return $parent;
    }
}
/**
 * 获取当前登录用户的所有下级用户
 */
if (!function_exists('getAllChildren2')) {
    function getAllChildren2($pid)
    {
        $ids = [];
        $user = Db::name('system_user')
            ->where('pid', '=', $pid)
            ->where('status', '=', 1)
            ->where('is_deleted', '=', 0)
            ->order('pid desc')
            ->select();
        $ids = array_merge($ids, $user);
        if (count($user) > 0) {
            foreach ($user as $v) {
                $ids = array_merge($ids, getAllChildren2($v['id']));
            }
        }
        return $ids;
    }

}
function getAllChildTable($uid)
{
    $list = getAllChildren2($uid);
    return \service\ToolsService::arr2table($list);
}


if (!function_exists('getAllDays')) {
    /**
     * @param $stimestamp
     * @param $etimestamp
     * @param $default
     * @return array
     */
    function getAllDays($stimestamp, $etimestamp, $default = false)
    {
        // 计算日期段内有多少天
        $days = ($etimestamp - $stimestamp) / 86400;

        // 保存每天日期
        $date = array();

        for ($i = 0; $i < $days; $i++) {
            if ($default) {
                $date[] = [date('Y-m-d', $stimestamp + (86400 * $i)) => $default];
            } else {
                $date[] = date('Y-m-d', $stimestamp + (86400 * $i));
            }
        }

        return $date;
    }
}


if (!function_exists('get_area_bycode')) {
    /**
     *  根据地区编号得到地址
     */
    function get_area()
    {
        if (!Cache::has('area')) {
            $area_res = \app\common\model\Area::field('id,name')
                ->column('name', 'id');
            Cache::set('area', $area_res);
        } else {
            $area_res = Cache::get('area');
        }
        return $area_res;
    }

    function get_area_bycode($location)
    {
        $area = unserialize($location);
        $area_res = get_area();
        $res = '';
        isset($area['province']) && is_numeric($area['province']) ? $res .= $area_res[$area['province']] : '';
        isset($area['city']) && is_numeric($area['city']) ? $res .= $area_res[$area['city']] : '';
        isset($area['town']) && is_numeric($area['town']) ? $res .= $area_res[$area['town']] : '';
        return $res;
    }

    function get_area_by_code($code)
    {
        $area_res = get_area();
        return isset($area_res[$code]) ? $area_res[$code] : '';
    }
}

if (!function_exists('getMarriage')) {
    /**
     * 婚姻汉字
     */
    function getMarriage($id)
    {
        static $data = [
            '1' => '未婚',
            '2' => '已婚',
            '3' => '丧偶',
            '4' => '离婚',];
        if (isset($data[$id])) {
            return $data[$id];
        }
        return $id;
    }
}
if (!function_exists('getGrade')) {
    /**
     * 学历汉字
     */
    function getGrade($id)
    {
        static $data = [
            '1' => '小学',
            '2' => '初中',
            '3' => '高中',
            '4' => '中专',
            '5' => '大专',
            '6' => '本科',
            '7' => '硕士',
            '8' => '博士',
        ];
        if (isset($data[$id])) {
            return $data[$id];
        }
        return $id;
    }
}

// 截取title
if (!function_exists('title_cut')) {
    function title_cut($title, $length = 30): string
    {
        if (mb_strlen($title) > $length) {
            return mb_substr($title, 0, $length) . '...';
        } else {
            return $title;
        }
    }
}
/**
 * api_encrypt API加密 , 私钥
 */
if (!function_exists("ecology_api_encrypt")) {

    function ecology_api_encrypt($in)
    {
        $json = \GuzzleHttp\json_encode($in);
        $un_encrypt = base64_encode($json);
        $key = 'U2F0IEphbiAyMCAx';
        $iv = 'MjowNzozNyBDU1Qg';
        if (!$key || !$iv) {
            return "未配置接口秘钥";
        }
        $encrypted = openssl_encrypt($un_encrypt, 'aes-128-cbc', $key, false, $iv);
        return base64_encode($encrypted);
    }
}


if (!function_exists('password')) {
    /**
     * 对用户的密码进行加密
     */
    function password($password, $encrypt)
    {
        $password = md5(md5(trim($password)) . $encrypt);
        return $password;
    }
}

if (!function_exists('pic_encrypt')) {
    /**
     * 接口加密方法, 此处用来上传文件
     */
    function pic_encrypt($data = [], $key, $iv)
    {
        $data = json_encode($data);
        $encrypted = openssl_encrypt(pad($data), 'AES-128-CBC', $key, OPENSSL_RAW_DATA | OPENSSL_ZERO_PADDING, $iv);
        $data = base64_encode($encrypted);
        return $data;
    }
}

if (!function_exists('pic_decrypt')) {
    /**
     * 接口解密方法, 此处用来上传文件
     */
    function pic_decrypt($encrypted, $key, $iv)
    {
        $decrypted = openssl_decrypt(base64_decode($encrypted), 'AES-128-CBC', $key, OPENSSL_RAW_DATA | OPENSSL_ZERO_PADDING, $iv);
        return json_decode(rtrim($decrypted), 1);
    }
}

if (!function_exists('arraySort')) {
    /**
     * 二维数组排序
     */
    function arraySort($array, $field, $sort = SORT_ASC)
    {
        $arrSort = array();
        foreach ($array as $uniqid => $row) {
            foreach ($row as $key => $value) {
                $arrSort[$key][$uniqid] = $value;
            }
        }
        array_multisort($arrSort[$field], $sort, $array);
        return $array;
    }
}
/**
 * checkIp IP检测
 */
if (!function_exists('checkIp')) {
    function checkIp($ip, $range)
    {
        if (!strripos($range, '/')) {
            return ip2long($ip) === ip2long($range);
        }
        list ($subnet, $bits) = explode('/', $range);
        $ip = ip2long($ip);
        $subnet = ip2long($subnet);
        $mask = -1 << (32 - $bits);
        $subnet &= $mask; # nb: in case the supplied subnet wasn't correctly aligned
        return ($ip & $mask) == $subnet;
    }

    function checkIpFromConfig()
    {
        $list = sysconf('ipwhitelist');
        if ($list == '') {
            return true;
        }
        $list = explode(',', $list);
        $checked = false;
        foreach ($list as $item) {
            if (checkIp(\think\Request::instance()->ip(), $item)) {
                $checked = true;
                break;
            }
        }
        if (!$checked) {
            return false;
        }
        return true;
    }

    function except_group($user)
    {
        $list = sysconf('except_group');
        if ($list == '') {
            return true;
        }
        $list = explode(',', $list);
        if (in_array($user['authorize'], $list)) {
            return true;
        }
        return false;
    }

    //设备信息
    function get_device_info()
    {
        $request = \think\Request::instance();
        $ua = $request->server('HTTP_USER_AGENT');
        if (strpos($ua, 'okhttp/3.2.0') !== false) {
            return 'Android';
        } elseif (strpos($ua, 'iOS') !== false) {
            return 'IOS';
        } else {
            if (strpos($ua, 'Android') !== false) {
                return 'Android';
            } elseif (strpos($ua, 'iPhone') !== false) {
                return 'IOS';
            } elseif (strpos($ua, 'iPad') !== false) {
                return 'IOS';
            }
        }
    }
}
