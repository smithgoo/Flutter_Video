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
      height: ScreenUtil().setHeight(1134 - 44 - 34 - 49),
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
    String xx = infoList[index]['title'];
    List link = infoList[index]['playLink'];
    String img = infoList[index]['image'];
    return InkWell(
      onTap: () {
        Get.toNamed(
                '${AppRoutes.VideoDetail}?title=${xx}&&link=${listToString(link)}&&img=${img}')
            .then(
          (value) => print('123'),
        );
      },
      child: Container(
        height: ScreenUtil().setHeight(120),
        child: Row(
          children: [
            CachedNetworkImage(
              imageUrl: img,
              placeholder: (context, url) =>
                  Image.asset('assets/images/placeholder@2x.png'),
              errorWidget: (context, url, error) => new Icon(Icons.error),
            ),
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
