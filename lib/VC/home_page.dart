import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_video/widget/skeleton.dart';
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

  EasyRefreshController _controller; // EasyRefresh控制器

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

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
      body: EasyRefresh(
        child: FutureBuilder(
            future: moveInfoReqMethod(linkList[homeTopIdx.index]),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
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
                return loadingAnimation();
              }
            }),
        onRefresh: () async {
          print('上啦');
          _controller = EasyRefreshController();

          _controller.finishRefresh();
        },
        onLoad: () async {
          print('下啦');
          _controller = EasyRefreshController();

          _controller.finishLoad();
        },
      ),
    );
  }
}
