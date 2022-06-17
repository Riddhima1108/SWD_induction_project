import 'dart:developer';

import 'package:http/http.dart' as http;

import 'package:assign1/model/posts_model.dart';

class ApiPostData {
  Future<List<PostModel>?> getPosts() async {
    
      var url = Uri.parse('http://jsonplaceholder.typicode.com/posts');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<PostModel> _model = PostModelFromJson(response.body);
        return _model;
      }
    
  }
}