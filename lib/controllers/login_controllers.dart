// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'uri.dart' as link;

// const uri = link.uri;

// class LoginController extends GetxController {
//   var isLoading = true.obs;
//   RxMap user = {}.obs;

//   Login(String kode, String password) async {
//     try {
//       http.Response response = await http.post(Uri.parse("$uri/login"),
//           headers: {'Content-Type': 'application/json; charset=UTF-8'},
//           body: jsonEncode({"kode": kode, "password": password}));

//       if (response.statusCode == 200) {
//         user.value = jsonDecode(response.body);
//         return response.statusCode;
//       }
//     } catch (e) {
//       print("Login gagal : $e");
//     }
//   }
// }
