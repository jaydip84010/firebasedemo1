class Model {
  String? password;
  String? mobile;
  String? name;
  String? email;

  Model({this.password, this.mobile, this.name, this.email});

  Model.fromJson(Map<String, dynamic> json) {
    password = json['password'];
    mobile = json['mobile'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['password'] = this.password;
    data['mobile'] = this.mobile;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
