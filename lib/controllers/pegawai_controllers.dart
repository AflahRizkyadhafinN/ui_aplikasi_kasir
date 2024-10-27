// import 'dart:convert';

// import 'package:aplikasi_kasir/models/Pegawai.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import "uri.dart" as link;

// const uri = link.uri;

// class PegawaiController extends GetxController {
//   RxBool isLoading = true.obs;
//   RxList pegawai = [].obs;
//   List keepPegawai = [];

//   RxBool onePegawaiNotBlank = false.obs;
//   Pegawai onePegawai = Pegawai();

//   @override
//   Future<void> onInit() async {
//     super.onInit();
//     showPegawai();
//   }

//   showPegawai() async {
//     try {
//       http.Response response = await http.get(Uri.parse("$uri/akun"));

//       if (response.statusCode == 200) {
//         final result = jsonDecode(response.body);
//         List resultList = [];

//         for (var data in result) {
//           resultList.add(Pegawai.fromJson(data));
//         }
//         pegawai(resultList);
//         keepPegawai = resultList;
//       }
//     } catch (e) {
//       print("Gagal mengambil data : $e");
//     } finally {
//       isLoading(false);
//     }
//     debugPrint(pegawai.toString());
//   }

//   addPegawai(String kode, String nama, String password, String cPassword,
//       String role) async {
//     if (password == cPassword) {
//       Map<String, dynamic> pegawai =
//           Pegawai(kodePetugas: kode, nama: nama, password: password, role: role)
//               .toJson();

//       try {
//         await http.post(Uri.parse("$uri/akun"),
//             headers: {'Content-Type': 'application/json; charset=UTF-8'},
//             body: jsonEncode(pegawai));
//         await showPegawai();
//       } catch (e) {
//         print("Tambah data gagal : $e");
//       }
//     } else {
//       Get.snackbar("Error", "Confirm password tidak sama");
//     }
//   }

//   deletePegawai(String idAkun) async {
//     try {
//       await http.delete(Uri.parse("$uri/akun/$idAkun"));
//       await showPegawai();
//     } catch (e) {
//       print("Gagal hapus akun : $e");
//     }
//   }

//   findOnePegawai(String idAkun) async {
//     onePegawaiNotBlank(false);
//     try {
//       http.Response response = await http.get(Uri.parse("$uri/akun/$idAkun"));

//       if (response.statusCode == 200) {
//         onePegawai = Pegawai.fromJson(jsonDecode(response.body));
//       }
//     } catch (e) {
//       print("Gagal mengambil data : $e");
//     } finally {
//       onePegawaiNotBlank(true);
//     }
//   }

//   updatePegawai(String idAkun, String kode, String nama, String password,
//       String cPassword, String role) async {
//     Map<String, dynamic> pegawai =
//         Pegawai(kodePetugas: kode, nama: nama, password: password, role: role)
//             .toJson();
//     try {
//       await http.patch(Uri.parse("$uri/akun/$idAkun"),
//           headers: {'Content-Type': 'application/json; charset=UTF-8'},
//           body: jsonEncode(pegawai));
//       await showPegawai();
//     } catch (e) {
//       print("Gagal update data : $e");
//     }
//   }
// }
