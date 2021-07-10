class LoginModel {
  String usernameOrEmail;
  String password;

  LoginModel({this.usernameOrEmail, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    usernameOrEmail = json['usernameOrEmail'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usernameOrEmail'] = this.usernameOrEmail;
    data['password'] = this.password;
    return data;
  }
}
