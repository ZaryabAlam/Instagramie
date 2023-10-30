import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:instagramie/dashboard.dart';
import 'package:instagramie/pages/home_feed_page.dart';
import 'package:instagramie/utils/ui_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Instagramie',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          primarySwatch: Colors.blueGrey,
          primaryColor: Colors.black,
        ),
        // home: MainScaffold(),
        home: Dashboard());
  }
}

class MainScaffold extends StatefulWidget {
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  static const _kAddPhotoTabIndex = 2;
  int _tabSelectedIndex = 0;

  // Save the home page scrolling offset,
  // used when navigating back to the home page from another tab.
  double _lastFeedScrollOffset = 0;
  late ScrollController _scrollController;

  @override
  void dispose() {
    _disposeScrollController();
    super.dispose();
  }

  void _scrollToTop() {
    if (_scrollController == null) {
      return;
    }
    _scrollController.animateTo(
      0.0,
      duration: Duration(milliseconds: 250),
      curve: Curves.decelerate,
    );
  }

  // Call this when changing the body that doesn't use a ScrollController.
  void _disposeScrollController() {
    if (_scrollController != null) {
      _lastFeedScrollOffset = _scrollController.offset;
      _scrollController.dispose();
      // _scrollController = null;
    }
  }

  void _onTabTapped(BuildContext context, int index) {
    if (index == _kAddPhotoTabIndex) {
      showSnackbar(context, 'Add Photo');
    } else if (index == _tabSelectedIndex) {
      _scrollToTop();
    } else {
      setState(() => _tabSelectedIndex = index);
    }
  }

  Widget _buildPlaceHolderTab(String tabName) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 64.0),
        child: Column(
          children: <Widget>[
            Text(
              'Oops, the $tabName tab is\n under construction!',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 28.0),
            ),
            Image.asset('assets/images/building.gif'),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    switch (_tabSelectedIndex) {
      case 0:
        _scrollController =
            ScrollController(initialScrollOffset: _lastFeedScrollOffset);
        return HomeFeedPage(scrollController: _scrollController);
      default:
        const tabIndexToNameMap = {
          0: 'Home',
          1: 'Search',
          2: 'Add Photo',
          3: 'Notifications',
          4: 'Profile',
        };
        _disposeScrollController();
        return _buildPlaceHolderTab(tabIndexToNameMap[_tabSelectedIndex]!);
    }
  }

  // Unselected tabs are outline icons, while the selected tab should be solid.
  // Widget _buildBottomNavigation() {
  //   const unselectedIcons = <IconData>[
  //     Icons.home,
  //     Icons.search,
  //     Icons.add_box,
  //     Icons.favorite_border,
  //     Icons.person_outline,
  //   ];
  //   const selecteedIcons = <IconData>[
  //     Icons.home,
  //     Icons.search,
  //     Icons.add_box,
  //     Icons.favorite,
  //     Icons.person,
  //   ];
  //    const tabIndexToNameList= [
  //          'Home',
  //         'Search',
  //         'Add Photo',
  //         'Notifications',
  //         'Profile',
  //       ];
  //   final bottomNaivgationItems = List.generate(5, (int i) {
  //     final iconData =
  //         _tabSelectedIndex == i ? selecteedIcons[i] : unselectedIcons[i];

  //     return BottomNavigationBarItem(icon: Icon(iconData),label: tabIndexToNameList[i]);
  //   }).toList();

  //   return Builder(builder: (BuildContext context) {
  //     return BottomNavigationBar(
  //       iconSize: 32.0,
  //       type: BottomNavigationBarType.fixed,
  //       items: bottomNaivgationItems,
  //       currentIndex: _tabSelectedIndex,
  //       onTap: (int i) => _onTabTapped(context, i),
  //     );
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                'Instagramie',
                style: TextStyle(
                    fontFamily: 'Billabong',
                    color: Colors.black,
                    fontSize: 32.0),
              ),
              onTap: _scrollToTop,
            ),
          ],
        ),
        actions: <Widget>[
          // Builder(builder: (BuildContext context) {
          //   return IconButton(
          //     color: Colors.black,
          //     // icon: Icon(Icons.live_tv_rounded),
          //     icon:FaIcon(FontAwesomeIcons.tv),
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
      ),
      body: _buildBody(),
      // bottomNavigationBar: _buildBottomNavigation(),
    );
  }
}
