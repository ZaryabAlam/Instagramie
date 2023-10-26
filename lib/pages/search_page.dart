import 'package:flutter/material.dart';
import 'package:instagramie/utils/ui_utils.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String searchText = "";
  List<Map<String, String>> dummyUsers = [
    {'username': 'John Smith', 'profile_pic': 'assets/images/user1.jpg'},
    {'username': 'Eurasian Hoopoe', 'profile_pic': 'assets/images/user2.jpg'},
    {'username': 'Thomas Johnson', 'profile_pic': 'assets/images/user3.jpg'},
    {'username': 'Brahmin Starling', 'profile_pic': 'assets/images/user4.jpg'},
    {'username': 'David Brown', 'profile_pic': 'assets/images/user5.jpg'},
    {'username': 'Aiden Joseph', 'profile_pic': 'assets/images/user6.jpg'},
  ];

  List<String> dummyPosts = [
    'assets/images/post1.jpg',
    'assets/images/post2.jpg',
    'assets/images/post3.jpg',
    'assets/images/post4.jpg',
    'assets/images/post5.jpg',
    'assets/images/post1.jpg',
    'assets/images/post2.jpg',
    'assets/images/post3.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: TextField(
            onChanged: (value) {
              setState(() {
                searchText = value;
              });
            },
            decoration: InputDecoration(
              hintText: 'Search...',
              border: InputBorder.none,
              icon: Icon(Icons.search),
            ),
          ),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Users'),
              Tab(text: 'Posts'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: dummyUsers.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage(dummyUsers[index]['profile_pic']!),
                  ),
                  title: Text(dummyUsers[index]['username']!),
                  onTap: () {
                    showSnackbar(context, 'User');
                  },
                );
              },
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
              itemCount: dummyPosts.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showSnackbar(context, 'Post');
                  },
                  child: Image.asset(
                    dummyPosts[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}






// class SearchPage extends StatefulWidget {
//   const SearchPage({super.key});

//   @override
//   State<SearchPage> createState() => _SearchPageState();
// }

// class _SearchPageState extends State<SearchPage> {
//   final TextEditingController controller = TextEditingController();
//   List<Bird> selectedBirds = [];
//   List<Bird> allBirds = [
//     Bird(
//         name: "John Smith",
//         image:
//             "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80"),
//     Bird(
//         name: "Eurasian Hoopoe",
//         image:
//             "https://media.istockphoto.com/id/1170564027/photo/young-man-closed-eyes-dreaming-isolated-on-grey-studio-background.jpg?s=612x612&w=0&k=20&c=sPBezkOOzVAg63qTw1TbUtSCUM5G3Qb5sFmn2Y3cpnQ="),
//     Bird(
//         name: "Thomas Johnson",
//         image:
//             "https://st4.depositphotos.com/3433891/23034/i/450/depositphotos_230346996-stock-photo-young-handsome-entrepreneur-man-face.jpg"),
//     Bird(
//         name: "Brahmin Starling",
//         image:
//             "https://img.freepik.com/free-photo/handsome-bearded-man-smiling_176420-32667.jpg?w=2000"),
//     Bird(
//         name: "David Brown",
//         image:
//             "https://img.freepik.com/premium-photo/caucasian-handsome-man-beige-wall-laughing_1368-97190.jpg?size=626&ext=jpg&ga=GA1.1.87170709.1696377600&semt=ais"),
//     Bird(
//         name: "Aiden Joseph",
//         image:
//             "https://img.freepik.com/premium-photo/young-handsome-man-smiling-cheerfully-casually-with-positive-happy-confident-relaxed-expression_1194-320239.jpg"),
//     Bird(
//         name: "George Arthur",
//         image:
//             "https://img.freepik.com/free-photo/photo-aggressive-confident-adult-man-has-dark-hair-beard-clenches-fist-looks-seriously-doesnt-afford-being-insulted-shows-his-power-wears-spectacles-red-sweater_273609-42210.jpg"),
//   ];
//   @override
//   void initState() {
//     super.initState();
//     controller.addListener(searchListener);
//   }

//   @override
//   void dispose() {
//     controller.removeListener(searchListener);
//     controller.dispose();
//     super.dispose();
//   }

//   void searchListener() {
//     search(controller.text);
//   }

//   void search(String query) {
//     if (query.isEmpty) {
//       setState(() {
//         selectedBirds = allBirds;
//       });
//     } else {
//       setState(() {
//         selectedBirds = allBirds
//             .where((e) => e.name.toLowerCase().contains(query.toLowerCase()))
//             .toList();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//           preferredSize: Size.fromHeight(60),
//           child: MyAppbar(myText: 'Search')),
//       body: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//           child: Column(children: [
//             SearchBar(
//               backgroundColor: MaterialStatePropertyAll(Colors.grey.shade100),
//               hintText: "Search",
//               controller: controller,
//               padding: MaterialStateProperty.all<EdgeInsets>(
//                   const EdgeInsets.symmetric(horizontal: 15)),
//               leading: const Icon(Icons.search),
//               trailing: const [Icon(Icons.mic), Icon(Icons.menu_rounded)],
//             ),
//             Expanded(
//                 child: ListView.builder(
//                     itemCount: selectedBirds.isEmpty
//                         ? allBirds.length
//                         : selectedBirds.length,
//                     itemBuilder: (BuildContext context, int index) {
//                       final Bird item = selectedBirds.isEmpty
//                           ? allBirds[index]
//                           : selectedBirds[index];

//                       return Card(
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Row(
//                             children: [
//                               Container(
//                                 height: 80,
//                                 width: 80,
//                                 decoration: BoxDecoration(
//                                     borderRadius: const BorderRadius.all(
//                                         Radius.circular(10.0)),
//                                     image: DecorationImage(
//                                       image: NetworkImage(item.image),
//                                       fit: BoxFit.cover,
//                                     )),
//                               ),
//                               const SizedBox(
//                                 width: 20,
//                               ),
//                               Text(
//                                 item.name,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.bold),
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     }))
//           ])),
//     );
//   }
// }

// class Bird {
//   final String name;
//   final String image;

//   Bird({required this.name, required this.image});
// }
