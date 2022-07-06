import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../model/albums_model.dart';
import '../services/api_albumdata.dart';
import '../widgets/albums_card.dart';

class UserAlbumScreen extends StatefulWidget {
  final int id;
  const UserAlbumScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<UserAlbumScreen> createState() => _UserAlbumScreenState();
}

class _UserAlbumScreenState extends State<UserAlbumScreen> {
  List<AlbumModel>? _albumModel = [];
  List<AlbumModel>? _useralbums = [];

  @override
  void initState() {
    super.initState();
    _getAlbumData();
  }

  void _getAlbumData() async {
    _albumModel = (await ApiAlbumData().getAlbums())!;

    setState(() {
      _albumModel?.forEach((element) {
        if (element.userId == widget.id) {
          _useralbums!.add(element);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent.shade100,
        elevation: 0,
      ),
      body: _useralbums == null || _useralbums!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Stack(children: [
              Container(
                height: size.height * .3,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent.shade100,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(children: [
                    Text("Albums",
                        style: Theme.of(context).textTheme.displaySmall),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(29.5),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search",
                          icon: SvgPicture.asset("assets/icons/search.svg"),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: ListView.separated(
                          padding: EdgeInsets.all(16),
                          itemCount: _useralbums!.length,
                          itemBuilder: (context, index) {
                            return AlbumCard(
                                Albums: _useralbums!, index: index);
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 16),
                        ),
                      ),
                    )
                  ]),
                ),
              ),
            ]),
    );
  }
}
