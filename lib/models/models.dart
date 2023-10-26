import 'package:meta/meta.dart';
import 'package:timeago/timeago.dart' as timeago;

const placeholderStories = <Story>[Story()];

const nickwu241 =
    User(name: 'John Smith', imageUrl: 'assets/images/user1.jpg',);
const grootlover = User(
    name: 'Eurasian Hoopoe',
    imageUrl: 'assets/images/user2.jpg',
    stories: placeholderStories);
const starlord = User(
    name: 'Thomas Johnson',
    imageUrl: 'assets/images/user3.jpg',
    stories: placeholderStories);
const gamora = User(
    name: 'Brahmin Starling',
    imageUrl: 'assets/images/user4.jpg',
    stories: placeholderStories);
const rocket = User(
    name: 'David Brown',
    imageUrl: 'assets/images/user5.jpg',
    stories: placeholderStories);
const nebula = User(
    name: 'Aiden Joseph',
    imageUrl: 'assets/images/user6.jpg',
    stories: placeholderStories);

const currentUser = nickwu241;

class Post {
  List<String> imageUrls;
  final User user;
  final DateTime postedAt;

  List<Like> likes;
  List<Comment> comments;
  String location;

  String timeAgo() {
    final now = DateTime.now();
    return timeago.format(now.subtract(now.difference(postedAt)));
  }

  bool isLikedBy(User user) {
    return likes.any((like) => like.user.name == user.name);
  }

  void addLikeIfUnlikedFor(User user) {
    if (!isLikedBy(user)) {
      likes.add(Like(user: user));
    }
  }

  void toggleLikeFor(User user) {
    if (isLikedBy(user)) {
      likes.removeWhere((like) => like.user.name == user.name);
    } else {
      addLikeIfUnlikedFor(user);
    }
  }

  Post({
    required this.imageUrls,
    required this.user,
    required this.postedAt,
    required this.likes,
    required this.comments,
    required this.location,
  });
}

class User {
  final String name;

  final String imageUrl;
  final List<Story> stories;

  const User({
    required this.name,
    required this.imageUrl,
    this.stories = const <Story>[],
  });
}

class Comment {
  String text;
  final User user;
  final DateTime commentedAt;
  List<Like> likes;

  bool isLikedBy(User user) {
    return likes.any((like) => like.user.name == user.name);
  }

  void toggleLikeFor(User user) {
    if (isLikedBy(user)) {
      likes.removeWhere((like) => like.user.name == user.name);
    } else {
      likes.add(Like(user: user));
    }
  }

  Comment({
    required this.text,
    required this.user,
    required this.commentedAt,
    required this.likes,
  });
}

class Like {
  final User user;

  Like({required this.user});
}

class Story {
  const Story();
}
