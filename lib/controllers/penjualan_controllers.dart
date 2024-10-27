// import 'dart:convert';

// import 'package:aplikasi_kasir/controllers/produk_controllers.dart';
// import 'package:aplikasi_kasir/models/Penjualan.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'uri.dart' as link;

// const uri = link.uri;

// class PenjualanController extends GetxController {
//   ProdukController produkController = Get.put(ProdukController());
//   var isLoading = true.obs;
//   RxList penjualan = [].obs;
//   List keepPenjualan = [];

//   @override
//   Future<void> onInit() async {
//     super.onInit();
//     fetchData();
//   }

//   fetchData() async {
//     try {
//       http.Response response = await http.get(Uri.parse("$uri/penjualan"));

//       if (response.statusCode == 200) {
//         var result = jsonDecode(response.body);
//         List resultList = [];
//         for (var data in result) {
//           resultList.add(Penjualan.fromJson(data));
//         }
//         penjualan(resultList);
//         keepPenjualan = resultList;
//       }
//     } catch (e) {
//       print("Error : $e");
//     } finally {
//       isLoading(false);
//     }
//   }

//   postPenjualan(List listDataProduk, String idPelanggan, String idAkun,
//       double totalHarga) async {
//     try {
//       await http.post(Uri.parse("$uri/penjualan"),
//           headers: {'Content-Type': 'application/json; charset=UTF-8'},
//           body: jsonEncode({
//             "listDataProduk": listDataProduk,
//             "idPelanggan": idPelanggan,
//             "idAkun": idAkun,
//             "totalHarga": totalHarga
//           }));
//       await fetchData();
//       await produkController.fetchData();
//     } catch (e) {
//       print("Gagal post penjualan : $e");
//     }
//   }
// }
