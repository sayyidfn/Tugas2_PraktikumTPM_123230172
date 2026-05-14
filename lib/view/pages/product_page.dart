import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../controller/product_controller.dart';
import '../../routes/app_routes.dart';
import '../../view/widgets/product_card.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final ProductController _productCtrl = Get.find<ProductController>();
  final CartController _cartCtrl = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sayyid Store', style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Sayyid Fakhri Nurjundi - 123230172', style: TextStyle(fontSize: 12)),
          ],
        ),
        actions: [
          // Memenuhi kriteria: Badge dengan Obx()
          Obx(() => Container(
            margin: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Badge(
                label: Text('${_cartCtrl.totalItems}'),
                isLabelVisible: _cartCtrl.totalItems > 0,
                backgroundColor: Colors.orange,
                child: const Icon(Icons.shopping_bag_outlined, size: 28),
              ),
              onPressed: () => Get.toNamed(AppRoutes.cart),
            ),
          )),
        ],
      ),
      body: Obx(() {
        if (_productCtrl.isLoading) {
          return const Center(child: CircularProgressIndicator(color: Colors.teal));
        }
        
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GridView.builder(
            itemCount: _productCtrl.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75, // Mengubah proporsi card
            ),
            itemBuilder: (context, index) {
              final item = _productCtrl.products[index];
              return ProductCard(
                product: item,
                onTap: () => Get.toNamed(AppRoutes.detail, arguments: item),
              );
            },
          ),
        );
      }),
    );
  }
}