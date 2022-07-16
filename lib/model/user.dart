class User {
  int? uid;
  String? uname;
  String? avatar;

  User({this.uid, this.uname, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    uname = json['uname'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['uid'] = uid;
    data['uname'] = uname;
    data['avatar'] = avatar;
    return data;
  }
}
