class LimitPacketList {
  Null requestId;
  bool success;
  Null business;
  Null errorCode;
  Null errorMessage;
  Null params;
  String date;
  Null version;
  LimitPacketListObj obj;

  LimitPacketList(
      {this.requestId,
        this.success,
        this.business,
        this.errorCode,
        this.errorMessage,
        this.params,
        this.date,
        this.version,
        this.obj});

  LimitPacketList.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    success = json['success'];
    business = json['business'];
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    params = json['params'];
    date = json['date'];
    version = json['version'];
    obj = json['obj'] != null ? new LimitPacketListObj.fromJson(json['obj']) : null;
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

class LimitPacketListObj {
  int ifStart;
  int total;
  String finishTitle;
  int startBuyTime;
  int countDown;
  List<PackList> list;
  String title;

  LimitPacketListObj(
      {this.ifStart,
        this.total,
        this.finishTitle,
        this.startBuyTime,
        this.countDown,
        this.list,
        this.title});

  LimitPacketListObj.fromJson(Map<String, dynamic> json) {
    ifStart = json['ifStart'];
    total = json['total'];
    finishTitle = json['finishTitle'];
    startBuyTime = json['startBuyTime'];
    countDown = json['countDown'];
    if (json['list'] != null) {
      list = new List<PackList>();
      json['list'].forEach((v) {
        list.add(new PackList.fromJson(v));
      });
    }
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ifStart'] = this.ifStart;
    data['total'] = this.total;
    data['finishTitle'] = this.finishTitle;
    data['startBuyTime'] = this.startBuyTime;
    data['countDown'] = this.countDown;
    if (this.list != null) {
      data['list'] = this.list.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    return data;
  }
}

class PackList {
  String packetId;
  String listLabel;
  double originalPrice;
  String packetPic;
  int currentStock;
  String recommend;
  String packetName;
  int stock;
  double realPrice;

  PackList(
      {this.packetId,
        this.listLabel,
        this.originalPrice,
        this.packetPic,
        this.currentStock,
        this.recommend,
        this.packetName,
        this.stock,
        this.realPrice});

  PackList.fromJson(Map<String, dynamic> json) {
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
