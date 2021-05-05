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
        String xx = infoList[index]['title'];
        List link = infoList[index]['playLink'];
        Get.toNamed(
                '${AppRoutes.VideoDetail}?title=${xx}&&link=${listToString(link)}')
            .then(
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
