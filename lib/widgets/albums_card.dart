import 'package:assign1/model/albums_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';

class AlbumCard extends StatelessWidget {
  final List<AlbumModel> Albums;
  final int index;
  const AlbumCard({Key? key, required this.Albums, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 23,
            spreadRadius: -13,
            color: Colors.orange,
          ),
        ],
      ),
      child: Stack(
        children: [
          Container(
            width: size.width * 0.2,
            height: size.height * 0.125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.orange.shade100,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Container(
                    height: size.height * 0.13,
                    width: size.width * 0.2,
                    color: Colors.blue,
                    child: Image.asset(
                      "assets/images/album_img3.jpg",
                      width: size.width * 0.25,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("Album Name ",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          )),
                      Text(Albums[index].title,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.blueGrey.shade800,
                            fontWeight: FontWeight.normal,
                            fontSize: 16,
                          )),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
