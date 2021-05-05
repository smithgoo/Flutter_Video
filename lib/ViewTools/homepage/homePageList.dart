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
      height: ScreenUtil().setHeight(1334 - 40 - 60 - 49),
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
            Image.network(
                'http://img9.doubanio.com/view/photo/s_ratio_poster/public/p2622117386.jpg'),
            Column(
              children: [
                Text('123'),
                Text('456'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
