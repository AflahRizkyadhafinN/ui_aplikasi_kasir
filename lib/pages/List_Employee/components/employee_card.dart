import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard(
      {super.key,
      required this.nama,
      required this.nip,
      required this.password,
      required this.role,
      required this.onTapEdit,
      required this.onTapDelete,
      required this.onTapLock});

  final String nama;
  final String password;
  final String nip;
  final String role;
  final Function() onTapEdit;
  final Function() onTapDelete;
  final Function() onTapLock;

  @override
  Widget build(BuildContext context) {
    RxBool openInfo = false.obs;
    RxBool showPassword = false.obs;

    TableRow tableProperty(String label, String value) {
      return TableRow(children: [
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.top,
            child: Container(
              margin: const EdgeInsets.only(right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.inter(
                        color: const Color(0xff4F200D),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    ":",
                    style: GoogleFonts.inter(
                        color: const Color(0xff4F200D),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            )),
        TableCell(
            verticalAlignment: TableCellVerticalAlignment.middle,
            child: label == "Password"
                ? GestureDetector(
                    onTap: onTapLock,
                    child: Row(
                      children: [
                        Text(
                          value,
                          style: GoogleFonts.inter(
                              color: const Color(0xff4F200D),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(width: 5),
                        Icon(
                          showPassword.value
                              ? Icons.lock_open_outlined
                              : Icons.lock_outline,
                          color: const Color(0xff4F200D),
                          size: 20,
                        )
                      ],
                    ),
                  )
                : Text(
                    value,
                    style: GoogleFonts.inter(
                        color: const Color(0xff4F200D),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                  ))
      ]);
    }

    return Obx(
      () => Column(
        children: [
          GestureDetector(
            onTap: () => {openInfo.value = !openInfo.value},
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.sizeOf(context).width,
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  color: const Color(0xffFEDEAA),
                  border: Border(
                      top: const BorderSide(color: Color(0xff4F200D)),
                      left: const BorderSide(color: Color(0xff4F200D)),
                      right: const BorderSide(color: Color(0xff4F200D)),
                      bottom: openInfo.value
                          ? BorderSide.none
                          : const BorderSide(color: Color(0xff4F200D))),
                  borderRadius: BorderRadius.vertical(
                      top: const Radius.circular(5),
                      bottom: Radius.circular(openInfo.value ? 0 : 5))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.inter(
                        color: const Color(0xff4F200D),
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    nip,
                    style: GoogleFonts.inter(
                        color: const Color(0xff4F200D),
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          ),
          Obx(() => openInfo.value
              ? Table(
                  border: TableBorder.all(
                      color: const Color(0xff4F200D),
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(5))),
                  columnWidths: const {1: FixedColumnWidth(50)},
                  children: [
                    TableRow(
                        decoration:
                            const BoxDecoration(color: Color(0xffFFEDCF)),
                        children: [
                          TableCell(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              width: MediaQuery.sizeOf(context).width - 144,
                              child: Table(
                                columnWidths: const {0: FixedColumnWidth(80)},
                                children: [
                                  tableProperty("Nama", nama),
                                  tableProperty("NIP", nip),
                                  tableProperty("Role", role),
                                  const TableRow(children: [Text(""), Text("")])
                                ],
                              ),
                            ),
                          ),
                          TableCell(
                            verticalAlignment:
                                TableCellVerticalAlignment.middle,
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: onTapEdit,
                                  child: SvgPicture.asset(
                                    "assets/icons/contract_edit.svg",
                                    width: 25,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  onTap: onTapDelete,
                                  child: SvgPicture.asset(
                                    "assets/icons/contract_delete.svg",
                                    width: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ])
                  ],
                )
              : Container()),
        ],
      ),
    );
  }
}
