import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagramie/widgets/appbar.dart';

import '../utils/ui_utils.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final List<Map<String, dynamic>> posts = [
    {
      'username': 'John Smith',
      'userImagePath': 'assets/images/user1.jpg',
      'description': 'Chilling out in the space with my spacesuit ',
      'postImage': 'assets/images/post1.jpg',
      'liked': true,
    },
    {
      'username': 'Eurasian Hoopoe',
      'userImagePath': 'assets/images/user2.jpg',
      'description': 'This is wow!',
      'postImage': 'assets/images/post2.jpg',
      'liked': true,
    },
    {
      'username': 'Thomas Johnson',
      'userImagePath': 'assets/images/user3.jpg',
      'description': 'Checkout my new home decoration',
      'postImage': 'assets/images/post3.jpg',
      'liked': true,
    },
    {
      'username': 'Brahmin Starling',
      'userImagePath': 'assets/images/user4.jpg',
      'description': 'Just started learning astronomy',
      'postImage': 'assets/images/post4.jpg',
      'liked': true,
    },
    {
      'username': 'David Brown',
      'userImagePath': 'assets/images/user5.jpg',
      'description': 'How is this wallpaper I just created?',
      'postImage': 'assets/images/post5.jpg',
      'liked': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: MyAppbar(myText: 'Favorite')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Column(
            children: [
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0.5),
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(post['userImagePath']!),
                      ),
                      title: Text(
                        post['username']!,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: () => showSnackbar(context, 'More'),
                      ),
                    ),
                    Container(
                      height: 230,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                              image: AssetImage(post['postImage']!),
                              fit: BoxFit.cover)),
                      // child: Image.network(post['postImage']!, fit: BoxFit.cover,)
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            flex: 1,
                            child: Text(
                              post['description']!,
                              overflow: TextOverflow.ellipsis,
                            )),
                        Row(
                          children: [
                            IconButton(
                              padding: EdgeInsets.zero,
                              iconSize: 28.0,
                              icon: Icon(
                                post['liked']
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: post['liked'] ? Colors.red : null,
                              ),
                              onPressed: () {
                                setState(() {
                                  post['liked'] = !post['liked'];
                                });
                              },
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              iconSize: 28.0,
                              icon: FaIcon(FontAwesomeIcons.commentDots,
                                  size: 25),
                              onPressed: () =>
                                  showSnackbar(context, 'Comments'),
                            ),
                            IconButton(
                              padding: EdgeInsets.zero,
                              iconSize: 28.0,
                              icon: FaIcon(FontAwesomeIcons.solidPaperPlane,
                                  size: 23),
                              onPressed: () => showSnackbar(context, 'Share'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20)
            ],
          );
        },
      ),
    );
  }
}
