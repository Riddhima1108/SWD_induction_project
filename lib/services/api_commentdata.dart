import 'package:assign1/model/comments_model.dart';
import 'package:http/http.dart' as http;

import '../model/comments_model.dart';

class ApiCommentData {
  Future<List<CommentModel>?> getComments() async {
    
      var url = Uri.parse('http://jsonplaceholder.typicode.com/comments');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<CommentModel> _model = commentModelFromJson(response.body);
        return _model;
      }
    
  }
}