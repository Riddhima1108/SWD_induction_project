import 'package:assign1/model/comments_model.dart';
import 'package:flutter/material.dart';
import '../services/api_commentdata.dart';
import 'package:assign1/model/posts_model.dart';

class PostCommentScreen extends StatefulWidget {
  final List<PostModel> userposts;
  final int index;
  PostCommentScreen({Key? key, required this.userposts, required this.index})
      : super(key: key);

  @override
  State<PostCommentScreen> createState() => _PostCommentScreenState();
}

class _PostCommentScreenState extends State<PostCommentScreen> {
  List<CommentModel>? _commentsModel = [];
  List<CommentModel>? _postcomments = [];

  @override
  void initState() {
    super.initState();
    _getCommentsData();
  }

  void _getCommentsData() async {
    _commentsModel = (await ApiCommentData().getComments());

    setState(() {{_commentsModel?.forEach((element) {
      if (element.postId== widget.userposts[widget.index].id) {
        _postcomments!.add(element);
      }
    });}
      
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('COMMENTS')),
      body: _postcomments == null || _postcomments!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _postcomments!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Text(_postcomments![index].postId.toString()),
                      Text(_postcomments![index].body),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
