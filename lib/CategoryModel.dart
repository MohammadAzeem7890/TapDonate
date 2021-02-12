class CategoryModel {
  int _status;
  List<NgoCategoryList> _ngoCategory;

  CategoryModel({int status, List<NgoCategoryList> ngoCategory}) {
    this._status = status;
    this._ngoCategory = ngoCategory;
  }

  int get status => _status;
  set status(int status) => _status = status;
  List<NgoCategoryList> get ngoCategory => _ngoCategory;
  set ngoCategory(List<NgoCategoryList> ngoCategory) => _ngoCategory = ngoCategory;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    _status = json['status'];
    if (json['ngo_category'] != null) {
      _ngoCategory = new List<NgoCategoryList>();
      json['ngo_category'].forEach((v) {
        _ngoCategory.add(new NgoCategoryList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this._status;
    if (this._ngoCategory != null) {
      data['ngo_category'] = this._ngoCategory.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NgoCategoryList {
  int _categoryId;
  String _ngoId;
  String _categoryName;
  String _createdAt;
  String _updatedAt;

  NgoCategoryList(
      {int categoryId,
        String ngoId,
        String categoryName,
        String createdAt,
        String updatedAt}) {
    this._categoryId = categoryId;
    this._ngoId = ngoId;
    this._categoryName = categoryName;
    this._createdAt = createdAt;
    this._updatedAt = updatedAt;
  }

  int get categoryId => _categoryId;
  set categoryId(int categoryId) => _categoryId = categoryId;
  String get ngoId => _ngoId;
  set ngoId(String ngoId) => _ngoId = ngoId;
  String get categoryName => _categoryName;
  set categoryName(String categoryName) => _categoryName = categoryName;
  String get createdAt => _createdAt;
  set createdAt(String createdAt) => _createdAt = createdAt;
  String get updatedAt => _updatedAt;
  set updatedAt(String updatedAt) => _updatedAt = updatedAt;

  NgoCategoryList.fromJson(Map<String, dynamic> json) {
    _categoryId = json['category_id'];
    _ngoId = json['ngo_id'];
    _categoryName = json['category_name'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category_id'] = this._categoryId;
    data['ngo_id'] = this._ngoId;
    data['category_name'] = this._categoryName;
    data['created_at'] = this._createdAt;
    data['updated_at'] = this._updatedAt;
    return data;
  }
}