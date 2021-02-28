class LoginModel {
  String date;
  LoginModelObj obj;
  bool success;

  LoginModel({this.date, this.obj, this.success});

  LoginModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    obj = json['obj'] != null ? new LoginModelObj.fromJson(json['obj']) : null;
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

class LoginModelObj {
  int dateType;
  bool grayUser;
  int ifEvip;
  int ifForbid;
  int memberType;
  String mobile;
  bool newMember;
  String redirectUrl;
  int scene;
  int svipCardType;
  String token;
  String userId;

  LoginModelObj(
      {this.dateType,
      this.grayUser,
      this.ifEvip,
      this.ifForbid,
      this.memberType,
      this.mobile,
      this.newMember,
      this.redirectUrl,
      this.scene,
      this.svipCardType,
      this.token,
      this.userId});

  LoginModelObj.fromJson(Map<String, dynamic> json) {
    dateType = json['dateType'];
    grayUser = json['grayUser'];
    ifEvip = json['ifEvip'];
    ifForbid = json['ifForbid'];
    memberType = json['memberType'];
    mobile = json['mobile'];
    newMember = json['newMember'];
    redirectUrl = json['redirectUrl'];
    scene = json['scene'];
    svipCardType = json['svipCardType'];
    token = json['token'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dateType'] = this.dateType;
    data['grayUser'] = this.grayUser;
    data['ifEvip'] = this.ifEvip;
    data['ifForbid'] = this.ifForbid;
    data['memberType'] = this.memberType;
    data['mobile'] = this.mobile;
    data['newMember'] = this.newMember;
    data['redirectUrl'] = this.redirectUrl;
    data['scene'] = this.scene;
    data['svipCardType'] = this.svipCardType;
    data['token'] = this.token;
    data['userId'] = this.userId;
    return data;
  }
}
