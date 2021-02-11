import 'package:get/get.dart';
import 'package:getx_tutorial/app/data/model/model.dart';
import 'package:getx_tutorial/app/data/repository/post_repository.dart';
import 'package:meta/meta.dart';

class HomeController extends GetxController {
  final MyRepository repository;
  HomeController({@required this.repository}) : assert(repository != null);

  // Se usan cuando utilizamos Obx en la vista
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    await Future.delayed(Duration(seconds: 5));
    this._postList.listen((_) {
      isLoading = false;
    });
    this.getAll();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  // final _postList = List<MyModel>().obs; //Variable
  Rx<List<MyModel>> _postList = Rx<List<MyModel>>(); //Variable
  RxBool _isLoading = RxBool(true);

  List<MyModel> get postList => this._postList.value;
  set postList(List<MyModel> value) => this._postList.value = value;

  bool get isLoading => this._isLoading.value;
  set isLoading(bool value) => this._isLoading.value = value;

  getAll() {
    repository.getAll().then((data) {
      this.postList = data;
      // isLoading = false;
    });
  }
}
