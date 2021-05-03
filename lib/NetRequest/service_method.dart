import 'package:dio/dio.dart';
import 'package:html/parser.dart';
import 'dart:async';
import 'dart:io';
import './base_url.dart';

Future xxmethod() async {
  try {
    print('开始获取数据......');
    Response response;
    Dio dio = new Dio();
    // dio.options.contentType =
    // ContentType('application', 'x-www-form-urlencoded');
    // var formData = {'lon': '115.02932', 'lat': '35.76198'};

    response = await dio.get("https://idiom.sixming.com/get.php");
    // response = await dio.post(servicePatch['homePageContent'], data: formData);

    if (response.statusCode == 200) {
      // print(response.data);
      return response.data;
    } else {
      throw Exception("serror port break --------");
    }
  } catch (e) {
    return print("ERROR: ========>${e}");
  }
}

//获取详情链接和标题
Future moveInfoReqMethod(url) async {
  print('开始获取${url}数据......');
  Dio dio = new Dio();
  //电影  http://1156zy.com/?m=vod-type-id-1.html
  //电视剧 http://1156zy.com/?m=vod-type-id-2.html
  //综艺 http://1156zy.com/?m=vod-type-id-1.html
  Response res = await dio.get(url);
  print(res);
  // 解析标签的值
  List xx = [];

  List moiveInfo = parse(res.data).querySelectorAll("span.xing_vb4 > a");

  // 获取电影详情链接和标题
  moiveInfo.forEach((element) {
    Map tt = {};
    tt['link'] = 'http://1156zy.com/' + element.attributes['href'];
    tt['title'] = element.text;
    xx.add(tt);
  });

  xx.forEach((element) {
    print(element);
  });
}
