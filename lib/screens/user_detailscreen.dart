import 'package:flutter/material.dart';
import '../model/user_model.dart';
import './post_screen.dart';
import './albums_screen.dart';

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
      return UserPostScreen(id:widget.userdetails[widget.index].id);
    }));
    
  }
  
  

  void onpressAlbum(BuildContext ctx) {
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_) {
      return UserAlbumScreen(id:widget.userdetails[widget.index].id);
    }));
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: Text(
            widget.userdetails[widget.index].username,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.grey[800],
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          child: Card(
              elevation: 10.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  (const Icon(
                    Icons.account_box,
                    size: 175,
                  )),
                  Text(
                    widget.userdetails[widget.index].name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                  Row(
                    children: [
                      const Text(
                        'Email : ',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        widget.userdetails[widget.index].email,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 19),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Address : ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.userdetails[widget.index].address.street,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.userdetails[widget.index].address.suite,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            widget.userdetails[widget.index].address.city,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            widget.userdetails[widget.index].address.zipcode,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text(
                                'Lat : ',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                widget.userdetails[widget.index].address.geo.lat,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              const Text(
                                ' Lng : ',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                widget.userdetails[widget.index].address.geo.lng,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Phone : ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.userdetails[widget.index].phone,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Website: ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.userdetails[widget.index].website,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Company: ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        widget.userdetails[widget.index].company.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Company\'s Catch Phrase : ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.userdetails[widget.index].company.catchPhrase,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Text(
                        'Company\'s Business : ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        widget.userdetails[widget.index].company.bs,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                          onPressed: () => onpressPost(context),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.deepPurple),
                          child: Text(
                            'POSTS',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          )),
                      ElevatedButton(
                          onPressed: () => onpressAlbum(context),
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.deepPurple),
                          child: Text(
                            'ALBUMS',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17,
                            ),
                          )),
                    ],
                  )
                ],
              )),
        ));
  }
}
