import 'package:demo/api/doc.dart';
import 'package:demo/model/product_model.dart';
import 'package:demo/pages/detailsPage.dart';
import 'package:demo/pages/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  RxList<Product> productList = <Product>[].obs;

  DocApi docApi = Get.put(DocApi());

  getProductList() async {
    productList.value = await docApi.getData();
  }

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: GetBuilder<DocApi>(builder: (context) {
        getProductList();
        return GridView.builder(
          itemCount: productList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) {
            Product product = productList[index];

            return GestureDetector(
                onTap: () {
                  Get.to(() => DetailPage(
                      title: product.title,
                      desc: product.description,
                      price: product.price.toString(),
                      image: product.image));
                },
                child: CardListItem(
                    title: product.title,
                    price: product.price.toString(),
                    image: product.image));
          },
        );
      }),
    );
  }
}
