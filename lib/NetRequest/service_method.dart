import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'dart:async';
import 'dart:io';
import './base_url.dart';
import 'package:provider/provider.dart';
import 'package:flutter_video/DataProvider/dataProvider.dart';

import 'dart:convert' as convert;

//获取详情链接和标题
Future moveInfoReqMethod(url) async {
  // print('开始获取${url}数据......');
  Dio dio = new Dio();
  //电影  http://1156zy.com/?m=vod-type-id-1.html
  //电视剧 http://1156zy.com/?m=vod-type-id-2.html
  //综艺 http://1156zy.com/?m=vod-type-id-1.html
  Response res = await dio.get(url);
  // print(res);
  // 解析标签的值
  List xx = [];

  List moiveInfo = parse(res.data).querySelectorAll("span.xing_vb4 > a");

  // 获取电影详情链接和标题
  moiveInfo.forEach((element) {
    Map tt = {};
    tt['link'] = 'http://1156zy.com/' + element.attributes['href'];
    tt['title'] = element.text;
    // print(moveDetailInfoReqMethod(tt['link']));
    moveDetailInfoReqMethod(tt['link']).then((value) => {
          tt['image'] = value['image'],
          tt['playLink'] = value['playLink'],
        });
    xx.add(tt);
  });
  return xx;
}

//获取详情链接和标题
Future<Map> moveDetailInfoReqMethod(url) async {
  // print('开始获取${url}数据......');
  Dio dio = new Dio();

  Response res = await dio.get(url);
  // 解析标签的值
  Map tt = {};

  List moiveImgInfo = parse(res.data).querySelectorAll("div.vodImg > img");
  List moivem3u8 =
      parse(res.data).querySelectorAll(".vodplayinfo > div > ul > li > input");

  List linkList = [];
  moivem3u8.forEach((element) {
    String link = element.attributes['value'];
    if (link.contains('m3u8')) linkList.add(link);
  });

  // 获取电影详情链接和标题
  moiveImgInfo.forEach((element) {
    tt['image'] = element.attributes['src'];
    tt['title'] = element.attributes['alt'];
    tt['playLink'] = linkList;
  });

  return tt;
}
