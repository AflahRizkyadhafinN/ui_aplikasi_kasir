// import 'dart:convert';

// import 'package:aplikasi_kasir/models/Produk.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import "uri.dart" as link;

// const uri = link.uri;

// class ProdukController extends GetxController {
//   var isLoading = true.obs;
//   RxList produk = [].obs;
//   List keepProduk = [].obs;

//   RxBool oneProdukNotBlank = false.obs;
//   Produk oneProduk = Produk();

//   @override
//   Future<void> onInit() async {
//     super.onInit();
//     fetchData();
//   }

//   fetchData() async {
//     try {
//       http.Response response = await http.get(Uri.parse("$uri/produk"));
//       // debugPrint(response.body);

//       if (response.statusCode == 200) {
//         var result = jsonDecode(response.body);
//         List resultList = [];
//         for (var data in result) {
//           resultList.add(Produk.fromJson(data));
//         }
//         produk.value = resultList;
//         keepProduk = resultList;
//       } else {
//         throw Exception("Data produk gagal diakses");
//       }
//     } catch (e) {
//       print("Fetch data gagal");
//     } finally {
//       isLoading(false);
//     }
//   }

//   postProduk(String kode, String nama, int jumlah, int harga) async {
//     Map<String, dynamic> produk =
//         Produk(harga: harga, kodeBarang: kode, nama: nama, stok: jumlah)
//             .toJson();
//     try {
//       await http.post(Uri.parse("$uri/produk"),
//           headers: {'Content-Type': 'application/json; charset=UTF-8'},
//           body: jsonEncode(produk));
//       await fetchData();
//     } catch (e) {
//       print("Post data gagal : $e");
//     }
//   }

//   deleteProduk(String idProduk) async {
//     try {
//       await http.delete(Uri.parse("$uri/produk/$idProduk"));
//       await fetchData();
//     } catch (e) {
//       print("Gagal delete produk : $e");
//     }
//   }

//   findOneProduk(String idProduk) async {
//     oneProdukNotBlank(false);
//     debugPrint("Cek id: $idProduk");
//     try {
//       http.Response response =
//           await http.get(Uri.parse("$uri/produk/$idProduk"));

//       if (response.statusCode == 200) {
//         oneProduk = Produk.fromJson(jsonDecode(response.body));
//       }
//     } catch (e) {
//       print("Gagal mencari produk : $e");
//     } finally {
//       oneProdukNotBlank(true);
//     }
//   }

//   updateProduk(
//       String idProduk, String kode, String nama, int jumlah, int harga) async {
//     Map<String, dynamic> produk =
//         Produk(harga: harga, kodeBarang: kode, nama: nama, stok: jumlah)
//             .toJson();
//     try {
//       await http.patch(Uri.parse("$uri/produk/$idProduk"),
//           headers: {'Content-Type': 'application/json; charset=UTF-8'},
//           body: jsonEncode(produk));
//       await fetchData();
//     } catch (e) {
//       print("Edit produk gagal : $e");
//     }
//   }
// }
