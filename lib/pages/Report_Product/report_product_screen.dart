import 'package:aplikasi_kasir/pages/Report_Product/components/body.dart';
import 'package:flutter/material.dart';

class ReportProductScreen extends StatelessWidget {
  const ReportProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
