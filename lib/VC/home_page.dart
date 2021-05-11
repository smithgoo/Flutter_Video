import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_video/api/page_api.dart';
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

  //当前的index 做方法封装横向分类点击的title
  int tmpIdx = 0;
  int page = 0;
  EasyRefreshController _controller; // EasyRefresh控制器
  List infoList = [];

  @override
  void initState() {
    super.initState();
    _controller = EasyRefreshController();
  }

//下啦刷新
  _loadRefresh() async {
    return moveInfoReqMethod(linkList[tmpIdx]);
  }

//上啦加载更多
  _loadMore({int page}) async {
    String link = linkList[tmpIdx];
    List xx = link.split('.html');
// http://1156zy.com/?m=vod-type-id-5-pg-2.html
    String reqLink = xx[0] + '/page/' + '${page}' + '.html';
    return moveInfoReqMethod(reqLink);
  }

  @override
  Widget build(BuildContext context) {
    final homeTopIdx = Provider.of<HomeTopIdx>(context);
    if (homeTopIdx.index == null) {
      homeTopIdx.topIndexChang(0);
    }
    tmpIdx = homeTopIdx.index;

    return Scaffold(
      appBar: AppBar(
        title: Text('电影'),
      ),
      body: EasyRefresh(
        child: FutureBuilder(
            future: _loadRefresh(),
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
          print('下啦刷新');
          _controller = EasyRefreshController();
          homeTopIdx.homePageIdxChange(0);
          // loadingAnimation();
          await _loadRefresh();
          _controller.finishRefresh();
        },
        onLoad: () async {
          print('上啦加载更多');
          _controller = EasyRefreshController();
          page = homeTopIdx.page;
          page++;
          homeTopIdx.homePageIdxChange(page);
          await _loadMore(page: page);
          _controller.finishLoad();
        },
      ),
    );
  }
}
