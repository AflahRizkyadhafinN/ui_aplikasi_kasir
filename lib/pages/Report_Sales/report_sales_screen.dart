import 'package:aplikasi_kasir/pages/Report_Sales/components/body.dart';
import 'package:flutter/material.dart';

class ReportSalesScreen extends StatelessWidget {
  const ReportSalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
