import 'package:assign1/screens/comments_screen.dart';
import 'package:assign1/widgets/posts_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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

    setState(() {
      _postModel?.forEach((element) {
        if (element.userId == widget.id) {
          _userposts!.add(element);
        }
      });
    });
  }

  void postComments(BuildContext ctx, int index) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return PostCommentScreen(userposts: _userposts!, index: index);
    }));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple.shade100,
          elevation: 0,
        ),
        body: _userposts == null || _userposts!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(children: [
                Container(
                  height: size.height * .29,
                  decoration: BoxDecoration(
                    color: Colors.purple.shade100,
                  ),
                ),
                SafeArea(
                    child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            height: size.height * .28,
                            width: size.width * .5,
                            child:
                                SvgPicture.asset('assets/icons/post_page.svg')),
                        SizedBox(
                          width: size.width * 0.5,
                          height: size.height * 0.3,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "Posts",
                                style: Theme.of(context).textTheme.displaySmall,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 3),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(29.5),
                                ),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    icon: SvgPicture.asset(
                                        "assets/icons/search.svg"),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.all(8),
                        itemCount: _userposts!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () => postComments(context, index),
                              child: PostCardTitle(
                                  Posts: _userposts!, index: index));
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                      ),
                    ),
                  ],
                ))
              ]));
  }
}
