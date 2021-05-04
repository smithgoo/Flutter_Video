import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'nav_bottomBar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Router/app_pages.dart';
import 'package:provider/provider.dart';
import './DataProvider/homepageIdx.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeTopIdx>.value(
            value: HomeTopIdx(),
          ),
        ],
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: Nav_bottomBar_index(),
        getPages: AppPages.pages,
      ),
    );
  }
}
