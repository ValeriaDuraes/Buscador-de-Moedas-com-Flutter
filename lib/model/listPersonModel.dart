class ListPersonModel {
  String? createdAt;
  String? name;
  String? avatar;
  String? id;

  ListPersonModel({this.createdAt, this.name, this.avatar, this.id});

  ListPersonModel.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    name = json['name'];
    avatar = json['avatar'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['id'] = this.id;
    return data;
  }
}
