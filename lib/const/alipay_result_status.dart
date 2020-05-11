class AlipayResultStatus{

  // 订单支付成功
  static const ERR_OK = 9000;
  // 正在处理中，支付结果未知（有可能已经支付成功），请查询商户订单列表中订单的支付状态
  static const ERR_PENDING = 8000;
  // 订单支付失败
  static const ERR_COMM = 4000;
  // 重复请求
  static const ERR_DUPLICATE = 5000;
  // 用户中途取消
  static const ERR_CANCEL = 6001;
  // 网络连接出错
  static const ERR_CONN = 6002;
  // 支付结果未知（有可能已经支付成功），请查询商户订单列表中订单的支付状态
  static const ERR_UNKNOWN = 6004;
}