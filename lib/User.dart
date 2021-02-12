class User {
  String _userName;
  String _userEmail;
  String _userNumber;
  String _userPassword;

  User(
      {String userName,
        String userEmail,
        String userNumber,
        String userPassword}) {
    this._userName = userName;
    this._userEmail = userEmail;
    this._userNumber = userNumber;
    this._userPassword = userPassword;
  }


  String get userName => _userName;
  set userName(String userName) => _userName = userName;
  String get userEmail => _userEmail;
  set userEmail(String userEmail) => _userEmail = userEmail;
  String get userNumber => _userNumber;
  set userNumber(String userNumber) => _userNumber = userNumber;
  String get userPassword => _userPassword;
  set userPassword(String userPassword) => _userPassword = userPassword;

  User.fromJson(Map<String, dynamic> json) {
    _userName = json['user_name'];
    _userEmail = json['user_email'];
    _userNumber = json['user_number'];
    _userPassword = json['user_password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_name'] = this._userName;
    data['user_email'] = this._userEmail;
    data['user_number'] = this._userNumber;
    data['user_password'] = this._userPassword;
    return data;
  }
}
