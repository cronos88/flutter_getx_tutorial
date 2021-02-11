import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/rutas/app_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Material App',
      getPages: AppPages.pages,
      initialRoute: Routes.HOME,
    );
  }
}
