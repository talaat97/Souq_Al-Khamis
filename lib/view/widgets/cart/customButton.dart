import 'package:souq_al_khamis/controller/cart/cartContoller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../shared/app_button.dart';

class CuttomButtonOfCart extends StatelessWidget {
  final double order;
  final double coupon;
  final double shipping;
  final double totlaPrice;
  final void Function()? onPressed;
  final TextEditingController controllerCoupon;
  final void Function()? applyCoupon;

  const CuttomButtonOfCart({
    super.key,
    required this.order,
    required this.shipping,
    required this.totlaPrice,
    required this.onPressed,
    required this.controllerCoupon,
    this.applyCoupon,
    required this.coupon,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => Container(
        padding: const EdgeInsetsDirectional.fromSTEB(24, 16, 24, 24),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, -4),
              blurRadius: 16,
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Coupon Field
            if (controller.couponName == null)
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: controllerCoupon,
                      decoration: InputDecoration(
                        hintText: 'Enter Coupon Code'.tr,
                        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: applyCoupon,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                    ),
                    child: Text('Apply'.tr, style: const TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              )
            else
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.check_circle_rounded, color: Colors.green, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Code: ${controller.couponName} applied',
                      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            
            const SizedBox(height: 24),
            
            // Breakdown
            _buildPriceRow(context, 'Subtotal'.tr, '$order \$'),
            const SizedBox(height: 8),
            _buildPriceRow(context, 'Discount'.tr, '-$coupon %', color: Colors.green),
            const SizedBox(height: 8),
            _buildPriceRow(context, 'Shipping'.tr, '$shipping \$'),
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(height: 1),
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total'.tr,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '$totlaPrice \$',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            AppButton(
              text: 'Checkout'.tr,
              onPressed: onPressed ?? () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceRow(BuildContext context, String label, String value, {Color? color}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.grey.shade600,
          ),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: color ?? Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ],
    );
  }
}
