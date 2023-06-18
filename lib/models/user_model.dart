class UserModel {
  String? id;
  String? userName;
  String? email;
  String? mobilePhone;
  String? password;
  String? activeSub;
  String? imagePath;
  bool? isAdmin;

  UserModel({
    this.id,
    this.userName,
    this.email,
    this.mobilePhone,
    this.password,
    this.activeSub,
    this.imagePath,
    this.isAdmin,
  });

  Map<String, dynamic> toJson() => {
        'ID': id,
        'Username': userName,
        'Email': email,
        'Mobile Phone': mobilePhone,
        'Image Path': imagePath,
        'Password': password,
        'Active Subscription': activeSub,
        'IsAdmin': isAdmin,
      };

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    userName = json['Username'];
    email = json['Email'];
    mobilePhone = json['Mobile Phone'];
    imagePath = json['Image Path'];
    password = json['Password'];
    activeSub = json['Active Subscription'];
    isAdmin = json['IsAdmin'];
  }
}
