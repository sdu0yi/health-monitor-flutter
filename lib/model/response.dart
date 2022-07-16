
/// response包装类
class Response {
  int? code;
  String? msg;
  Object? data;

  Response({this.code, this.msg, this.data});

  Response.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    data['data'] = this.data;
    return data;
  }
}

