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
     var size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            ): Stack(children: <Widget>[
          Container(
            
            height: size.height * .3,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              
            ),),
            SafeArea(
              child: Padding( padding:EdgeInsets.symmetric(horizontal: 20) ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Align(
                    alignment: Alignment.topRight,
                  
                    child: Container(
                      alignment:Alignment.center ,
                                 
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(color: Color(0xFFF2BEA1),shape: BoxShape.circle),
                      child:SvgPicture.asset("assets/icons/users.svg",
                      color: Colors.black,),
                      
                              
                    )
                  ),Text("Welcome!",
                         style: Theme.of(context)
                        .textTheme.displayMedium),
                        Container(
                          margin:EdgeInsets.symmetric(vertical: 20) ,
                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                          decoration: BoxDecoration(
                            color: Colors.white,
                           borderRadius: BorderRadius.circular(29.5),
                          ),
                          child:TextField(decoration: InputDecoration(
          hintText: "Search",
          icon: SvgPicture.asset("assets/icons/search.svg"),
          border: InputBorder.none,
        ),),
                        ),
                      Expanded(child: 

                       GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,childAspectRatio: 0.85,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
      ),
      itemCount: _userModel!.length,
       itemBuilder: (context, index) {
                return UserCard(Username: _userModel!, index: index);
              },
))
                        
                        
                        
                        ],
                 
                ),
              ),
            )
            


        
      
      ])
    );
  }
}
