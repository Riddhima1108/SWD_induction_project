import 'package:flutter/material.dart';
import '../model/albums_model.dart';
import '../services/api_albumdata.dart';

class UserAlbumScreen extends StatefulWidget {
  final int id;
  const UserAlbumScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<UserAlbumScreen> createState() => _UserAlbumScreenState();
}

class _UserAlbumScreenState extends State<UserAlbumScreen> {
  
  List<AlbumModel>? _albumModel = [];
   List<AlbumModel>? _useralbums= [];

  @override
  void initState() {
    super.initState();
    _getAlbumData();
  }

  void _getAlbumData() async {
    _albumModel = (await ApiAlbumData().getAlbums())!;
    
    setState(() {_albumModel?.forEach((element) {
      if (element.userId == widget.id) {
        _useralbums!.add(element);
      }
    });});
  }@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ALBUMS',style:TextStyle(fontWeight: FontWeight.bold, )),backgroundColor:Colors.grey[900], 
      
         ),
      body: _useralbums == null || _useralbums!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _useralbums!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      
                      Text(_useralbums![index].title),
                      
                    ],
                  )
                , 
                );
              },
            ),
    );
  }
}
