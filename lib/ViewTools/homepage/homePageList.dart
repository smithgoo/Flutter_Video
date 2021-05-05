import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_video/Router/app_pages.dart';
import 'package:get/get.dart';

class HomePageList extends StatelessWidget {
  final List infoList;
  const HomePageList({Key key, this.infoList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().screenHeight,
      margin: EdgeInsets.only(top: 0),
      child: ListView.builder(
        itemCount: infoList.length,
        itemBuilder: (context, index) {
          return _listInkWell(index);
        },
      ),
    );
  }

  Widget _listInkWell(int index) {
    return InkWell(
      onTap: () {
        String xx = '123';
        String link =
            'https://zk2.cdt-md.com/2020/11/19/bk0AduUTtyl3MD4v/playlist.m3u8';
        Get.toNamed('${AppRoutes.VideoDetail}?title=${xx}&&link=${link}').then(
          (value) => print(value),
        );
      },
      child: Container(
        height: ScreenUtil().setHeight(120),
        child: Row(
          children: [
            Image.network(infoList[index]['image']),
            Column(
              children: [
                Text(
                  infoList[index]['title'],
                ),
                Text('456'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
