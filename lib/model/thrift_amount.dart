class ThriftAmount {
  String date;
  ThriftAmountObj obj;
  bool success;

  ThriftAmount({this.date, this.obj, this.success});

  ThriftAmount.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    obj = json['obj'] != null ? new ThriftAmountObj.fromJson(json['obj']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.obj != null) {
      data['obj'] = this.obj.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class ThriftAmountObj {
  String beginTime;
  double thriftAmount;
  int unusedCoupon;
  int usedCoupon;
  int usedType;

  ThriftAmountObj(
      {this.beginTime,
        this.thriftAmount,
        this.unusedCoupon,
        this.usedCoupon,
        this.usedType});

  ThriftAmountObj.fromJson(Map<String, dynamic> json) {
    beginTime = json['beginTime'];
    thriftAmount = json['thriftAmount'];
    unusedCoupon = json['unusedCoupon'];
    usedCoupon = json['usedCoupon'];
    usedType = json['usedType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['beginTime'] = this.beginTime;
    data['thriftAmount'] = this.thriftAmount;
    data['unusedCoupon'] = this.unusedCoupon;
    data['usedCoupon'] = this.usedCoupon;
    data['usedType'] = this.usedType;
    return data;
  }
}
