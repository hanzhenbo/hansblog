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

namespace app\admin\controller;

use controller\BasicAdmin;
use PhpOffice\PhpSpreadsheet\IOFactory;
use service\DataService;
use service\NodeService;
use service\ToolsService;
use think\App;
use think\Db;

/**
 * 后台入口
 * Class Index
 * @package app\admin\controller
 * @author Anyon <zoujingli@qq.com>
 * @date 2017/02/15 10:41
 */
class Index extends BasicAdmin
{

    /**
     * 后台框架布局
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function index()
    {
        NodeService::applyAuthNode();
        $list = (array)Db::name('SystemMenu')->where(['status' => '1'])->order('sort asc,id asc')->select();
        $menus = $this->buildMenuData(ToolsService::arr2tree($list), NodeService::get(), !!session('user'));
        if (empty($menus) && !session('user.id')) {
            $this->redirect('@admin/login');
        }
        return $this->fetch('', ['title' => '系统管理', 'menus' => $menus]);
    }

    /**
     * 后台主菜单权限过滤
     * @param array $menus 当前菜单列表
     * @param array $nodes 系统权限节点数据
     * @param bool $isLogin 是否已经登录
     * @return array
     */
    private function buildMenuData($menus, $nodes, $isLogin)
    {
        foreach ($menus as $key => &$menu) {
            !empty($menu['sub']) && $menu['sub'] = $this->buildMenuData($menu['sub'], $nodes, $isLogin);
            if (!empty($menu['sub'])) {
                $menu['url'] = '#';
            } elseif (preg_match('/^https?\:/i', $menu['url'])) {
                continue;
            } elseif ($menu['url'] !== '#') {
                $node = join('/', array_slice(explode('/', preg_replace('/[\W]/', '/', $menu['url'])), 0, 3));
                $menu['url'] = url($menu['url']) . (empty($menu['params']) ? '' : "?{$menu['params']}");
                if (isset($nodes[$node]) && $nodes[$node]['is_login'] && empty($isLogin)) {
                    unset($menus[$key]);
                } elseif (isset($nodes[$node]) && $nodes[$node]['is_auth'] && $isLogin && !auth($node)) {
                    unset($menus[$key]);
                }
            } else {
                unset($menus[$key]);
            }
        }
        return $menus;
    }

    /**
     * 主机信息显示
     * @return string
     */
    public function main()
    {
        $_version = Db::query('select version() as ver');
        return $this->fetch('', [
            'title'     => '后台首页',
            'think_ver' => App::VERSION,
            'mysql_ver' => array_pop($_version)['ver'],
        ]);
    }

    /**
     * 修改密码
     * @return array|string
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     * @throws \think\exception\PDOException
     */
    public function pass()
    {
        if (intval($this->request->request('id')) !== intval(session('user.id'))) {
            $this->error('只能修改当前用户的密码！');
        }
        if ($this->request->isGet()) {
            $this->assign('verify', true);
            return $this->_form('SystemUser', 'user/pass');
        }
        $data = $this->request->post();
        if ($data['password'] !== $data['repassword']) {
            $this->error('两次输入的密码不一致，请重新输入！');
        }
        $user = Db::name('SystemUser')->where('id', session('user.id'))->find();
        if (md5($data['oldpassword']) !== $user['password']) {
            $this->error('旧密码验证失败，请重新输入！');
        }
        if (DataService::save('SystemUser', ['id' => session('user.id'), 'password' => md5($data['password'])])) {
            $this->success('密码修改成功，下次请使用新密码登录！', '');
        }
        $this->error('密码修改失败，请稍候再试！');
    }

    /**
     * 修改资料
     * @return array|string
     * @throws \think\Exception
     * @throws \think\db\exception\DataNotFoundException
     * @throws \think\db\exception\ModelNotFoundException
     * @throws \think\exception\DbException
     */
    public function info()
    {
        if (intval($this->request->request('id')) === intval(session('user.id'))) {
            return $this->_form('SystemUser', 'user/form');
        }
        $this->error('只能修改当前用户的资料！');
    }


    public function phpinfo()
    {
        echo phpinfo();
    }

    public function upload_excel()
    {
        if ($this->request->isPost()) {
            $file = $this->request->post('file');
            if ($file == '') {
                $this->error('请先上传文件!');
            }
            $file = PROJECT_PATH . str_replace($this->request->domain(), '', $file);
            return $this->import_customer($file);
        }
        return $this->fetch('upload_excel');
    }


    private function import_customer($file)
    {
        set_time_limit(0);
        ignore_user_abort(1);

        $reader = IOFactory::createReader('Xlsx');
        $reader->setReadDataOnly(TRUE);
        $PHPExcel = $reader->load($file);
        $sheet = $PHPExcel->getActiveSheet();

        $colNum = ord($sheet->getHighestColumn()) - ord('A') + 1;
        $rowNum = $sheet->getHighestRow();
        if ($rowNum > 5000) {
            $this->error('一次最多导入5000条数据');
        }
        $data = [];
        for ($i = 2; $i <= $rowNum; $i++) {
            $tmp = [];
            for ($j = 1; $j <= $colNum; $j++) {
                $tmp[] = $sheet->getCellByColumnAndRow($j, $i)->getValue();
            }
            array_push($data, $tmp);
        }
        foreach ($data as $k => $v) {
            $arraylength = implode('', $v);
            if (empty($arraylength)) {
                unset($data[$k]);
            }
        }
        $insertArr = [];
        $repeat_tel = [];
//        dump($data);
//        die;
        $new = [];
        foreach ($data as $key => $item) {
            $new[$item[2]] = $item[3];
        }
        dump($new);
        die;


    }

}
