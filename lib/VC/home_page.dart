import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import '../NetRequest/service_method.dart';
import '../ViewTools/homepage/topExchangeView.dart';
import 'package:flutter_video/DataProvider/dataProvider.dart';
import 'package:provider/provider.dart';
import '../ViewTools/homepage/homePageList.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List linkList = [
    'http://hct.dbyunzy.com/index.php/vod/type/id/21.html',
    'http://hct.dbyunzy.com/index.php/vod/type/id/22.html',
    'http://hct.dbyunzy.com/index.php/vod/type/id/23.html',
    'http://hct.dbyunzy.com/index.php/vod/type/id/24.html',
    'http://hct.dbyunzy.com/index.php/vod/type/id/25.html',
    'http://hct.dbyunzy.com/index.php/vod/type/id/29.html',
    'http://hct.dbyunzy.com/index.php/vod/type/id/27.html',
    'http://hct.dbyunzy.com/index.php/vod/type/id/30.html',
  ];

  List infoList = [];

  @override
  Widget build(BuildContext context) {
    final homeTopIdx = Provider.of<HomeTopIdx>(context);
    if (homeTopIdx.index == null) {
      homeTopIdx.topIndexChang(0);
    }
    loadingAnimation();
    print(homeTopIdx.index);
    return Scaffold(
        appBar: AppBar(
          title: Text('电影'),
        ),
        body: FutureBuilder(
            future: moveInfoReqMethod(linkList[homeTopIdx.index]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                // var data = json.decode(snapshot.data.toString());
                // print(snapshot.data);
                return SingleChildScrollView(
                  child: SafeArea(
                    top: true,
                    child: Container(
                      // margin: EdgeInsets.only(top: 44),
                      child: Column(
                        children: [
                          TopExchangeView(),
                          HomePageList(
                            infoList: snapshot.data,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return LoadingFlipping.circle(
                  borderColor: Colors.cyan,
                  borderSize: 3.0,
                  size: 30.0,
                  backgroundColor: Colors.cyanAccent,
                  duration: Duration(milliseconds: 500),
                );
              }
              ;
            }));
  }

  loadingAnimation() {
    return LoadingFlipping.circle(
      borderColor: Colors.cyan,
      borderSize: 3.0,
      size: 30.0,
      backgroundColor: Colors.cyanAccent,
      duration: Duration(milliseconds: 500),
    );
  }
}
