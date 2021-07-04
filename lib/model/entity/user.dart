class UserModel {
  String id;
  String name;
  String email;
  String city;
  String address;
  String houseNumber;
  String phoneNumber;
  String password;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.password,
    this.address,
    this.houseNumber,
    this.phoneNumber,
    this.city,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    address = json['address'];
    houseNumber = json['houseNumber'];
    phoneNumber = json['phoneNumber'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['password_confirmation'] = this.password;
    data['address'] = this.address;
    data['houseNumber'] = this.houseNumber;
    data['phoneNumber'] = this.phoneNumber;
    data['city'] = this.city;
    return data;
  }

  Map<String, dynamic> toJsonRegister() {
    Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
