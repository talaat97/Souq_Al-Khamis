import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forget_password/resetPasswordController.dart';
import '../../../../core/function/valild.dart';
import '../../../widgets/shared/app_button.dart';
import '../../../widgets/auth/text_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Forget Password'.tr, // 🐛 BUG FIX: Localization mapping key requirement 
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Form(
            key: controller.formkey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 24),
                _buildStepIndicator(context, 3), // Step 3
                const SizedBox(height: 48),
                Text(
                  'New password'.tr, // 🐛 BUG FIX: Translated strings mapping
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter new password to your account'.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 48),
                CustomTextField(
                  valid: (val) {
                    return checkVaild(val!, 5, 30, 'password');
                  },
                  labelText: "Password".tr,
                  hintText: 'new password'.tr,
                  myIcon: Icons.lock_outline_rounded,
                  myController: controller.password,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  valid: (val) {
                    return checkVaild(val!, 5, 30, 'password');
                  },
                  labelText: "Re Password".tr,
                  hintText: 'enter password again'.tr,
                  myIcon: Icons.lock_outline_rounded,
                  myController: controller.rePassword,
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                AppButton(
                  text: 'save'.tr,
                  onPressed: () {
                    controller.newPasswordCheck();
                  },
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepIndicator(BuildContext context, int currentStep) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        bool isActive = index <= currentStep - 1;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: isActive ? 24 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: isActive ? Theme.of(context).primaryColor : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      }),
    );
  }
}
