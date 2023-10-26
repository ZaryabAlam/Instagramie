import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagramie/utils/ui_utils.dart';
import '../widgets/appbar.dart';
import '../widgets/bouncing_Button.dart';
import '../widgets/follow_button.dart';

class AddImagePage extends StatefulWidget {
  @override
  _AddImagePageState createState() => _AddImagePageState();
}

class _AddImagePageState extends State<AddImagePage> {
  final String userProfileImage = 'assets/images/user1.jpg';
  final String postPreviewImage = 'assets/images/post5.jpg';

  String caption = "";
  bool isLocationEnabled = true;
  bool isLikesEnabled = true;
  bool isCommentsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MyAppbar(myText: 'Add post')),
      // appBar: AppBar(
      //   title: Text("New Post"),
      //   actions: [
      //     TextButton(
      //       onPressed: () {
      //         // TODO: Implement post submission logic here
      //         print("Caption: $caption");
      //         print("Comments Enabled: $isCommentsEnabled");
      //         print("Likes Enabled: $isLikesEnabled");
      //       },
      //       child: Text(
      //         "Share",
      //         style: TextStyle(
      //           color: Colors.black,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      body: ListView(
        children: [
          Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(userProfileImage),
                ),
                title: TextField(
                  onChanged: (value) {
                    setState(() {
                      caption = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Write a caption...",
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                ),
              ),
              AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  postPreviewImage,
                  fit: BoxFit.cover,
                ),
              ),
              FollowButton(
                text: 'Share',
                backgroundColor: Colors.grey.shade200,
                textColor: Colors.black,
                borderColor: Colors.grey,
                function: () async {
                  showSnackbar(context, 'Share new post');
                },
              ),
              ListTile(
                leading: Icon(Icons.location_on_rounded),
                title: Text("Tag Location"),
                trailing: Switch(
                  value: isLocationEnabled,
                  onChanged: (value) {
                    setState(() {
                      isLocationEnabled = value;
                    });
                  },
                ),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.solidComment),
                title: Text("Enable Comments"),
                trailing: Switch(
                  value: isCommentsEnabled,
                  onChanged: (value) {
                    setState(() {
                      isCommentsEnabled = value;
                    });
                  },
                ),
              ),
              ListTile(
                leading: FaIcon(FontAwesomeIcons.solidThumbsUp),
                title: Text("Enable Likes"),
                trailing: Switch(
                  value: isLikesEnabled,
                  onChanged: (value) {
                    setState(() {
                      isLikesEnabled = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class AddImagePage extends StatefulWidget {
//   const AddImagePage({super.key});

//   @override
//   State<AddImagePage> createState() => _AddImagePageState();
// }

// class _AddImagePageState extends State<AddImagePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//            appBar: PreferredSize(
//     preferredSize: Size.fromHeight(60),child: MyAppbar(myText: 'Add post')),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 50),
//               Text("Add Post"),
//               Container(
//                   alignment: Alignment.center,
//                   height: 200,
//                   width: 200,
//                   // color: Colors.red.shade200,
//                   child: Stack(
//                     children: [
//                       FaIcon(FontAwesomeIcons.solidImages, size: 130),
//                       Positioned(
//                           bottom: 2,
//                           right: 2,
//                           child: FaIcon(FontAwesomeIcons.circlePlus,
//                               size: 50, color: Colors.blueGrey)),
//                     ],
//                   )),
//               TextFormField(
//                 cursorColor: Colors.black,
//                 cursorWidth: 8,
//                 // controller: usernameController,
//                 textInputAction: TextInputAction.done,
//                 keyboardType: TextInputType.name,
//                 decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 15.0, horizontal: 30.0),
//                     hintText: "Post Title",
//                     hintStyle: TextStyle(color: Colors.black38),
//                     filled: true,
//                     fillColor: Colors.grey.shade200,
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50)
//                             .copyWith(topLeft: Radius.circular(0)),
//                         borderSide: BorderSide(color: Colors.grey)),
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(80))),
//               ),
//               SizedBox(height: 20),
//               TextFormField(
//                 cursorColor: Colors.black,
//                 cursorWidth: 8,
//                 // controller: usernameController,
//                 textInputAction: TextInputAction.done,
//                 keyboardType: TextInputType.name,

//                 decoration: InputDecoration(
//                     contentPadding: const EdgeInsets.symmetric(
//                         vertical: 15.0, horizontal: 30.0),
//                     hintText: "Post Description",
//                     hintStyle: TextStyle(color: Colors.black38),
//                     filled: true,
//                     fillColor: Colors.grey.shade200,
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(50)
//                             .copyWith(topLeft: Radius.circular(0)),
//                         borderSide: BorderSide(color: Colors.grey)),
//                     border: OutlineInputBorder(
//                         borderSide: BorderSide.none,
//                         borderRadius: BorderRadius.circular(80))),
//               ),
//               SizedBox(height: 20),
//               Container(
//                   height: 55,
//                    decoration: BoxDecoration(
//               color: Colors.transparent,
//               borderRadius: BorderRadius.circular(80),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.black.withOpacity(0.2),
//                   offset: Offset(0, 4),
//                   blurRadius: 6,
//                 ),
//               ],
//             ),
//                   child: TextButton(
//                     onPressed: () {},
//                     style: TextButton.styleFrom(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(80)),
//                         primary: Colors.black,
//                         backgroundColor: Colors.grey.shade200,
//                         minimumSize: Size.fromHeight(70)),
//                     child: Text("CONTINUE"),
//                   )),
                 
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
