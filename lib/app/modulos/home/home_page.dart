import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/app/modulos/home/home_controller.dart';

/*class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Container(
        child: GetX<HomeController>(
          initState: (state) {
            Get.find<HomeController>().getAll();
          },
          builder: (c) {
            return c.postList.length < 1
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: c.postList.length,
                    itemBuilder: (context, index) {
                      final post = c.postList[index];
                      return ListTile(
                        title: Text(post.title),
                        subtitle: Text(post.body),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
} */

//ObX requiere en el controller el onInit, onReady y onClose
class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HomePage')),
      body: Container(
          child: Obx(() => controller.isLoading
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: controller.postList.length,
                  itemBuilder: (context, index) {
                    final post = controller.postList[index];
                    return ListTile(
                      title: Text(post.title),
                      subtitle: Text(post.description),
                    );
                  },
                ))),
    );
  }
}
