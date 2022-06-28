

import 'package:http/http.dart' as http;

import '../model/albums_model.dart';

class ApiAlbumData {
  Future<List<AlbumModel>?> getAlbums() async {
    
      var url = Uri.parse('http://jsonplaceholder.typicode.com/albums');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<AlbumModel> _model = albumModelFromJson(response.body);
        return _model;
      }
    
  }
}