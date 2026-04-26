import 'package:souq_al_khamis/controller/cart/cartContoller.dart';
import 'package:souq_al_khamis/core/function/translate_database.dart';
import 'package:souq_al_khamis/view/widgets/cart/customthemecart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/cart/customButton.dart';
import '../../widgets/cart/cuttomDivider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    var cartContoller = Get.put(CartController());

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'My Cart'.tr,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GetBuilder<CartController>(
        builder: (controller) => Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              CustomDivider(
                message:
                    'You have added ${cartContoller.numIteamsInCart} items to your cart'
                        .tr,
              ),
              Expanded(
                child: cartContoller.cartIteams.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shopping_cart_outlined,
                                size: 100, color: Colors.grey.shade300),
                            const SizedBox(height: 16),
                            Text('Your cart is empty'.tr,
                                style: TextStyle(
                                    color: Colors.grey.shade500, fontSize: 18)),
                          ],
                        ),
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.only(top: 8, bottom: 24),
                        itemCount: cartContoller.cartIteams.length,
                        itemBuilder: (context, index) => CustomThemeCart(
                          name: tr(cartContoller.cartIteams[index].iteamsName,
                              cartContoller.cartIteams[index].iteamsNameAr),
                          price:
                              '${cartContoller.cartIteams[index].iteamsPrice}',
                          count:
                              '${cartContoller.cartIteams[index].iteamsCount}',
                          urlImage:
                              cartContoller.cartIteams[index].iteamsImage!,
                          onAdd: () {
                            cartContoller.addToCart(
                                cartContoller.cartIteams[index].iteamsId!);
                          },
                          onRemove: () {
                            if (cartContoller.cartIteams.isNotEmpty) {
                              cartContoller.removeFromCart(
                                  cartContoller.cartIteams[index].iteamsId!);
                            }
                          },
                        ),
                      ),
              ),
            ],
          ),
          bottomNavigationBar: controller.cartIteams.isEmpty
              ? null
              : CustomButtonPriceCheckout(
                  order: cartContoller.orderPrice,
                  shipping: cartContoller.shipping,
                  totlaPrice: cartContoller.orderTotalPrice,
                  coupon: cartContoller.couponDiscount,
                  onPressed: () {
                    cartContoller.goToCheckout();
                  },
                  controllerCoupon: cartContoller.controllerCoupon!,
                  applyCoupon: () {
                    cartContoller.couponData();
                  },
                ),
        ),
      ),
    );
  }
}
