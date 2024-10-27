// import 'dart:convert';

// import 'package:aplikasi_kasir/models/Pelanggan.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import "uri.dart" as link;

// const uri = link.uri;

// class PelangganController extends GetxController {
//   var isLoading = true.obs;
//   RxList pelanggan = [].obs;
//   List keepPelanggan = [];

//   RxBool onePelangganNotBlank = false.obs;
//   Pelanggan onePelanggan = Pelanggan();

//   @override
//   Future<void> onInit() async {
//     super.onInit();
//     fetchData();
//   }

//   fetchData() async {
//     try {
//       http.Response response = await http.get(Uri.parse("$uri/pelanggan"));

//       if (response.statusCode == 200) {
//         var result = jsonDecode(response.body);
//         List resultList = [];
//         for (var data in result) {
//           resultList.add(Pelanggan.fromJson(data));
//         }
//         pelanggan(resultList);
//         keepPelanggan = resultList;
//       }
//     } catch (e) {
//       print("Gagal mengambil data pelanggan : $e");
//     } finally {
//       isLoading(false);
//     }
//   }

//   postPelanggan(String kodePelanggan, String nama, String alamat,
//       String nomorPelanggan) async {
//     Map<String, dynamic> pelanggan = Pelanggan(
//             alamat: alamat,
//             nama: nama,
//             kodePelanggan: kodePelanggan,
//             nomorTelepon: nomorPelanggan)
//         .toJson();

//     try {
//       await http.post(Uri.parse("$uri/pelanggan"),
//           headers: {'Content-Type': 'application/json; charset=UTF-8'},
//           body: jsonEncode(pelanggan));
//       await fetchData();
//     } catch (e) {
//       print("Post data gagal : $e");
//     }
//   }

//   deletePelanggan(String idPelanggan) async {
//     try {
//       await http.delete(Uri.parse("$uri/pelanggan/$idPelanggan"));
//       await fetchData();
//     } catch (e) {
//       print("Gagal delete data : $e");
//     }
//   }

//   findOnePelanggan(String idPelanggan) async {
//     onePelangganNotBlank(false);
//     try {
//       http.Response response =
//           await http.get(Uri.parse("$uri/pelanggan/$idPelanggan"));
//       if (response.statusCode == 200) {
//         onePelanggan = Pelanggan.fromJson(jsonDecode(response.body));
//       }
//     } catch (e) {
//       print("Gagal mengambil data : $e");
//     } finally {
//       onePelangganNotBlank(true);
//     }
//   }

//   updatePegawai(String idPelanggan, String kodePelanggan, String nama,
//       String alamat, String nomorPelanggan) async {
//     Map<String, dynamic> pelanggan = Pelanggan(
//             alamat: alamat,
//             kodePelanggan: kodePelanggan,
//             nama: nama,
//             nomorTelepon: nomorPelanggan)
//         .toJson();
//     try {
//       await http.patch(Uri.parse("$uri/pelanggan/$idPelanggan"),
//           headers: {'Content-Type': 'application/json; charset=UTF-8'},
//           body: jsonEncode(pelanggan));
//       await fetchData();
//     } catch (e) {
//       print("Gagal update data : $e");
//     }
//   }
// }
