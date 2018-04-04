<?php
/**
 * @link http://blog.kunx.org
 * @author kunx <kunx-edu@qq.com>
 * 微信扫码支付示例代码
 */

namespace app\mobile\controller;
use think\Session;
use think\Config;
use think\Db;
use app\mobile\model\Order as OrderModel;

class Qiao extends \think\Controller {
    protected function _initialize()
    {
        parent::_initialize();
        $this->order_model=new OrderModel();
    }
    /**
     * 用户可以看到的订单支付表单页面，目前只有一个二维码而已。
     * @return type
     */
    public function index() {
        if(Session::get('user_id')==""){
            $this->error('请注册或者登陆后进行购买观看', 'mobile/');
        }
        ini_set('date.timezone', 'Asia/Shanghai');
        \think\Loader::import('wxpay.Autoloader');
        $notify = new \NativePay();
        //模式二
        /**
         * 流程：
         * 1、调用统一下单，取得code_url，生成二维码
         * 2、用户扫描二维码，进行支付
         * 3、支付完成之后，微信服务器会通知支付成功
         * 4、在支付成功通知中需要查单确认是否真正支付成功（见：wxpayNotify方法）
         */
        $money=Session::get('money');
        $o_id=Session::get('o_id');

        $input  = new \WxPayUnifiedOrder();
        $input->SetBody("百亿欧商品订单");
        $input->SetOut_trade_no(\WxPayConfig::$appid . mt_rand(1000, 9999));
        $input->SetTotal_fee($money*100);
        $input->SetTime_start(date("YmdHis"));
        $input->SetTime_expire(date("YmdHis", time() + 300));//有效期最少5分钟
        $input->SetGoods_tag("blog.kunx.org");
        $input->SetAttach($o_id);
        $input->SetProduct_id($o_id);
        
        $url    = \think\Url::build('wxpayNotify', '', true, true);
        $input->SetNotify_url($url);
        
        $input->SetTrade_type("NATIVE");
        $result = $notify->GetPayUrl($input);
        //dump($result);
        $url2   = $result["code_url"];
        $url2   = base64_encode($url2);

        //渲染一个视图，参数用于获取验证码。
        return $this->fetch('Qiao', ['text' => $url2,'money'=>$money]);
    }

    /**
     * 二维码。
     * @param string $text
     * @return png
     */
    public function qrcode($text) {
        \think\Loader::import('qrcode.qrcode');
        $text = base64_decode($text);
        return \QRcode::png($text);
        exit;
    }

    /**
     * 微信通知页面。
     */
    public function wxpayNotify() {
        ini_set('date.timezone', 'Asia/Shanghai');
        \think\Loader::import('wxpay.Autoloader');
        error_reporting(E_ERROR);

        //初始化日志
        $logHandler = new \CLogFileHandler("../logs/" . date('Y-m-d') . '.log');
        \Log::Init($logHandler, 15);
        \Log::DEBUG("begin notify");
        
        //在PayNotifyCallBack中重写了NotifyProcess，会发起一个订单支付状态查询，其实也可以不去查询，因为从php://input中已经可以获取到订单状态。file_get_contents("php://input")
        //$notify = new \WxPayNotify();
        $notify = new \PayNotifyCallBack();
        $notify->Handle(false);
        $result = $notify->GetValues();
        file_put_contents('./log.txt', file_get_contents('php://input'));
        if ($result['return_code'] == 'SUCCESS') {
            Session::delete('money');
            Session::delete('o_id');

            $o_id=$result['attach'];
            $data['transaction_id']=$result['transaction_id'];
            $data['o_off']='2';
            if ($this->order_model->save($data, $o_id) !== false) {
                $user_id=Session::get('user_id');
                $score=($result['total_fee']/100);
                Db::name('user')->where('id', $user_id)->setInc('score', $score);
                $this->success('更新成功');
            } 
        }
        \Log::DEBUG("end notify");
        \Log::INFO(str_repeat("=", 20));
    }
}
