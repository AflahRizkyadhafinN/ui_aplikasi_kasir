import 'package:aplikasi_kasir/pages/History_Product/components/body.dart';
import 'package:flutter/material.dart';

class HistoryProductScreen extends StatelessWidget {
  const HistoryProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
