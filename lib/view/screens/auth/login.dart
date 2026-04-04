import 'package:souq_al_khamis/core/function/valild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/function/alert.dart';
import '../../widgets/shared/app_button.dart';
import '../../widgets/auth/logo_auth.dart';
import '../../widgets/auth/text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LogeinControllerImp controller = Get.put(LogeinControllerImp());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          '15'.tr, // Sign In
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      // ignore: deprecated_member_use
      body: WillPopScope(
        onWillPop: exitAlert,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Form(
              key: controller.formkey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  const SizedBox(height: 24),
                  const LogoAuth(),
                  const SizedBox(height: 32),
                  Text(
                    '10'.tr, // Welcome Back
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '11'.tr, // Sign in to continue
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey.shade600,
                    ),
                  ),
                  const SizedBox(height: 40),
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
                      myIcon: Icons.lock_outline,
                      myController: controller.password,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: AlignmentDirectional.centerEnd, // 🐛 BUG FIX: RTL Support
                    child: TextButton(
                      onPressed: () {
                        controller.goToForgetpassword();
                      },
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(50, 30),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: Text(
                        '14'.tr, // Forget password
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  AppButton(
                    text: '15'.tr, // Login
                    onPressed: () {
                      controller.login();
                    },
                  ),
                  const SizedBox(height: 24),
                  // Google Sign In visual button
                  _buildGoogleSignInButton(context),
                  const SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('16'.tr, style: TextStyle(color: Colors.grey.shade600)),
                      const SizedBox(width: 4),
                      InkWell(
                        onTap: () {
                          controller.goToSignUp();
                        },
                        borderRadius: BorderRadius.circular(4),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
                          child: Text(
                            '17'.tr,
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
        ),
      ),
    );
  }

  Widget _buildGoogleSignInButton(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Get.snackbar("Notice", "Google Sign in is temporarily unavailable.", snackPosition: SnackPosition.BOTTOM);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.g_mobiledata_rounded, color: Colors.redAccent, size: 32),
              const SizedBox(width: 8),
              Text(
                "Sign in with Google",
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
