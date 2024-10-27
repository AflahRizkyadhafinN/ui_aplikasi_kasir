import 'package:get/get.dart';

class Model extends GetxController {
  RxList listProduk = [].obs;
  RxString kode = "".obs;

  RxBool inputKode = false.obs;
  RxBool inputAmount = false.obs;
  RxBool showCustomer = false.obs;

  RxDouble totalCost = 0.0.obs;
  RxString pelangganId = "".obs;
  RxString pelangganNama = "".obs;

  TotalCost() {
    double cost = 0.0;
    for (var data in listProduk) {
      cost += data["subTotal"];
    }
    totalCost(cost);
  }
}
