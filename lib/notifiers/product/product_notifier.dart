import 'package:hive/hive.dart';
import 'package:riverpod/riverpod.dart';

import '../../modal/product.dart';

class ProductNotifier extends StateNotifier<List<Product>> {
  ProductNotifier() : super([]);

  register(Product product) async {
    await Hive.openBox<Product>('product');
    var product = Hive.box('product');
    product.put("product", product);
    return "Saved successfully";
  }

  getProducts() {
    final getList = Hive.box('product');
    List<Product> productList = getList.get("product");
    state = productList;
  }
}
