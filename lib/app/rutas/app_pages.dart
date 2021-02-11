import 'package:get/get.dart';
import 'package:getx_tutorial/app/modulos/home/home_binding.dart';
import 'package:getx_tutorial/app/modulos/home/home_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    )
  ];
}
