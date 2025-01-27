import 'package:e_comerse_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/forget_password/success_password._controller.dart';
import '../../../widgets/auth/custom_button.dart';
import '../../../widgets/auth/subhead_text_auth.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(SuccessPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Well done !',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Text(
              textAlign: TextAlign.center,
              ' Success reset password ',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.grey),
            ),
            const Center(
              child: Icon(
                Icons.check_circle_outline_rounded,
                size: 300,
                color: AppColor.primaryColor,
              ),
            ),
            const SubHeadText(text: 'well done '),
            const SubHeadText(text: 'Congratolitation !'),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: CustomButtonInLogeIn(
                onTap: () {
                  controller.goToLogin();
                },
                text: 'Loge in',
              ),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
