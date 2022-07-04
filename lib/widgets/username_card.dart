

import '../model/user_model.dart';
import '../screens/user_detailscreen.dart';
import 'package:flutter/material.dart';
import '../constant.dart';

class UserCard extends StatelessWidget {
  final List<UserModel> Username;
  final int index;
  const UserCard({Key? key, required this.Username, required this.index})
      : super(key: key);

  void selectUser(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return UserDetailScreen(userdetails: Username, index: index);
    }));
  }

  @override
  Widget build(BuildContext context) {
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
               
                 
                 Spacer(),
                  
                     Text(
                       Username[index].username,
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme.bodyText1
                          
                          ,
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
