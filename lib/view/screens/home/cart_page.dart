import 'package:e_comerse_app/controller/cart/cartContoller.dart';
import 'package:e_comerse_app/core/function/translate_database.dart';
import 'package:e_comerse_app/view/widgets/cart/customthemecart.dart';
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
      appBar: AppBar(
        title: const Text('My Cart'),
      ),
      body: GetBuilder<CartController>(
        builder: (controller) => Scaffold(
          body: ListView(
            children: [
              CustomDivider(
                  message:
                      'you add ${cartContoller.numIteamsInCart} items to cart'),
              const SizedBox(height: 10),
              cartContoller.cartIteams.isEmpty
                  ? const Center(
                      child: Text('no data in cart'),
                    )
                  : Column(
                      children: [
                        ...List.generate(
                          cartContoller.cartIteams.length,
                          (index) => CustomThemeCart(
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
                      ],
                    )
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: CuttomButtonOfCart(
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
