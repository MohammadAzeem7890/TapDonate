class AddDonation {
  int ngoId;
  String userId;
  int categoryId;
  String description;
  String pickUpLocation;

  AddDonation(
      {int ngoId,
        String userId,
        int categoryId,
        String description,
        String pickUpLocation}) {
    this.ngoId = ngoId;
    this.userId = userId;
    this.categoryId = categoryId;
    this.description = description;
    this.pickUpLocation = pickUpLocation;
  }

  AddDonation.fromJson(Map<String, dynamic> json)
      : this.ngoId = json['ngo_id'],
        this.userId = json['user_id'],
        this.categoryId = json['category_id'],
        this.description = json['description'],
        this.pickUpLocation = json['pickup_location'];
}
