class UserModel {
  final Map<String, dynamic> data;

  UserModel(this.data);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final results = json['results'][0];
    return UserModel(results);
  }
}
