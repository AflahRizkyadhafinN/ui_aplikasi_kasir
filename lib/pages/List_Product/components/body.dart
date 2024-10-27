import 'package:aplikasi_kasir/components/main_background.dart';
import 'package:aplikasi_kasir/components/navbar.dart';
import 'package:aplikasi_kasir/pages/List_Product/components/list_product_card.dart';
import 'package:aplikasi_kasir/pages/List_Product/components/model.dart';
import 'package:aplikasi_kasir/pages/List_Product/components/product_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Model model = Get.put(Model());
    RxList produk = [
      {
        "idProduk": "",
        "nama": "Marimas",
        "harga": 12000,
        "kodeBarang": "mrms",
        "stok": 150
      }
    ].obs;
    RxString searchValue = "".obs;

    return Stack(
      children: [
        MainBackground(
            height: MediaQuery.sizeOf(context).height - 77,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Navbar(
                  title: "List Produk",
                  addButton: true,
                  onTapAddButton: () => {
                    model.showModal.value = true,
                    model.modalType.value = "add"
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                      color: Color(0xffE2E2E2),
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width - 130,
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          onChanged: (value) {},
                          style: GoogleFonts.inter(
                              color: const Color(0xff000000),
                              fontWeight: FontWeight.w800,
                              fontSize: 13),
                          decoration: InputDecoration(
                            border: const UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            hintText: "Cari Produk",
                            hintStyle: GoogleFonts.inter(
                                color: const Color(0xffB0B0B0),
                                fontWeight: FontWeight.w700,
                                fontSize: 13),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          var res = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SimpleBarcodeScannerPage(),
                              ));

                          if (res is String && res != "-1") {
                            searchValue(res);
                          }
                        },
                        icon: const Icon(Icons.qr_code_scanner_rounded),
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height - 210,
                  child: ListView(
                    children: [
                      for (var data in produk)
                        ListProductCard(
                            idProduk: data["idProduk"],
                            nama: data["nama"],
                            harga: data["harga"],
                            kode: data["kodeBarang"],
                            stok: data["stok"])
                    ],
                  ),
                )
              ],
            )),
        Obx(() => model.showModal.value
            ? ProductModal(
                onTapBackdrop: () => model.showModal.value = false,
              )
            : Container())
      ],
    );
  }
}
