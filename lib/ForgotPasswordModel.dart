class ForgotPasswordModel{
  String email;
  String password;
  ForgotPasswordModel({this.email, this.password});

  ForgotPasswordModel.fromJson(Map<String, dynamic> json){
    this.email = json['user_email'];
    this.password = json['user_password'];
  }
}