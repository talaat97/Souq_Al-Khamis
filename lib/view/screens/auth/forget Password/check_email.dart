import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forget_password/checkEmailController.dart';
import '../../../../core/function/valild.dart';
import '../../../widgets/auth/custom_button.dart';
import '../../../widgets/auth/head_text_auth.dart';
import '../../../widgets/auth/subhead_text_auth.dart';
import '../../../widgets/auth/text_field.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckPasswordControllerImp controller =
        Get.put(CheckPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '14'.tr,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.grey),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
          child: Form(
            key: controller.formkey,
            child: ListView(
              children: [
                HeadLineAuth(
                  text: '27'.tr,
                ),
                SubHeadText(text: '29'.tr),
                const SizedBox(height: 30),
                const SizedBox(height: 20),
                CustomTextField(
                  valid: (val) {
                    return checkVaild(val!, 5, 100, 'email');
                  },
                  labelText: "12".tr,
                  hintText: '18'.tr,
                  myIcon: Icons.email_outlined,
                  myController: controller.email,
                ),
                const SizedBox(height: 40),
                CustomButtonInLogeIn(
                  text: '30'.tr,
                  onTap: () {
                    controller.emailCheck();
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
