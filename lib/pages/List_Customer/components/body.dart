import 'package:aplikasi_kasir/components/main_background.dart';
import 'package:aplikasi_kasir/components/navbar.dart';
import 'package:aplikasi_kasir/components/search_bar.dart';
import 'package:aplikasi_kasir/pages/List_Customer/components/confirm_modal.dart';
import 'package:aplikasi_kasir/pages/List_Customer/components/customer_card.dart';
import 'package:aplikasi_kasir/pages/List_Customer/components/customer_modal.dart';
import 'package:aplikasi_kasir/pages/List_Customer/components/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    Model model = Get.put(Model());

    RxString confirmModalType = "".obs;
    RxList result = [
      {
        "nama": "Aflah",
        "kodePelanggan": "210050",
        "alamat": "Bandung",
        "nomorTelepon": "210047299123"
      }
    ].obs;
    RxString deleteName = "".obs;
    String idPelanggan = "";

    return Stack(
      children: [
        MainBackground(
          height: MediaQuery.sizeOf(context).height - 77,
          child: Column(
            children: [
              Navbar(
                title: "List Pelanggan",
                addButton: true,
                onTapAddButton: () {
                  model.modalType("add");
                  model.showModalAddData.value = true;
                },
              ),
              const SizedBox(height: 15),
              SearchBarCustom(
                hintText: "Cari Pelanggan",
                onChanged: (value) => {},
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: MediaQuery.sizeOf(context).height - 213,
                child: Obx(
                  () => ListView(
                    children: [
                      for (var data in result)
                        CustomerCard(
                            onTapDelete: () {},
                            onTapEdit: () {
                              model.modalType("edit");
                              model.showModalAddData(true);
                            },
                            onTapLock: () {
                              model.confirmModalShow.value = true;
                              confirmModalType.value = "confirmPassword";
                            },
                            nama: data["nama"],
                            kode: data["kodePelanggan"],
                            alamat: data["alamat"],
                            nomorTelepon: data["nomorTelepon"]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(() => model.showModalAddData.value
            ? CustomerModal(
                idPelanggan: idPelanggan,
                onTapBackdrop: () => model.showModalAddData.value = false,
              )
            : Container()),
        Obx(() => model.confirmModalShow.value
            ? ConfirmModal(
                idPelanggan: idPelanggan,
                name: deleteName.value,
                onTapBackdrop: () => model.confirmModalShow.value = false,
              )
            : Container()),
      ],
    );
  }
}
