import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPlayerDetail extends StatelessWidget {
  final String title = Get.parameters['title'];
  final String link = Get.parameters['link'];

  @override
  Widget build(BuildContext context) {
    print(title);
    print(link);
    return Scaffold(
      appBar: AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.back(result: '详情页面返回');
          },
        ),
        title: Text('播放器详情页'),
      ),
      body: Container(
        child: Text('播放器详情页'),
      ),
    );
  }
}
