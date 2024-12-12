import 'package:get/get.dart';
import 'package:projectids/core.dart';

class PictureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListPictureController>(() => ListPictureController());
  }
}
