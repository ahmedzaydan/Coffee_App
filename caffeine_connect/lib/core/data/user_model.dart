class UserModel {
  String? uid;
  String? username;
  String? mobileNumber;
  String? email;
  double? balance;

  UserModel({
    required this.uid,
    required this.username,
    required this.mobileNumber,
    required this.email,
    this.balance = 0.0,
  });
  

  UserModel.fromJson({
    required Map<String, dynamic> json,
  }) {
    uid = json['uid'];
    username = json['username'];
    mobileNumber = json['mobileNumber'];
    email = json['email'];
    balance = json['balance'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'username': username,
      'mobileNumber': mobileNumber,
      'email': email,
      'balance': balance,
    };
  }
}
