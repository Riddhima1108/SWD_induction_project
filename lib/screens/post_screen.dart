import 'package:flutter/material.dart';
import 'package:assign1/model/posts_model.dart';
import 'package:assign1/services/api_postdata.dart';

class UserPostScreen extends StatefulWidget {
 
  const UserPostScreen({Key? key}) : super(key: key);

  @override
  State<UserPostScreen> createState() => _UserPostScreenState();
}

class _UserPostScreenState extends State<UserPostScreen> {
  

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('POSTS')),
      
    );
  }
}
