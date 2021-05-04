import 'package:flutter/material.dart';
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
    'http://1156zy.com/?m=vod-type-id-5.html',
    'http://1156zy.com/?m=vod-type-id-6.html',
    'http://1156zy.com/?m=vod-type-id-7.html',
    'http://1156zy.com/?m=vod-type-id-8.html',
    'http://1156zy.com/?m=vod-type-id-9.html',
    'http://1156zy.com/?m=vod-type-id-10.html',
    'http://1156zy.com/?m=vod-type-id-11.html',
    'http://1156zy.com/?m=vod-type-id-25.html',
  ];

  List infoList = [];

  @override
  Widget build(BuildContext context) {
    final homeTopIdx = Provider.of<HomeTopIdx>(context);
    moveInfoReqMethod(linkList[homeTopIdx.index])
        .then((value) => (value.forEach(
              (element) {
                moveDetailInfoReqMethod(element['link'])
                    .then((value) => (value.forEach((element) {
                          infoList.add(element);
                        })));
              },
            )));
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 44),
        child: Column(
          children: [
            TopExchangeView(),
            HomePageList(),
          ],
        ),
      ),
    );
  }
}
