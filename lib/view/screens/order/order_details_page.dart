import 'package:souq_al_khamis/controller/order/orderDetailsController.dart';
import 'package:souq_al_khamis/core/class/handling_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var pageController = Get.put(Orderdetailscontroller());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text('details'.tr,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: GetBuilder<Orderdetailscontroller>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            physics: const BouncingScrollPhysics(),
            children: [
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                color: Theme.of(context).cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'items_summary'.tr,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Divider(height: 24),
                      Table(
                        columnWidths: const {
                          0: FlexColumnWidth(2),
                          1: FlexColumnWidth(1),
                          2: FlexColumnWidth(1),
                        },
                        children: [
                          TableRow(
                            children: [
                              _buildTableHeader(context, 'item_label'.tr),
                              _buildTableHeader(context, 'item_qty'.tr, align: TextAlign.center),
                              _buildTableHeader(context, 'item_price'.tr, align: TextAlign.end),
                            ]
                          ),
                          const TableRow(children: [SizedBox(height: 12), SizedBox(height: 12), SizedBox(height: 12)]),
                          ...List.generate(
                            pageController.orderDetailsList.length,
                            (index) => TableRow(
                              children: [
                                _buildTableCell(context, pageController.orderDetailsList[index].iteamsName!),
                                _buildTableCell(context, pageController.orderDetailsList[index].countItems!.toString(), align: TextAlign.center),
                                _buildTableCell(context, '${pageController.itemPriceDiscount(
                                  double.parse(pageController.orderDetailsList[index].iteamsPrice!),
                                  double.parse(pageController.orderDetailsList[index].iteamsDiscount!),
                                )}\$', align: TextAlign.end, isBold: true),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                  side: BorderSide(color: Colors.grey.shade200),
                ),
                color: Theme.of(context).primaryColor.withOpacity(0.05),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'total_price'.tr,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${pageController.orderModel.orderTotalPrice}\$',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (pageController.orderModel.orderType == '0')
                Card(
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: Colors.grey.shade200),
                  ),
                  color: Theme.of(context).cardColor,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'shipping_address'.tr,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Divider(height: 24),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.location_on_rounded, color: Theme.of(context).primaryColor, size: 28),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${pageController.orderModel.addressName}, ${pageController.orderModel.addressCity}',
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    '${pageController.orderModel.addressStreet}',
                                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        if (pageController.orderModel.orderAddress == '1' && pageController.cameraPosition != null) ...[
                          const SizedBox(height: 16),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: SizedBox(
                              height: 200,
                              width: double.infinity,
                              child: GoogleMap(
                                mapType: MapType.normal,
                                initialCameraPosition: pageController.cameraPosition ?? const CameraPosition(target: LatLng(0,0)),
                                onMapCreated: (GoogleMapController controllerMap) {
                                  pageController.googleMapController!.complete(controllerMap);
                                },
                                markers: pageController.marker.toSet(),
                                myLocationEnabled: false,
                                zoomControlsEnabled: false,
                              ),
                            ),
                          )
                        ],
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTableHeader(BuildContext context, String text, {TextAlign align = TextAlign.start}) {
    return Text(
      text,
      textAlign: align,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        color: Colors.grey.shade600,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTableCell(BuildContext context, String text, {TextAlign align = TextAlign.start, bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        text,
        textAlign: align,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: isBold ? Theme.of(context).primaryColor : Colors.black87,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
