import 'package:flutter/material.dart';
import '../NetRequest/service_method.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    moveInfoReqMethod('http://1156zy.com/?m=vod-type-id-1.html');
    return Container(
      child: Center(
        child: Text('首页'),
      ),
    );
  }
}
