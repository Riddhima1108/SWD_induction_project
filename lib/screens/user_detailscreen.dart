import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../model/user_model.dart';
import './post_screen.dart';
import './albums_screen.dart';

import '../constant.dart';
import '../widgets/picture_space.dart';

class UserDetailScreen extends StatefulWidget {
  final List<UserModel> userdetails;
  final int index;

  UserDetailScreen({Key? key, required this.userdetails, required this.index})
      : super(key: key);

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  void onpressPost(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return UserPostScreen(id: widget.userdetails[widget.index].id);
    }));
  }

  void onpressAlbum(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return UserAlbumScreen(id: widget.userdetails[widget.index].id);
    }));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kBlueLightColor,
          elevation: 0,
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height * .1,
              decoration: BoxDecoration(
                color: kBlueLightColor,
              ),
            ),
            SafeArea(
              child: Column(
                children: [
                  SizedBox(height: 5),
                  picture(),
                  SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                    text: widget.userdetails[widget.index].name + " @ " +widget.userdetails[widget.index].username,
                    style: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                  ),),
                  SizedBox(height: 5),
                  Text(
                    widget.userdetails[widget.index].email,
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                  color: Colors.deepPurple.shade200)),
                          backgroundColor: Color(0xFFF5F6F9),
                        ),
                        onPressed: () => onpressPost(context),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/posts.svg",
                              color: kBlueColor,
                              width: 22,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text("Posts",
                                  style: TextStyle(color: kTextColor)),
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                color: Colors.deepPurple),
                          ],
                        ),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                  color: Colors.deepPurple.shade200)),
                          backgroundColor: Color(0xFFF5F6F9),
                        ),
                        onPressed: () => onpressAlbum(context),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/albums.svg",
                              color: kBlueColor,
                              width: 22,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text("Albums",
                                  style: TextStyle(
                                    color: kTextColor,
                                  )),
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                color: Colors.deepPurple),
                          ],
                        ),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                  color: Colors.deepPurple.shade200)),
                          backgroundColor: Color(0xFFF5F6F9),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          width: 2,
                                          color: Colors.deepPurple.shade300)),
                                  child: Container(
                                    height: size.height * 0.3,
                                    child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ListTile(
                                            leading: Icon(Icons.phone_rounded),
                                            title: Text(
                                              "Phone No.",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              widget.userdetails[widget.index]
                                                  .phone,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            leading: Icon(Icons.public_rounded),
                                            title: Text(
                                              "Website",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            subtitle: Text(
                                              widget.userdetails[widget.index]
                                                  .website,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.15,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Back",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .deepPurple.shade600,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/contact-svgrepo-com.svg",
                              color: kBlueColor,
                              width: 22,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text("Contact",
                                  style: TextStyle(
                                    color: kTextColor,
                                  )),
                            ),
                            const Icon(Icons.arrow_forward_ios,
                                color: Colors.deepPurple),
                          ],
                        ),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                  color: Colors.deepPurple.shade200)),
                          backgroundColor: Color(0xFFF5F6F9),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          width: 2,
                                          color: Colors.deepPurple.shade300)),
                                  child: Container(
                                    height: size.height * 0.45,
                                    child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Scrollbar(
                                        thumbVisibility: true,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ListTile(
                                                title: Text(
                                                  "Suite",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  widget
                                                      .userdetails[widget.index]
                                                      .address
                                                      .suite,
                                                  style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  "Street",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  widget
                                                      .userdetails[widget.index]
                                                      .address
                                                      .street,
                                                  style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  "City",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  widget
                                                      .userdetails[widget.index]
                                                      .address
                                                      .city,
                                                  style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  "Zip Code ",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  widget
                                                      .userdetails[widget.index]
                                                      .address
                                                      .zipcode,
                                                  style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  "Latitude",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  widget
                                                      .userdetails[widget.index]
                                                      .address
                                                      .geo
                                                      .lat,
                                                  style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              ListTile(
                                                title: Text(
                                                  "Longitude",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                subtitle: Text(
                                                  widget
                                                      .userdetails[widget.index]
                                                      .address
                                                      .geo
                                                      .lng,
                                                  style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: size.width * 0.15,
                                                child: TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("Back",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .deepPurple
                                                              .shade600,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Row(
                          children: const [
                            Icon(
                              Icons.home,
                              color: kBlueColor,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text("Address",
                                  style: TextStyle(
                                    color: kTextColor,
                                  )),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Colors.deepPurple),
                          ],
                        ),
                      )),
                  Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          padding: EdgeInsets.all(20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side: BorderSide(
                                  color: Colors.deepPurple.shade200)),
                          backgroundColor: Color(0xFFF5F6F9),
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20.0),
                                      side: BorderSide(
                                          width: 2,
                                          color: Colors.deepPurple.shade300)),
                                  child: Container(
                                    height: size.height * 0.4,
                                    child: Padding(
                                      padding: EdgeInsets.all(12),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ListTile(
                                            title: Text(
                                              "Name",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            subtitle: Text(
                                              widget.userdetails[widget.index]
                                                  .company.name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              " Company Business ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            subtitle: Text(
                                              widget.userdetails[widget.index]
                                                  .company.bs,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          ListTile(
                                            title: Text(
                                              "Comapny's Catch Phrase",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            subtitle: Text(
                                              widget.userdetails[widget.index]
                                                  .company.catchPhrase,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.15,
                                            child: TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text("Back",
                                                  style: TextStyle(
                                                      color: Colors
                                                          .deepPurple.shade600,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              });
                        },
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/company.svg",
                              color: kBlueColor,
                              width: 22,
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: Text("About Company",
                                  style: TextStyle(
                                    color: kTextColor,
                                  )),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: Colors.deepPurple),
                          ],
                        ),
                      )),
                ],
              ),
            )
          ],
        ));
  }
}
