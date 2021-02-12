class LoginResultModel {
  User _user;
  int _status;

  LoginResultModel({User user, int status}) {
    this._user = user;
    this._status = status;
  }

  User get user => _user;
  set user(User user) => _user = user;
  int get status => _status;
  set status(int status) => _status = status;

  LoginResultModel.fromJson(Map<String, dynamic> json) {
    _user = json['user'] != null ? new User.fromJson(json['user']) : null;
    _status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this._user != null) {
      data['user'] = this._user.toJson();
    }
    data['status'] = this._status;
    return data;
  }
}

class User {
  String _userId;
  String _userName;
  String _userEmail;
  String _userPassword;
  String _userNumber;
  String _createdAt;
  String _updatedAt;

  User(
      {String userId,
        String userName,
        String userEmail,
        String userPassword,
        String userNumber,
        String createdAt,
        String updatedAt}) {
    this._userId = userId;
    this._userName = userName;
    this._userEmail = userEmail;
    this._userPassword = userPassword;
    this._userNumber = userNumber;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  String get userId => _userId;
  set userId(String userId) => _userId = userId;
  String get userName => _userName;
  set userName(String userName) => _userName = userName;
  String get userEmail => _userEmail;
  set userEmail(String userEmail) => _userEmail = userEmail;
  String get userPassword => _userPassword;
  set userPassword(String userPassword) => _userPassword = userPassword;
  String get userNumber => _userNumber;
  set userNumber(String userNumber) => _userNumber = userNumber;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  User.fromJson(Map<String, dynamic> json) {
    _userId = json['user_id'];
    _userName = json['user_name'];
    _userEmail = json['user_email'];
    _userPassword = json['user_password'];
    _userNumber = json['user_number'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this._userId;
    data['user_name'] = this._userName;
    data['user_email'] = this._userEmail;
    data['user_password'] = this._userPassword;
    data['user_number'] = this._userNumber;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}