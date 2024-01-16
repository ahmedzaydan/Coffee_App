class UserModel {
  String? uid;
  String? username;
  String? mobileNumber;
  String? email;
  String? password;
  double? balance;

  UserModel({
    required this.uid,
    required this.username,
    required this.mobileNumber,
    required this.email,
    required this.password,
    this.balance = 0.0,
  });
  

  UserModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    uid = json['uid'];
    username = json['username'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    password = json['password'];
    balance = json['balance'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'mobileNumber': mobileNumber,
      'email': email,
      'password': password,
      'balance': balance,
    };
  }
}
