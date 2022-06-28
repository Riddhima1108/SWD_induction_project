import 'package:flutter/material.dart';
import '../model/posts_model.dart';
import '../services/api_postdata.dart';

class UserPostScreen extends StatefulWidget {
  final int id;

  UserPostScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<UserPostScreen> createState() => _UserPostScreenState();
}

class _UserPostScreenState extends State<UserPostScreen> {
  List<PostModel>? _postModel = [];
  List<PostModel>? _userposts = [];

  @override
  void initState() {
    super.initState();
    _getPostData();
  }

  void _getPostData() async {
    _postModel = (await ApiPostData().getPosts())!;
    
    setState(() {_postModel?.forEach((element) {
      if (element.userId == widget.id) {
        _userposts!.add(element);
      }
    });});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('POSTS')),
      body: _userposts == null || _userposts!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userposts!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      
                      Text(_userposts![index].title),
                      Text(_userposts![index].body),
                    ],
                  )
                , 
                );
              },
            ),
    );
  }
}
