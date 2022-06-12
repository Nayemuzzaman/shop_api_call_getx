import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shop_api_call_getx/controllers/product_controller.dart';
import 'package:shop_api_call_getx/views/productTitle.dart';

class MyHomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

   MyHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Expanded(
                  child: Text(
                    'Shop Api',
                    style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'avenir',
                        fontWeight: FontWeight.w900),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.view_list_rounded),
                ),
                IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view))
              ],
            ),
          ),
          Expanded(child: Obx(() {
            if (productController.isLoading.value) {
              return const Center(
                   child: CircularProgressIndicator(),
                  );
            } else {
              return StaggeredGridView.countBuilder(
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                crossAxisCount: 2,
                itemCount: productController.productList.length,
                itemBuilder: (context, index) {
                  return ProductTile(productController.productList[index]);
                },
                staggeredTileBuilder: (index) => const StaggeredTile.fit(1),
              );
            }
          })),
        ],
      ),
    );
  }
}
