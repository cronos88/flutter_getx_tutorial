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
                    Widget card;
                    if (post.content != null) {
                      card = Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          color: Colors.white70,
                          child: Column(
                            children: [
                              Stack(
                                alignment: Alignment(0, 1),
                                children: [
                                  post.urlToImage != null
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(15),
                                              topRight: Radius.circular(15)),
                                          child: Image.network(post.urlToImage),
                                        )
                                      : Container(),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: 8, right: 8, bottom: 5),
                                    child: Text(
                                      post.title,
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Text(
                                      post.description,
                                      // overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                    return card;
                  },
                ))),
    );
  }
}
