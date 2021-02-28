class PacketDetailDto {
  Null requestId;
  bool success;
  Null business;
  Null errorCode;
  Null errorMessage;
  Null params;
  String date;
  Null version;
  PacketDetailDtoObj obj;

  PacketDetailDto(
      {this.requestId,
        this.success,
        this.business,
        this.errorCode,
        this.errorMessage,
        this.params,
        this.date,
        this.version,
        this.obj});

  PacketDetailDto.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    success = json['success'];
    business = json['business'];
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    params = json['params'];
    date = json['date'];
    version = json['version'];
    obj = json['obj'] != null ? new PacketDetailDtoObj.fromJson(json['obj']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['requestId'] = this.requestId;
    data['success'] = this.success;
    data['business'] = this.business;
    data['errorCode'] = this.errorCode;
    data['errorMessage'] = this.errorMessage;
    data['params'] = this.params;
    data['date'] = this.date;
    data['version'] = this.version;
    if (this.obj != null) {
      data['obj'] = this.obj.toJson();
    }
    return data;
  }
}

class PacketDetailDtoObj {
  String packetType;
  String packetId;
  double originalPrice;
  String packetPic;
  String packetRule;
  String detailsLabel;
  int currentStock;
  int countDown;
  List<CouponInfos> couponInfos;
  String packetName;
  int stock;
  double realPrice;

  PacketDetailDtoObj(
      {this.packetType,
        this.packetId,
        this.originalPrice,
        this.packetPic,
        this.packetRule,
        this.detailsLabel,
        this.currentStock,
        this.countDown,
        this.couponInfos,
        this.packetName,
        this.stock,
        this.realPrice});

  PacketDetailDtoObj.fromJson(Map<String, dynamic> json) {
    packetType = json['packetType'];
    packetId = json['packetId'];
    originalPrice = json['originalPrice'];
    packetPic = json['packetPic'];
    packetRule = json['packetRule'];
    detailsLabel = json['detailsLabel'];
    currentStock = json['currentStock'];
    countDown = json['countDown'];
    if (json['couponInfos'] != null) {
      couponInfos = new List<CouponInfos>();
      json['couponInfos'].forEach((v) {
        couponInfos.add(new CouponInfos.fromJson(v));
      });
    }
    packetName = json['packetName'];
    stock = json['stock'];
    realPrice = json['realPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['packetType'] = this.packetType;
    data['packetId'] = this.packetId;
    data['originalPrice'] = this.originalPrice;
    data['packetPic'] = this.packetPic;
    data['packetRule'] = this.packetRule;
    data['detailsLabel'] = this.detailsLabel;
    data['currentStock'] = this.currentStock;
    data['countDown'] = this.countDown;
    if (this.couponInfos != null) {
      data['couponInfos'] = this.couponInfos.map((v) => v.toJson()).toList();
    }
    data['packetName'] = this.packetName;
    data['stock'] = this.stock;
    data['realPrice'] = this.realPrice;
    return data;
  }
}

class CouponInfos {
  String couponName;
  int couponType;
  int pledgeMoney;
  int couponCounts;
  String couponId;
  int maxExchangeMoney;
  String invalidTm;
  int invalidTmType;

  CouponInfos(
      {this.couponName,
        this.couponType,
        this.pledgeMoney,
        this.couponCounts,
        this.couponId,
        this.maxExchangeMoney,
        this.invalidTm,
        this.invalidTmType});

  CouponInfos.fromJson(Map<String, dynamic> json) {
    couponName = json['couponName'];
    couponType = json['couponType'];
    pledgeMoney = json['pledgeMoney'];
    couponCounts = json['couponCounts'];
    couponId = json['couponId'];
    maxExchangeMoney = json['maxExchangeMoney'];
    invalidTm = json['invalidTm'];
    invalidTmType = json['invalidTmType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['couponName'] = this.couponName;
    data['couponType'] = this.couponType;
    data['pledgeMoney'] = this.pledgeMoney;
    data['couponCounts'] = this.couponCounts;
    data['couponId'] = this.couponId;
    data['maxExchangeMoney'] = this.maxExchangeMoney;
    data['invalidTm'] = this.invalidTm;
    data['invalidTmType'] = this.invalidTmType;
    return data;
  }
}
