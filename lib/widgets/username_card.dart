import '../model/user_model.dart';
import '../screens/user_detailscreen.dart';
import 'package:flutter/material.dart';


class UserCard extends StatelessWidget {
  final List<UserModel> Username;
  final int index;
  const UserCard({Key? key, required this.Username, required this.index})
      : super(key: key);

  void selectUser(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return UserDetailScreen( userdetails: Username,index :index);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4),
      child: InkWell(
        onTap: () => selectUser(context),
        borderRadius: BorderRadius.circular(10.0),
        child: Card(
          elevation: 5.0,
          color: Colors.grey[800],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      Username[index].username,
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Text(
                      Username[index].name,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 15,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
