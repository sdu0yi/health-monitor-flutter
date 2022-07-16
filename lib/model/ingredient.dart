class Ingredient {
  String? iid;
  String? iname;
  String? taboos;
  String? introduction;
  String? value;
  String? effect;
  String? applicablePeople;
  String? tabooPeople;
  String? skill;

  Ingredient(
      {this.iid,
      this.iname,
      this.taboos,
      this.introduction,
      this.value,
      this.effect,
      this.applicablePeople,
      this.tabooPeople,
      this.skill});

  Ingredient.fromJson(Map<String, dynamic> json) {
    iid = json['iid'];
    iname = json['iname'];
    taboos = json['taboos'];
    introduction = json['introduction'];
    value = json['value'];
    effect = json['effect'];
    applicablePeople = json['applicable_people'];
    tabooPeople = json['taboo_people'];
    skill = json['skill'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['iid'] = iid;
    data['iname'] = iname;
    data['taboos'] = taboos;
    data['introduction'] = introduction;
    data['value'] = value;
    data['effect'] = effect;
    data['applicable_people'] = applicablePeople;
    data['taboo_people'] = tabooPeople;
    data['skill'] = skill;
    return data;
  }
}
