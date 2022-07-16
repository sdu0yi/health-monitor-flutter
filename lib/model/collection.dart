class Collection {
  int? cid;
  String? cname;
  int? healthScore;

  Collection({this.cid, this.cname, this.healthScore});

  Collection.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    cname = json['cname'];
    healthScore = json['health_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cid'] = cid;
    data['cname'] = cname;
    data['health_score'] = healthScore;
    return data;
  }
}
