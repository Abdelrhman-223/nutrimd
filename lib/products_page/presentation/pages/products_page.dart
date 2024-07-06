/*
**********Project Name: nutrimd
**********File Name: products_page
**********Created At: 06-May-24 10:14 AM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nutrimd/core/widgets/page_separator.dart';
import 'package:nutrimd/core/components/product_field.dart';
import 'package:nutrimd/main.dart';
import 'package:nutrimd/products_page/data/data_sources/product_api_manager.dart';

import '../../../core/styles/dividers.dart';
import '../../../products_data.dart';

class ProductsPage extends StatefulWidget {
  ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  ProductApiManager productApiManager = ProductApiManager();
  @override
  void initState() {
    productApiManager.buyedProduct({"user_id":sharedPreferences.getString("userId")});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(16),
      children: [
        /*const PageSeparator(separatorTitle: "Recommended Products"),
        spaceVertical8(),
        SizedBox(
          height: 182,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemExtent: MediaQuery.of(context).size.width - 32,
            itemCount: recommendedProducts.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProductField(
                productName: recommendedProducts[index]["productName"],
                productIngredient: recommendedProducts[index]["productIngredient"],
                calsValue: recommendedProducts[index]["calsValue"],
                carpValue: recommendedProducts[index]["carpValue"],
                proteinValue: recommendedProducts[index]["proteinValue"],
                fatsValue: recommendedProducts[index]["fatsValue"],
                activeFieldButton: true,
                fieldButtonTitle: "Buy",
              ),
            ),
          ),
        ),*/
        const PageSeparator(separatorTitle: "Purchase"),
        spaceVertical16(),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: purchased.length,
          itemBuilder: (context, index) => ProductField(
            productName: purchased[index]["productName"],
            productIngredient: purchased[index]["productIngredient"],
            calsValue: purchased[index]["calsValue"].toString(),
            carpValue: purchased[index]["carpValue"].toString(),
            proteinValue: purchased[index]["proteinValue"].toString(),
            fatsValue: purchased[index]["fatsValue"].toString(),
            activeFieldButton: true,
            fieldButtonTitle: "Use",
          ),
        ),
      ],
    );
  }
}
