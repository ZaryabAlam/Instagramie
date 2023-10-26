import 'package:flutter/material.dart';
import 'package:instagramie/widgets/follow_button.dart';

import '../utils/ui_utils.dart';
import '../widgets/appbar.dart';

class AboutPage extends StatefulWidget {
  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final String username = "John Smith";

  final String userBio = "Photographer. Explorer. Food Lover.";

  final String userImage = 'assets/images/user1.jpg';

  final List<String> posts = [
    'assets/images/post1.jpg',
    'assets/images/post2.jpg',
    'assets/images/post3.jpg',
    'assets/images/post4.jpg',
    'assets/images/post5.jpg',
    'assets/images/post1.jpg',
    'assets/images/post2.jpg',
  ];
  static const _gradientBorderDecoration = BoxDecoration(
    shape: BoxShape.circle,
    // https://brandpalettes.com/instagram-color-codes/
    gradient: SweepGradient(
      colors: [
        Color(0xFF833AB4), // Purple
        Color(0xFFF77737), // Orange
        Color(0xFFE1306C), // Red-pink
        Color(0xFFC13584), // Red-purple
      ],
    ),
  );
  static const _whiteBorderDecoration = BoxDecoration(
    shape: BoxShape.circle,
    border: Border.fromBorderSide(BorderSide(color: Colors.white, width: 3.0)),
  );
  static const _greyBoxShadowDecoration = BoxDecoration(
    shape: BoxShape.circle,
    boxShadow: [
      BoxShadow(color: Colors.grey, blurRadius: 1.0, spreadRadius: 1.0)
    ],
  );
  @override
  Widget build(BuildContext context) {
    final radius = 54.0;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60), child: MyAppbar(myText: 'About')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            // CircleAvatar(
            //   radius: 50,
            //   backgroundImage: NetworkImage(userImage),
            // ),
            Container(
              height: radius * 2 + 9.0,
              width: radius * 2 + 9.0,
              decoration: _gradientBorderDecoration,
              child: Stack(alignment: Alignment.center, children: <Widget>[
                Container(
                  decoration: _whiteBorderDecoration,
                  child: Container(
                    decoration: _greyBoxShadowDecoration,
                    child: CircleAvatar(
                      radius: radius,
                      backgroundImage: AssetImage(userImage),
                    ),
                  ),
                ),
              ]),
            ),
            SizedBox(height: 10),
            Text(
              username,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Text(
              userBio,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildStatColumn(6, "posts"),
                buildStatColumn(10, "followers"),
                buildStatColumn(200, "following"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FollowButton(
                  text: 'Edit Profile',
                  backgroundColor: Colors.grey.shade200,
                  textColor: Colors.black,
                  borderColor: Colors.grey,
                  function: () async {
                    showSnackbar(context, 'Sign Out');
                  },
                )
              ],
            ),
            SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Image.asset(
                    posts[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

Column buildStatColumn(int num, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        num.toString(),
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 4),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
      ),
    ],
  );
}
