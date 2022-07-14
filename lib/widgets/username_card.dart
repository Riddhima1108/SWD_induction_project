import 'package:flutter_svg/flutter_svg.dart';

import '../model/user_model.dart';
import '../screens/user_detailscreen.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class UserCard extends StatefulWidget {
  final List<UserModel> Username;
  final int index;
  const UserCard({Key? key, required this.Username, required this.index})
      : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  void selectUser(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return UserDetailScreen(
          userdetails: widget.Username, index: widget.index);
    }));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(13),
      child: Container(
        // padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 17),
              blurRadius: 17,
              spreadRadius: -23,
              color: kShadowColor,
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => selectUser(context),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: size.height * .15,
                    width: size.width * .25,
                    child: SvgPicture.asset('assets/icons/user_img.svg'),
                  ),
                  Spacer(),
                  Text(
                    widget.Username[widget.index].username,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
