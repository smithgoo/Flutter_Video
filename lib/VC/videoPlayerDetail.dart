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
        title: Text('播放器详情页'),
      ),
      body: Container(
        child: Text('播放器详情页'),
      ),
    );
  }
}
