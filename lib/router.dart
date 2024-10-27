import 'package:aplikasi_kasir/pages/Dashboard/dashboard_screen.dart';
import 'package:aplikasi_kasir/pages/History_Product/history_product_screen.dart';
import 'package:aplikasi_kasir/pages/List_Customer/list_customer_screen.dart';
import 'package:aplikasi_kasir/pages/List_Employee/list_employee_screen.dart';
import 'package:aplikasi_kasir/pages/List_Product/list_product_screen.dart';
import 'package:aplikasi_kasir/pages/Login/login_screen.dart';
import 'package:aplikasi_kasir/pages/Report_Product/report_product_screen.dart';
import 'package:aplikasi_kasir/pages/Report_Sales/report_sales_screen.dart';
import 'package:aplikasi_kasir/pages/Transaction/transaction_screen.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> router = [
  GetPage(name: "/", page: () => const LoginScreen()),
  GetPage(name: "/dashboard", page: () => const DashboardScreen()),
  GetPage(name: "/transaction", page: () => const TransactionScreen()),
  GetPage(name: "/productreport", page: () => const ReportProductScreen()),
  GetPage(name: "/listproduct", page: () => const ListProductScreen()),
  GetPage(name: "/historyproduct", page: () => const HistoryProductScreen()),
  GetPage(name: "/listemployee", page: () => const ListEmployeeScreen()),
  GetPage(name: "/reportsales", page: () => const ReportSalesScreen()),
  GetPage(name: "/customer", page: () => const ListCustomerScreen()),
];
