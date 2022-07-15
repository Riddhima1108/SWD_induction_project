import 'package:flutter/material.dart';
import 'package:assign1/model/comments_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


import '../constant.dart';

class CommentCard extends StatefulWidget {
  final List<CommentModel> Comments;
  final int index;

  const CommentCard({Key? key, required this.Comments, required this.index})
      : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  bool liked = false;
  bool showReply = false;


  _pressed() {
    setState(() {
      liked = !liked;
    });
  }

  _reply() {
    setState(() {
      showReply = !showReply;
    });
  }

 

  Widget build_replyitem(String Reply) {
    return ListTile(
      title: Text(Reply),
    );
  }

  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade300,
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 17),
                blurRadius: 23,
                spreadRadius: -13,
                color: kShadowColor,
              ),
            ],
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.account_circle,
                  size: 35.0,
                  color: Colors.cyan,
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Expanded(
                            child: Container(
                                child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: widget.Comments[widget.index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.0,
                                      color: Colors.black),
                                ),
                                TextSpan(
                                    text: "@ " +
                                        widget.Comments[widget.index].email,
                                    style: TextStyle(
                                        fontSize: 14.0, color: Colors.grey)),
                              ]),
                              overflow: TextOverflow.ellipsis,
                            )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        widget.Comments[widget.index].body,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          IconButton(
                              iconSize: 30.0,
                              onPressed: _pressed,
                              icon: Icon(
                                liked ? Icons.favorite : Icons.favorite_border,
                                color: liked ? Colors.red : Colors.grey,
                              )),
                          IconButton(
                            onPressed: _reply,
                            icon: Icon(
                              FontAwesomeIcons.comment,
                              color: showReply ? Colors.black : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    showReply
                        ? Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextField(
                              controller: _textController,
                              decoration: InputDecoration(
                                hintText: "Reply...",
                                border: InputBorder.none,
                                suffixIcon: IconButton(
                                  onPressed: (() {
                                    _textController.clear();
                                  }),
                                  icon: const Icon(FontAwesomeIcons.reply,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
