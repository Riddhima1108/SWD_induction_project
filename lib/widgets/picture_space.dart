import 'package:flutter/material.dart';
import '../constant.dart';

class picture extends StatelessWidget {
  const picture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 130,
      child: Stack(fit: StackFit.expand, children: [
        CircleAvatar(
          backgroundColor: kBlueColor,
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
                child: (const Icon(
              Icons.camera_alt_rounded,
              size: 28,
              color: Colors.blueGrey,
            ))),
          ),
        )
      ]),
    );
  }
}
