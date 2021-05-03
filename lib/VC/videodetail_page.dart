import 'package:flutter/material.dart';

class VideoDetailPage extends StatefulWidget {
  VideoDetailPage({Key key}) : super(key: key);

  @override
  _VideoDetailPageState createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('详情'),
      ),
    );
  }
}
