import 'package:aplikasi_kasir/components/main_background.dart';
import 'package:aplikasi_kasir/components/navbar.dart';
import 'package:aplikasi_kasir/pages/Transaction/components/amount_of_product.dart';
import 'package:aplikasi_kasir/pages/Transaction/components/customer_modal.dart';
import 'package:aplikasi_kasir/pages/Transaction/components/model.dart';
import 'package:aplikasi_kasir/pages/Transaction/components/product_card.dart';
import 'package:aplikasi_kasir/pages/Transaction/components/search_product.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Model model = Get.put(Model());
    RxList listProduct = [
      {"harga": 1500, "subTotal": 15000, "nama": "Marimas", "jumlah": 10}
    ].obs;
    debugPrint("body : $listProduct)}");

    return Stack(
      children: [
        MainBackground(
          buttomButton: Row(
            children: [
              GestureDetector(
                onTap: () => {model.showCustomer(true)},
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 0, 150, 20),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    width: (MediaQuery.sizeOf(context).width / 2) - 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Pelanggan",
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () => {Get.snackbar("Transaksi", "Transaksi berhasil")},
                child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 7),
                    decoration: const BoxDecoration(
                        color: Color(0xffFF8400),
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    width: MediaQuery.sizeOf(context).width / 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.receipt,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Receipt",
                          style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    )),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Navbar(
                title: "Transaksi",
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                    color: Color(0xffE2E2E2),
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: [
                    GestureDetector(
                      child: Container(
                        width: MediaQuery.sizeOf(context).width - 130,
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                          "Masukan kode barang",
                          style: GoogleFonts.inter(
                              color: const Color(0xffB0B0B0),
                              fontWeight: FontWeight.w700,
                              fontSize: 13),
                        ),
                      ),
                      onTap: () {
                        model.inputKode.value = true;
                      },
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
                          model.kode.value = res;
                          model.inputAmount.value = true;
                          res = null;
                          debugPrint("body : ${model.kode.value}");
                        }
                      },
                      icon: const Icon(Icons.qr_code_scanner_rounded),
                      color: Colors.black,
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Obx(
                    () => SizedBox(
                      height: model.pelangganNama.value.isNotEmpty
                          ? MediaQuery.sizeOf(context).height - 329
                          : MediaQuery.sizeOf(context).height - 313,
                      child: ListView(
                        children: [
                          for (var element in listProduct)
                            ProductCard(
                              kode: element["kode_barang"],
                              data: RxMap(element),
                            )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          width: MediaQuery.sizeOf(context).width,
                          child: CustomPaint(
                              painter: DashedPainter(
                                  color: const Color(0xffE4DFD8),
                                  dashPattern: [5, 5])),
                        ),
                        Obx(
                          () => Column(
                            children: [
                              if (model.pelangganNama.value.isNotEmpty)
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Pelanggan :",
                                        style: GoogleFonts.inter(
                                            color: const Color(0xff4F200D),
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        model.pelangganNama.value,
                                        style: GoogleFonts.inter(
                                            color: const Color(0xff4F200D),
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18),
                                      ),
                                    ]),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Total :",
                                      style: GoogleFonts.inter(
                                          color: const Color(0xff4F200D),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18),
                                    ),
                                    Obx(
                                      () => Text(
                                        "Rp ${NumberFormat.decimalPatternDigits(locale: "id", decimalDigits: 0).format(model.totalCost.toInt())}",
                                        style: GoogleFonts.inter(
                                            color: const Color(0xff4F200D),
                                            fontWeight: FontWeight.w800,
                                            fontSize: 18),
                                      ),
                                    )
                                  ]),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        Obx(() =>
            model.inputAmount.value ? const AmountOfProduct() : Container()),
        Obx(() => model.inputKode.value ? const SearchProduct() : Container()),
        Obx(() => model.showCustomer.value ? CustomerModal() : Container())
      ],
    );
  }
}
