class LoginModel{
  String email;
  String password;
  LoginModel({String email, String password}){
    this.email = email;
    this.password = password;
  }

  LoginModel.fromJson(Map<String, dynamic> json){
    this.email = json['user_email'];
    this.password = json['user_password'];
  }
}