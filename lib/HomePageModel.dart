class Model {
  int _status;
  List<GetNgos> _getNgos;

  Model({int status, List<GetNgos> getNgos}) {
    this._status = status;
    this._getNgos = getNgos;
  }

  int get status => _status;
  set status(int status) => _status = status;
  List<GetNgos> get getNgos => _getNgos;
  set getNgos(List<GetNgos> getNgos) => _getNgos = getNgos;

  Model.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['get_ngos'] != null) {
      _getNgos = new List<GetNgos>();
      json['get_ngos'].forEach((v) {
        _getNgos.add(new GetNgos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._getNgos != null) {
      data['get_ngos'] = this._getNgos.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetNgos {
  int _ngoId;
  String _ngoContact;
  String _ngoName;
  String _ngoAddress;
  String _ngoLogoImageName;
  String _ngoLogoPath;
  String _createdAt;
  String _updatedAt;

  GetNgos(
      {int ngoId,
        String ngoContact,
        String ngoName,
        String ngoAddress,
        String ngoLogoImageName,
        String ngoLogoPath,
        String createdAt,
        String updatedAt}) {
    this._ngoId = ngoId;
    this._ngoContact = ngoContact;
    this._ngoName = ngoName;
    this._ngoAddress = ngoAddress;
    this._ngoLogoImageName = ngoLogoImageName;
    this._ngoLogoPath = ngoLogoPath;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get ngoId => _ngoId;
  set ngoId(int ngoId) => _ngoId = ngoId;
  String get ngoContact => _ngoContact;
  set ngoContact(String ngoContact) => _ngoContact = ngoContact;
  String get ngoName => _ngoName;
  set ngoName(String ngoName) => _ngoName = ngoName;
  String get ngoAddress => _ngoAddress;
  set ngoAddress(String ngoAddress) => _ngoAddress = ngoAddress;
  String get ngoLogoImageName => _ngoLogoImageName;
  set ngoLogoImageName(String ngoLogoImageName) =>
      _ngoLogoImageName = ngoLogoImageName;
  String get ngoLogoPath => _ngoLogoPath;
  set ngoLogoPath(String ngoLogoPath) => _ngoLogoPath = ngoLogoPath;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  GetNgos.fromJson(Map<String, dynamic> json) {
    _ngoId = json['ngo_id'];
    _ngoContact = json['ngo_contact'];
    _ngoName = json['ngo_name'];
    _ngoAddress = json['ngo_address'];
    _ngoLogoImageName = json['ngo_logo_image_name'];
    _ngoLogoPath = json['ngo_logo_path'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ngo_id'] = this._ngoId;
    data['ngo_contact'] = this._ngoContact;
    data['ngo_name'] = this._ngoName;
    data['ngo_address'] = this._ngoAddress;
    data['ngo_logo_image_name'] = this._ngoLogoImageName;
    data['ngo_logo_path'] = this._ngoLogoPath;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}