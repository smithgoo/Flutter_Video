import 'package:cached_network_image/cached_network_image.dart';
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
      height: ScreenUtil().setHeight(1134 - 44 - 34 - 49 - 50),
      width: ScreenUtil().screenWidth,
      margin: EdgeInsets.all(3.0),
      child: GridView.count(
          crossAxisCount: 4,
          childAspectRatio: 0.6,
          children: infoList.map((e) {
            return _listInkWell(e);
          }).toList()),
    );
  }

  Widget _listInkWell(Map item) {
    String xx = item['title'];
    List link = item['playLink'];
    String img = item['image'];
    return InkWell(
      onTap: () {
        Get.toNamed(
                '${AppRoutes.VideoDetail}?title=${xx}&&link=${listToString(link)}&&img=${img}')
            .then(
          (value) => print('123'),
        );
      },
      child: Container(
        width: (ScreenUtil().screenWidth - 12) / 3,
        height: (ScreenUtil().screenWidth - 12) / 3 * 16 / 9 + 30,
        child: Column(
          children: [
            CachedNetworkImage(
              imageUrl: img,
              placeholder: (context, url) =>
                  Image.asset('assets/images/placeholder@2x.png'),
              errorWidget: (context, url, error) =>
                  Image.asset('assets/images/placeholder@2x.png'),
            ),
            Text(
              item['title'],
              maxLines: 1,
              style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //list转string
  String listToString(List list) {
    if (list == null) {
      return null;
    }
    String result;
    list.forEach((string) =>
        {if (result == null) result = string else result = '$result，$string'});
    return result.toString();
  }
}
