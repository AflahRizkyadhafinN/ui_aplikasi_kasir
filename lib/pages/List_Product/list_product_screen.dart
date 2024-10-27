import 'package:aplikasi_kasir/pages/List_Product/components/body.dart';
import 'package:flutter/material.dart';

class ListProductScreen extends StatelessWidget {
  const ListProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}
