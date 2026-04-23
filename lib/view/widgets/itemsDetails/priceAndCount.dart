import 'package:souq_al_khamis/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/items/itemDtailsController.dart';

class PriceAndCountItems extends StatelessWidget {
  final int count;
  final String price;
  final String discountPrice;
  final VoidCallback? addCount;
  final VoidCallback? removeCount;

  const PriceAndCountItems({
    super.key,
    required this.count,
    required this.price,
    required this.addCount,
    required this.removeCount,
    required this.discountPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Stepper
        Container(
          height: 48,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
                color: Theme.of(context).primaryColor.withOpacity(0.1)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildStepperBtn(context, Icons.remove, removeCount),
              SizedBox(
                width: 40,
                child: GetBuilder<ItemsDetailControllerImp>(
                  builder: (controller) => controller.statusRequest ==
                          StatusRequest.success
                      ? Text(
                          '$count',
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                          textAlign: TextAlign.center,
                        )
                      : const Center(
                          child: SizedBox(
                              height: 20,
                              width: 20,
                              child:
                                  CircularProgressIndicator(strokeWidth: 2))),
                ),
              ),
              _buildStepperBtn(context, Icons.add, addCount),
            ],
          ),
        ),

        // Price
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (discountPrice != price)
              Text(
                '$discountPrice \$',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey.shade500,
                      decoration: TextDecoration.lineThrough,
                      height: 1.0,
                    ),
              ),
            Text(
              '$price \$',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStepperBtn(
      BuildContext context, IconData icon, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Icon(
          icon,
          size: 20,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
