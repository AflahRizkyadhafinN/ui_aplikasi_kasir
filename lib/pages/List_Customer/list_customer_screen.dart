import 'package:aplikasi_kasir/pages/List_Customer/components/body.dart';
import 'package:flutter/material.dart';

class ListCustomerScreen extends StatelessWidget {
  const ListCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Body(),
      ),
    );
  }
}
