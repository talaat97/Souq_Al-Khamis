import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forget_password/resetPasswordController.dart';
import '../../../../core/function/valild.dart';
import '../../../widgets/auth/custom_button.dart';
import '../../../widgets/auth/head_text_auth.dart';
import '../../../widgets/auth/subhead_text_auth.dart';
import '../../../widgets/auth/text_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Forget Password ',
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
                const HeadLineAuth(
                  text: 'New password ',
                ),
                const SubHeadText(text: 'Enter new password to your account '),
                const SizedBox(height: 20),
                CustomTextField(
                  valid: (val) {
                    return checkVaild(val!, 5, 30, 'password');
                  },
                  labelText: "Password ",
                  hintText: 'new password ',
                  myIcon: Icons.lock_outline_rounded,
                  myController: controller.password,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  valid: (val) {
                    return checkVaild(val!, 5, 30, 'password');
                  },
                  labelText: "Re Password ",
                  hintText: 'enter password agin ',
                  myIcon: Icons.lock_outline_rounded,
                  myController: controller.rePassword,
                ),
                const SizedBox(height: 40),
                CustomButtonInLogeIn(
                  text: 'save ',
                  onTap: () {

                    controller.newPasswordCheck();
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ));
  }
}
