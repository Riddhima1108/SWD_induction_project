import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../model/albums_model.dart';
import '../services/api_albumdata.dart';
import '../widgets/albums_card.dart';
import '../widgets/search_bar.dart';

class UserAlbumScreen extends StatefulWidget {
  final int id;
  const UserAlbumScreen({Key? key, required this.id}) : super(key: key);

  @override
  State<UserAlbumScreen> createState() => _UserAlbumScreenState();
}

class _UserAlbumScreenState extends State<UserAlbumScreen> {
  List<AlbumModel>? _albumModel = [];
  List<AlbumModel>? _useralbums = [];
  List<AlbumModel>? filtereduseralbums = [];

  String query = " ";

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
                    buildSearch(),
                    query != " " && filtereduseralbums!.isEmpty
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
                            child: Container(
                              child: ListView.separated(
                                padding: EdgeInsets.all(16),
                                itemCount: query == " "
                                    ? _useralbums!.length
                                    : filtereduseralbums!.length,
                                itemBuilder: (context, index) {
                                  return AlbumCard(
                                      Albums: query == " "
                                          ? _useralbums!
                                          : filtereduseralbums!,
                                      index: index);
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

  Widget buildSearch() => SearchWidget(text: query, onChanged: searchUser);

  void searchUser(String query) {
    final Albums = _useralbums!.where((Element) {
      final titleLower = Element.title.toLowerCase();

      final searchLower = query.toLowerCase();

      return titleLower.contains(searchLower);
    }).toList();
    setState(() {
      this.query = query;
      this.filtereduseralbums = Albums;
    });
  }
}
