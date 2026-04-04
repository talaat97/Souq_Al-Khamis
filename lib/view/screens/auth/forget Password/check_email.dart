import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forget_password/checkEmailController.dart';
import '../../../../core/function/valild.dart';
import '../../../widgets/shared/app_button.dart';
import '../../../widgets/auth/text_field.dart';

class CheckEmail extends StatelessWidget {
  const CheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    CheckPasswordControllerImp controller = Get.put(CheckPasswordControllerImp());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          '14'.tr, // Forget Password
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
                _buildStepIndicator(context, 1), // Step 1
                const SizedBox(height: 48),
                Text(
                  '27'.tr, // Check Email
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '29'.tr, // Please Enter Email Address
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 48),
                CustomTextField(
                  valid: (val) {
                    return checkVaild(val!, 5, 100, 'email');
                  },
                  labelText: "12".tr,
                  hintText: '18'.tr,
                  myIcon: Icons.email_outlined,
                  myController: controller.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 40),
                AppButton(
                  text: '30'.tr, // Check
                  onPressed: () {
                    controller.emailCheck();
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
