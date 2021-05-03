import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopExchangeView extends StatelessWidget {
  const TopExchangeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var topListTitle = ['动作片', '喜剧片', '爱情片', '科幻片', '恐怖片', '剧情片', '战争片', '纪录片'];

    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(50),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(
            width: 1,
            color: Colors.black12,
          ))),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: topListTitle.length,
        itemBuilder: (context, index) {
          return _topInkWell(topListTitle[index], index);
        },
      ),
    );
  }

  Widget _topInkWell(String item, int idx) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        child: Text(
          item,
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}
