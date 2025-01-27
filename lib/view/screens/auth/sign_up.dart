import 'package:e_comerse_app/controller/auth/signup_controller.dart';
import 'package:e_comerse_app/core/class/status_request.dart';
import 'package:e_comerse_app/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/function/valild.dart';
import '../../widgets/auth/custom_button.dart';
import '../../widgets/auth/head_text_auth.dart';
import '../../widgets/auth/subhead_text_auth.dart';
import '../../widgets/auth/text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            '17'.tr,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        body: GetBuilder<SignUpControllerImp>(builder: (controller) {
          return controller.statusRequest == StatusRequest.loading
              ? const Center(child: Text('Liadong...'))
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Form(
                    key: controller.signUpkey,
                    child: ListView(
                      children: [
                        HeadLineAuth(
                          text: '10'.tr,
                        ),
                        SubHeadText(text: '24'.tr),
                        const SizedBox(height: 30),
                        CustomTextField(
                          valid: (val) {
                            return checkVaild(val!, 5, 20, 'username');
                          },
                          labelText: "20".tr,
                          hintText: '23'.tr,
                          myIcon: Icons.person_outline_rounded,
                          myController: controller.username,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          valid: (val) {
                            return checkVaild(val!, 5, 100, 'email');
                          },
                          labelText: "18".tr,
                          hintText: '12'.tr,
                          myIcon: Icons.password_outlined,
                          myController: controller.email,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          valid: (val) {
                            return checkVaild(val!, 11, 11, 'phone');
                          },
                          labelText: "21".tr,
                          hintText: '22'.tr,
                          myIcon: Icons.phone_enabled_outlined,
                          myController: controller.phone,
                          keyboardType: TextInputType.phone,
                        ),
                        const SizedBox(height: 20),
                        CustomTextField(
                          valid: (val) {
                            return checkVaild(val!, 5, 30, 'password');
                          },
                          labelText: "19".tr,
                          hintText: '13'.tr,
                          myIcon: Icons.lock,
                          myController: controller.password,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 40),
                        CustomButtonInLogeIn(
                          text: '17'.tr,
                          onTap: () {
                            controller.signUp();
                          },
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('25'.tr),
                            InkWell(
                              onTap: () {
                                controller.goToLogein();
                              },
                              child: Text(
                                '26'.tr,
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
                );
        }));
  }
}
