import 'package:flutter/material.dart';
import 'package:instagramie/models/models.dart';
import 'package:instagramie/utils/ui_utils.dart';
import 'package:instagramie/widgets/avatar_widget.dart';
import 'package:instagramie/widgets/post_widget.dart';

class HomeFeedPage extends StatefulWidget {
  final ScrollController scrollController;

  HomeFeedPage({required this.scrollController});

  @override
  _HomeFeedPageState createState() => _HomeFeedPageState();
}

class _HomeFeedPageState extends State<HomeFeedPage> {
  final _posts = <Post>[
    Post(
      user: grootlover,
      imageUrls: [
        'assets/images/post1.jpg',
        'assets/images/post2.jpg',
        'assets/images/post3.jpg',
      ],
      likes: [
        Like(user: rocket),
        Like(user: starlord),
        Like(user: gamora),
        Like(user: nickwu241),
      ],
      comments: [
        Comment(
          text: 'So we’re saving the galaxy again?',
          user: rocket,
          commentedAt: DateTime(2019, 5, 23, 14, 35, 0),
          likes: [Like(user: nickwu241)],
        ),
      ],
      location: 'Earth',
      postedAt: DateTime(2019, 5, 23, 12, 35, 0),
    ),
    Post(
      user: nickwu241,
      imageUrls: ['assets/images/post4.jpg'],
      likes: [],
      comments: [],
      location: 'Knowhere',
      postedAt: DateTime(2019, 5, 21, 6, 0, 0),
    ),
    Post(
      user: nebula,
      imageUrls: ['assets/images/post5.jpg'],
      likes: [Like(user: nickwu241)],
      comments: [],
      location: 'Nine Realms',
      postedAt: DateTime(2019, 5, 2, 0, 0, 0),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, i) {
        if (i == 0) {
          return StoriesBarWidget();
        }
        return PostWidget(_posts[i - 1]);
      },
      itemCount: _posts.length + 1,
      controller: widget.scrollController,
    );
  }
}

class StoriesBarWidget extends StatelessWidget {
  final _users = <User>[
    currentUser,
    grootlover,
    rocket,
    nebula,
    starlord,
    gamora,
  ];

  void _onUserStoryTap(BuildContext context, int i) {
    final message =
        i == 0 ? 'Add to Your Story' : "View ${_users[i].name}'s Story";
    showSnackbar(context, message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 106.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (ctx, i) {
          return AvatarWidget(
            user: _users[i],
            onTap: () => _onUserStoryTap(context, i),
            isLarge: true,
            isShowingUsernameLabel: true,
            isCurrentUserStory: i == 0,
          );
        },
        itemCount: _users.length,
      ),
    );
  }
}
