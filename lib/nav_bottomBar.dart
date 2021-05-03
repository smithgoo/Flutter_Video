import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'VC/pages.dart';

class Nav_bottomBar_index extends StatefulWidget {
  Nav_bottomBar_index({Key key}) : super(key: key);

  @override
  _Nav_bottomBar_indexState createState() => _Nav_bottomBar_indexState();
}

class _Nav_bottomBar_indexState extends State<Nav_bottomBar_index> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(icon: Icon(Icons.movie), title: Text('电影')),
    BottomNavigationBarItem(icon: Icon(Icons.tv), title: Text('电视')),
    BottomNavigationBarItem(icon: Icon(Icons.shop), title: Text('综艺')),
    BottomNavigationBarItem(icon: Icon(Icons.mail), title: Text('我的')),
  ];

  final List<Widget> navAllPages = [
    HomePage(),
    TVPage(),
    ShowPage(),
    MinePage(),
  ];

  int currentIndex = 0;
  var currentPage;

  @override
  void initState() {
    currentPage = navAllPages[currentIndex];
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = navAllPages[currentIndex];
          });
        },
      ),
      body: IndexedStack(
        index: currentIndex,
        children: navAllPages,
      ),
    );
  }
}
