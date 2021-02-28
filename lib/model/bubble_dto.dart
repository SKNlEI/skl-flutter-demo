class BubbleModel {
  String date;
  BubbleModelObj obj;
  bool success;

  BubbleModel({this.date, this.obj, this.success});

  BubbleModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    obj = json['obj'] != null ? new BubbleModelObj.fromJson(json['obj']) : null;
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

class BubbleModelObj {
  String express;
  String gift;
  String svip;

  BubbleModelObj({this.express, this.gift, this.svip});

  BubbleModelObj.fromJson(Map<String, dynamic> json) {
    express = json['express'];
    gift = json['gift'];
    svip = json['svip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['express'] = this.express;
    data['gift'] = this.gift;
    data['svip'] = this.svip;
    return data;
  }
}
