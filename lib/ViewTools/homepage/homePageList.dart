import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        print('点击了');
      },
      child: Container(
        height: ScreenUtil().setHeight(120),
        child: Text(
          '${infoList[index]}',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
