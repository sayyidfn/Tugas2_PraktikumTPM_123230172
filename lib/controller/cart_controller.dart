import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/product.dart';

class CartController extends GetxController {
  // Memenuhi kriteria: menyimpan daftar produk menggunakan RxList
  final RxList<Product> cartItems = <Product>[].obs;

  // Getter untuk jumlah item
  int get totalItems => cartItems.length;

  // Memenuhi kriteria: method menghitung total harga
  double get calculateTotalPrice {
    return cartItems.fold(0, (sum, item) => sum + item.price);
  }

  // Memenuhi kriteria: method menambah produk
  void addProduct(Product product) {
    cartItems.add(product);
    Get.rawSnackbar(
      message: 'Sukses menambahkan ${product.title} ke keranjang!',
      backgroundColor: Colors.teal.shade700,
      snackPosition: SnackPosition.TOP,
      borderRadius: 10,
      margin: const EdgeInsets.all(12),
    );
  }

  // Memenuhi kriteria: method menghapus produk
  void removeProduct(Product product) {
    cartItems.remove(product);
    Get.rawSnackbar(
      message: '${product.title} telah dihapus.',
      backgroundColor: Colors.redAccent,
      snackPosition: SnackPosition.TOP,
      borderRadius: 10,
      margin: const EdgeInsets.all(12),
    );
  }
}