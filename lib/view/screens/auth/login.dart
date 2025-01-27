import 'package:e_comerse_app/core/constant/colors.dart';
import 'package:e_comerse_app/core/function/valild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/function/alert.dart';
import '../../widgets/auth/custom_button.dart';
import '../../widgets/auth/head_text_auth.dart';
import '../../widgets/auth/logo_auth.dart';
import '../../widgets/auth/subhead_text_auth.dart';
import '../../widgets/auth/text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LogeinControllerImp controller = Get.put(LogeinControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sign In ',
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
          onWillPop: exitAlert,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            child: Form(
              key: controller.formkey,
              child: ListView(
                children: [
                  const LogoAuth(),
                  HeadLineAuth(
                    text: '10'.tr,
                  ),
                  SubHeadText(text: '11'.tr),
                  const SizedBox(height: 30),
                  CustomTextField(
                    valid: (val) {
                      return checkVaild(val!, 5, 100, 'email');
                    },
                    labelText: "18".tr,
                    hintText: '12'.tr,
                    myIcon: Icons.email_outlined,
                    myController: controller.email,
                  ),
                  const SizedBox(height: 20),
                  GetBuilder<LogeinControllerImp>(
                    builder: (controller) => CustomTextField(
                      obscureText: controller.isShowPassword,
                      onTapIcon: () {
                        controller.showPassword();
                      },
                      valid: (val) {
                        return checkVaild(val!, 5, 30, 'password');
                      },
                      labelText: "19".tr,
                      hintText: '13'.tr,
                      myIcon: Icons.password_outlined,
                      myController: controller.password,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () {
                        controller.goToForgetpassword();
                      },
                      child: Text(
                        '14'.tr,
                        textAlign: TextAlign.end,
                        style: const TextStyle(color: AppColor.primaryColor),
                      ),
                    ),
                  ),
                  CustomButtonInLogeIn(
                    text: '15'.tr,
                    onTap: () {
                      controller.login();
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('16'.tr),
                      InkWell(
                        onTap: () {
                          controller.goToSignUp();
                        },
                        child: Text(
                          '17'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .copyWith(color: AppColor.primaryColor),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}
