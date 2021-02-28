const host = 'https://mcs-mimp-web.sf-express.com/mcs-mimp';

class SklApi {
  // 超值福利获取广告接口
  static final String cxAdvertiseInfo = '$host/member/cxAdvertise/info';
  // 获取卡片气泡信息
  static final String sfWelfareBubble = '$host/sfwelfare/bubble';
  // 预计省钱接口
  static final String superWelfareThriftAmount = '$host/sfwelfare/superWelfareThriftAmount';
  // 获取礼包接口
  static final String packetList = '$host/sfwelfare/packetList';
  // 获取礼包接口
  static final String packetDetail = '$host/sfwelfare/packetDetail';
  // 短信验证码接口
  static final String sendValidCode = '$host/sfgift/sendValidCode';
  // 登录接口
  static final String loginByMobile = '$host/loginByMobile';
  // 查询会员信息
  static final String personInfo = '$host/member/personalInfo';
}

