class ApiResponse {
  int _status;
  String _message;

  ApiResponse({int status, String message}) {
    this._status = status;
    this._message = message;
  }

  int get status => _status;
  set status(int status) => _status = status;
  String get message => _message;
  set message(String message) => _message = message;

  ApiResponse.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    _message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    data['message'] = this._message;
    return data;
  }
}