import '../widgets/username_card.dart';
import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../services/api_userdata.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<UserModel>? _userModel = [];

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    _userModel = (await ApiUserData().getUsers())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        leading: const Icon(Icons.account_circle_rounded,
            size: 40, color: Colors.white),
        title: (const Text(
          'USERS',
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return UserCard(Username: _userModel!, index: index);
              },
            ),
    );
  }
}
