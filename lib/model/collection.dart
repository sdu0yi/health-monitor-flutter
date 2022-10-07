class Collection {
  int? cid;
  String? cname;
  int? healthScore;
  String? cphoto;
  String? introduction;

  Collection(
      {this.cid, this.cname, this.healthScore, this.cphoto, this.introduction});

  Collection.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    cname = json['cname'];
    healthScore = json['health_score'];
    cphoto = json["cphoto"];
    introduction = json["introduction"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cid'] = cid;
    data['cname'] = cname;
    data['health_score'] = healthScore;
    data['cphoto'] = cphoto;
    data['introduction'] = introduction;
    return data;
  }
}
