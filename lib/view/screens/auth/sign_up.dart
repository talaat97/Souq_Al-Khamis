import 'package:souq_al_khamis/controller/auth/signup_controller.dart';
import 'package:souq_al_khamis/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/function/valild.dart';
import '../../widgets/shared/app_button.dart';
import '../../widgets/auth/text_field.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SignUpControllerImp());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          '17'.tr, // Sign Up
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: GetBuilder<SignUpControllerImp>(builder: (controller) {
        return controller.statusRequest == StatusRequest.loading
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Form(
                    key: controller.signUpkey,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        const SizedBox(height: 24),
                        Text(
                          '10'.tr, // Welcome
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '24'.tr, // Sign up with email
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 40),
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
                          myIcon: Icons.email_outlined,
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
                          myIcon: Icons.lock_outline,
                          myController: controller.password,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(height: 40),
                        AppButton(
                          text: '17'.tr, // Sign Up
                          onPressed: () {
                            controller.signUp();
                          },
                        ),
                        const SizedBox(height: 32),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('25'.tr, style: TextStyle(color: Colors.grey.shade600)),
                            const SizedBox(width: 4),
                            InkWell(
                              onTap: () {
                                controller.goToLogein();
                              },
                              borderRadius: BorderRadius.circular(4),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                                child: Text(
                                  '26'.tr, // Login
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  ),
                ),
              );
      }),
    );
  }
}
