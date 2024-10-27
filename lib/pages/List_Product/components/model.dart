import 'package:get/get.dart';

class Model extends GetxController {
  RxBool showModal = false.obs;
  RxString modalType = "add".obs;
  RxBool showAction = false.obs;
  RxString idProduk = "".obs;
}
