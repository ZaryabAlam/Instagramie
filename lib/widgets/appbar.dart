import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/ui_utils.dart';

class MyAppbar extends StatelessWidget {
  late String myText;

  MyAppbar({
    required this.myText,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1.0,
      backgroundColor: Colors.grey[50],
      title: Row(
        children: <Widget>[
          Builder(builder: (BuildContext context) {
            return GestureDetector(
              // child: Icon(Icons.camera_alt_rounded, color: Colors.black, size: 32.0),
              child: FaIcon(FontAwesomeIcons.cameraRetro),
              onTap: () => showSnackbar(context, 'Add Photo'),
            );
          }),
          SizedBox(width: 12.0),
          GestureDetector(
            child: Text(
              myText,
              style: TextStyle(
                  fontFamily: 'Billabong', color: Colors.black, fontSize: 32.0),
            ),
          ),
        ],
      ),
      actions: <Widget>[
        // Builder(builder: (BuildContext context) {
        //   return IconButton(
        //     color: Colors.black,
        //     icon: Icon(Icons.live_tv_rounded),
        //     onPressed: () => showSnackbar(context, 'Live TV'),
        //   );
        // }),
        Builder(builder: (BuildContext context) {
          return IconButton(
            color: Colors.black,
            // icon: Icon(Icons.near_me),
            icon: FaIcon(FontAwesomeIcons.solidPaperPlane),
            onPressed: () => showSnackbar(context, 'My Messages'),
          );
        }),
      ],
    );
  }
}
