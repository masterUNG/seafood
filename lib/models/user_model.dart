class UserModel {
  String chooseType;
  String name;
  String user;
  String password;
  String urlimage;
  String lat;
  String lng;

  UserModel(
      {this.chooseType,
      this.name,
      this.user,
      this.password,
      this.urlimage,
      this.lat,
      this.lng});

  UserModel.fromJson(Map<String, dynamic> json) {
    chooseType = json['chooseType'];
    name = json['name'];
    user = json['user'];
    password = json['password'];
    urlimage = json['urlimage'];
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chooseType'] = this.chooseType;
    data['name'] = this.name;
    data['user'] = this.user;
    data['password'] = this.password;
    data['urlimage'] = this.urlimage;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    return data;
  }
}

