import 'package:aplikasi_kasir/components/main_background.dart';
import 'package:aplikasi_kasir/components/navbar.dart';
import 'package:aplikasi_kasir/pages/History_Product/components/history_product_card.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> dummy = [
      "penjualan",
      "pembelian",
      "pembelian",
      "penjualan",
      "penjualan",
      "penjualan",
      "pembelian",
      "penjualan",
      "pembelian",
      "penjualan",
      "penjualan",
      "pembelian",
      "penjualan",
      "pembelian",
      "penjualan",
      "pembelian",
    ];

    return MainBackground(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Navbar(title: "History Barang"),
        Container(
          margin: const EdgeInsets.only(top: 15),
          height: MediaQuery.sizeOf(context).height - 155,
          child: ListView(
            children: [
              for (var i = 0; i < dummy.length; i++)
                HistoryProductCard(type: dummy[i])
            ],
          ),
        )
      ]),
    );
  }
}
