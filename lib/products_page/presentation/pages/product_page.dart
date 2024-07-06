/*
**********Project Name: nutrimd
**********File Name: product_page
**********Created At: 01-Jul-24 5:33 PM
**********Author: Abdelrhman Hussein
**********Description: 
*/

import 'package:flutter/material.dart';
import 'package:nutrimd/core/utils/app_colors.dart';
import 'package:nutrimd/core/widgets/back_button.dart';
import 'package:nutrimd/home_page/presentation/manager/qr_controller.dart';
import 'package:nutrimd/products_page/presentation/widgets/product_page_data.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key, required this.productData, required this.productStatues});

  final bool productStatues;
  final Map<String, dynamic> productData;

  int tabButtonClicked = 0;
  PageController productPageView = PageController(initialPage: 0);

  QrScannerController qrScannerController = QrScannerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.fifthColor,
      body: SafeArea(
        child: Column(
          children: [
            const MyBackButton(),
            if (!productStatues)
              StatefulBuilder(
                builder: (context, setState) => Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if(tabButtonClicked == 1) {
                            tabButtonClicked = 0;
                            productPageView.previousPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            );
                          }
                        });
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width / 2 - 16,
                        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: tabButtonClicked == 0? AppColors.secondColor : AppColors.fourthColor,
                        ),
                        child: Text(
                          "Scanned",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.fifthColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if(tabButtonClicked == 0) {
                            tabButtonClicked = 1;
                            productPageView.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            );
                          }
                        });
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width / 2 - 16,
                        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: tabButtonClicked == 1? AppColors.secondColor : AppColors.fourthColor,
                        ),
                        child: Text(
                          "Recommended",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.fifthColor,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: PageView(
                controller: productPageView,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ProductPageData(
                    productStatues: productStatues,
                    productData: productData,
                  ),

                  if (!productStatues)
                  ProductPageData(
                    productStatues: true,
                    productData: qrScannerController.recommendedProductData,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
