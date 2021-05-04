import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_video/DataProvider/dataProvider.dart';
import 'package:provider/provider.dart';

class TopExchangeView extends StatefulWidget {
  TopExchangeView({Key key}) : super(key: key);

  @override
  _TopExchangeViewState createState() => _TopExchangeViewState();
}

class _TopExchangeViewState extends State<TopExchangeView> {
  var topListTitle = ['动作片', '喜剧片', '爱情片', '科幻片', '恐怖片', '剧情片', '战争片', '纪录片'];
  var listIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: ScreenUtil().setWidth(750),
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

  Widget _topInkWell(String item, int index) {
    bool isclick = false;
    isclick = (index == listIndex) ? true : false;
    final homeTopIdx = Provider.of<HomeTopIdx>(context);
    return InkWell(
      onTap: () {
        setState(() {
          listIndex = index;
          homeTopIdx.topIndexChang(listIndex);
        });
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
        decoration: BoxDecoration(
            //设置点击显示的横线
            color: Colors.white,
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black12))),
        child: Text(
          item,
          style: TextStyle(
            fontSize: ScreenUtil().setSp(28),
            color: isclick ? Colors.redAccent : Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
