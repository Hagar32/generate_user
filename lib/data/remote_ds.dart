import 'dart:convert';

import 'package:generate_user/data/models/generate_user_model.dart';
import 'package:http/http.dart';
abstract class UserDataSource {
  Future<UserModel> getRandomUser();
}

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<UserModel> getRandomUser() async {
    Response response = await get(Uri.parse('https://randomuser.me/api/'));

    if (response.statusCode == 200) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load random user');
    }
  }
}