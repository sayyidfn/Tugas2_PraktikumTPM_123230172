import 'package:get/get.dart';
import '../controller/cart_controller.dart';
import '../controller/product_controller.dart';
import '../view/pages/cart_page.dart';
import '../view/pages/product_detail_page.dart';
import '../view/pages/product_page.dart';
import 'app_routes.dart';

// Memenuhi kriteria: Route dan Binding untuk AppPages
class StoreBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
    Get.put<CartController>(CartController(), permanent: true);
  }
}

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.products,
      page: () => ProductPage(),
      binding: StoreBindings(), // Menggunakan nama binding yang berbeda
    ),
    GetPage(
      name: AppRoutes.detail,
      page: () => ProductDetailPage(),
    ),
    GetPage(
      name: AppRoutes.cart,
      page: () => CartPage(),
    ),
  ];
}