import 'package:flutter/material.dart';
import 'package:flutter_video/NetRequest/service_method.dart';
import 'package:flutter_video/entitys/page_infos.dart';

class ReqsAPI {
  /// 翻页
  /// refresh 是否刷新
  ///

  static Future<HomeInfoList> newsPageList({
    @required BuildContext context,
    String url,
  }) async {
    Future response = moveInfoReqMethod(url);
    print(response);
    print('${url}' + '----------------');

    // return '123';R
  }
}
