import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'customFijkWidgetBottom.dart';

class VideoPlayerDetail extends StatefulWidget {
  VideoPlayerDetail({Key key, title, link}) : super(key: key);

  @override
  _VideoPlayerDetailState createState() => _VideoPlayerDetailState();
}

class _VideoPlayerDetailState extends State<VideoPlayerDetail> {
  final String title = Get.parameters['title'];
  final String link = Get.parameters['link'];
  final FijkPlayer player = FijkPlayer();
  @override
  Widget build(BuildContext context) {
    print(title);
    print(link);

    @override
    void initState() {
      /// 指定视频地址
      player.setDataSource(link, autoPlay: true);
      super.initState();
    }

    @override
    void dispose() {
      super.dispose();
      player.release();
    }

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
        child: FijkView(
          color: Colors.black,
          player: player,
          panelBuilder: (FijkPlayer player, FijkData data, BuildContext context,
              Size viewSize, Rect texturePos) {
            /// 使用自定义的布局
            return CustomFijkWidgetBottom(
              player: player,
              buildContext: context,
              viewSize: viewSize,
              texturePos: texturePos,
            );
          },
        ),
      ),
    );
  }
}
