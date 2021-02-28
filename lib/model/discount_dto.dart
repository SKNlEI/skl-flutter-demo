class DiscountDto {
  Null requestId;
  bool success;
  Null business;
  String errorCode;
  String errorMessage;
  Null params;
  String date;
  Null version;
  DiscountDtoObj obj;

  DiscountDto(
      {this.requestId,
        this.success,
        this.business,
        this.errorCode,
        this.errorMessage,
        this.params,
        this.date,
        this.version,
        this.obj});

  DiscountDto.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    success = json['success'];
    business = json['business'];
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    params = json['params'];
    date = json['date'];
    version = json['version'];
    obj = json['obj'] != null ? new DiscountDtoObj.fromJson(json['obj']) : null;
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

class DiscountDtoObj {
  int total;
  int countDown;
  List<DiscountDtoItem> list;
  String title;

  DiscountDtoObj({this.total, this.countDown, this.list, this.title});

  DiscountDtoObj.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    countDown = json['countDown'];
    if (json['list'] != null) {
      list = new List<DiscountDtoItem>();
      json['list'].forEach((v) {
        list.add(new DiscountDtoItem.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['countDown'] = this.countDown;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    return data;
  }
}

class DiscountDtoItem {
  String packetId;
  String listLabel;
  int originalPrice;
  String packetPic;
  int currentStock;
  String recommend;
  String packetName;
  int stock;
  int realPrice;

  DiscountDtoItem(
      {this.packetId,
        this.listLabel,
        this.originalPrice,
        this.packetPic,
        this.currentStock,
        this.recommend,
        this.packetName,
        this.stock,
        this.realPrice});

  DiscountDtoItem.fromJson(Map<String, dynamic> json) {
    packetId = json['packetId'];
    listLabel = json['listLabel'];
    originalPrice = json['originalPrice'];
    packetPic = json['packetPic'];
    currentStock = json['currentStock'];
    recommend = json['recommend'];
    packetName = json['packetName'];
    stock = json['stock'];
    realPrice = json['realPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['packetId'] = this.packetId;
    data['listLabel'] = this.listLabel;
    data['originalPrice'] = this.originalPrice;
    data['packetPic'] = this.packetPic;
    data['currentStock'] = this.currentStock;
    data['recommend'] = this.recommend;
    data['packetName'] = this.packetName;
    data['stock'] = this.stock;
    data['realPrice'] = this.realPrice;
    return data;
  }
}
