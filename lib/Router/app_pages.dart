import 'package:flutter/material.dart';
import 'package:flutter_video/VC/pages.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.VideoDetail,
      page: () => VideoPlayerDetail(),
    ),
  ];
}
