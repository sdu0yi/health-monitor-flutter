
/// response包装类
class Response<T> {
  int? code;
  String? msg;
  T? data;
  List<T>? datas;

  Response({this.code, this.msg, this.data, this.datas});

  Response.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = json['data'];
    datas = json['datas'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['msg'] = msg;
    data['data'] = this.data;
    data['datas'] = datas;
    return data;
  }
}

