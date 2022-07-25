

/// response包装类
class ResponseWrapper {
  String? code;
  String? msg;
  dynamic data;
  List<dynamic>? datas;

  ResponseWrapper({this.code, this.msg, this.data, this.datas});

  ResponseWrapper.fromJson(Map<String, dynamic> json) {
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

  @override
  String toString() {
    return 'ResponseWrapper{code: $code, msg: $msg, data: $data, datas: $datas}';
  }
}

