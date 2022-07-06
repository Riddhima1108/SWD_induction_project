import 'package:assign1/model/comments_model.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../services/api_commentdata.dart';
import 'package:assign1/model/posts_model.dart';

import '../widgets/comments_card.dart';
import '../widgets/posts_card.dart';

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

    setState(() {
      {
        _commentsModel?.forEach((element) {
          if (element.postId == widget.userposts[widget.index].id) {
            _postcomments!.add(element);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade100,
        elevation: 0,
      ),
      body: _postcomments == null || _postcomments!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                children: [
                  PostCardTitle(Posts: widget.userposts, index: widget.index),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                    ),
                    child: const Text(
                      "Comments",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: ListView.builder(
                        itemCount: _postcomments!.length,
                        itemBuilder: (context, index) {
                          return CommentCard(
                              Comments: _postcomments!, index: index);
                        },
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Add Comment...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
