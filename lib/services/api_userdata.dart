

import 'package:http/http.dart' as http;

import '../model/user_model.dart';

class ApiUserData {
  Future<List<UserModel>?> getUsers() async {
    
      var url = Uri.parse('http://jsonplaceholder.typicode.com/users');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    
  }
}