import 'package:aplikasi_kasir/components/main_background.dart';
import 'package:aplikasi_kasir/components/navbar.dart';
import 'package:aplikasi_kasir/components/search_bar.dart';
import 'package:aplikasi_kasir/pages/List_Employee/components/confirm_modal.dart';
import 'package:aplikasi_kasir/pages/List_Employee/components/employee_card.dart';
import 'package:aplikasi_kasir/pages/List_Employee/components/employee_modal.dart';
import 'package:aplikasi_kasir/pages/List_Employee/components/model.dart';
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
        "idPetugas": "1231",
        "kodePetugas": "1234",
        "nama": "Rizky",
        "password": "iki",
        "role": "Admin"
      }
    ].obs;
    RxString deleteName = "".obs;
    String idAkun = "";

    return Stack(
      children: [
        MainBackground(
          height: MediaQuery.sizeOf(context).height - 77,
          child: Column(
            children: [
              Navbar(
                title: "List Pegawai",
                addButton: true,
                onTapAddButton: () {
                  model.modalType("add");
                  model.showModalAddData.value = true;
                },
              ),
              const SizedBox(height: 15),
              SearchBarCustom(
                hintText: "Cari Pegawai",
                onChanged: (value) => {},
              ),
              Container(
                margin: const EdgeInsets.only(top: 10),
                height: MediaQuery.sizeOf(context).height - 213,
                child: Obx(
                  () => ListView(
                    children: [
                      for (var data in result)
                        EmployeeCard(
                            onTapDelete: () {
                              model.confirmModalShow.value = true;
                              confirmModalType.value = "delete";
                            },
                            onTapEdit: () {
                              model.modalType("edit");
                              model.showModalAddData(true);
                            },
                            onTapLock: () {
                              model.confirmModalShow.value = true;
                              confirmModalType.value = "confirmPassword";
                            },
                            nama: data["nama"],
                            nip: data["kodePetugas"],
                            password: data["password"],
                            role: data["role"]),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Obx(() => model.showModalAddData.value
            ? EmployeeModal(
                idAkun: idAkun,
                onTapBackdrop: () => model.showModalAddData.value = false,
              )
            : Container()),
        Obx(() => model.confirmModalShow.value
            ? ConfirmModal(
                idAkun: idAkun,
                name: deleteName.value,
                type: confirmModalType.value,
                onTapBackdrop: () => model.confirmModalShow.value = false,
              )
            : Container()),
      ],
    );
  }
}
