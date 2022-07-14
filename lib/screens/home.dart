import 'package:assign1/widgets/search_bar.dart';

import '../widgets/username_card.dart';
import 'package:flutter/material.dart';
import '../model/user_model.dart';
import '../services/api_userdata.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<UserModel>? userModel = [];
  List<UserModel>? filtereduserModel = [];

  String query = " ";

  @override
  void initState() {
    super.initState();
    _getUserData();
  }

  void _getUserData() async {
    userModel = (await ApiUserData().getUsers())!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        body: userModel == null || userModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(children: <Widget>[
                Container(
                  height: size.height * .3,
                  decoration: BoxDecoration(
                    color: Color(0xFFF5CEB8),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: Container(
                              alignment: Alignment.center,
                              height: 35,
                              width: 35,
                              decoration: BoxDecoration(
                                  color: Color(0xFFF2BEA1),
                                  shape: BoxShape.circle),
                              child: SvgPicture.asset(
                                "assets/icons/users.svg",
                                color: Colors.black,
                              ),
                            )),
                        Text("Welcome!",
                            style: Theme.of(context).textTheme.displayMedium),
                        buildSearch(),
                        query != " " && filtereduserModel!.isEmpty
                            ? Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.search_off,
                                      size: size.width * 0.15,
                                    ),
                                    Text("No results found !",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displaySmall),
                                  ],
                                ),
                              )
                            : Expanded(
                                child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 0.85,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                ),
                                itemCount: query == " "
                                    ? userModel!.length
                                    : filtereduserModel!.length,
                                itemBuilder: (context, index) {
                                  return UserCard(
                                      Username: query == " "
                                          ? userModel!
                                          : filtereduserModel!,
                                      index: index);
                                },
                              ))
                      ],
                    ),
                  ),
                )
              ]));
  }

  Widget buildSearch() => SearchWidget(text: query, onChanged: searchUser);

  void searchUser(String query) {
    final filtereduserModel = userModel!.where((Element) {
      final titleLower = Element.username.toLowerCase();

      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();
    setState(() {
      this.query = query;
      this.filtereduserModel = filtereduserModel;
    });
  }
}
