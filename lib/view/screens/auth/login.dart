import 'package:souq_al_khamis/core/function/valild.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/auth/login_controller.dart';
import '../../../core/constant/image_assets.dart';
import '../../../core/function/alert.dart';

import '../../widgets/auth/text_field.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LogeinControllerImp controller = Get.put(LogeinControllerImp());
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: WillPopScope(
        onWillPop: exitAlert,
        child: SafeArea(
          child: Form(
            key: controller.formkey,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                // ── Hero section ──────────────────────────────────
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFF8C00), Color(0xFFE65C00)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Text(
                        'Souq Al Khamis',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.5,
                            ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Your social marketplace',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white70,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Image.asset(
                        AppImageAsset.logo,
                        height: 220,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                ),

                // ── White rounded card ────────────────────────────
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(24),
                    ),
                  ),
                  transform: Matrix4.translationValues(0, -24, 0),
                  padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('10'.tr,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                              )),
                      const SizedBox(height: 4),
                      Text('11'.tr,
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.grey.shade500,
                                  )),
                      const SizedBox(height: 28),

                      // Email field
                      CustomTextField(
                        valid: (val) => checkVaild(val!, 5, 100, 'email'),
                        labelText: '18'.tr,
                        hintText: '12'.tr,
                        myIcon: Icons.email_outlined,
                        myController: controller.email,
                        activeColor: const Color(0xFFE65C00),
                      ),
                      const SizedBox(height: 16),

                      // Password field
                      GetBuilder<LogeinControllerImp>(
                        builder: (controller) => CustomTextField(
                          obscureText: controller.isShowPassword,
                          onTapIcon: controller.showPassword,
                          valid: (val) => checkVaild(val!, 5, 30, 'password'),
                          labelText: '19'.tr,
                          hintText: '13'.tr,
                          myIcon: Icons.lock_outline,
                          myController: controller.password,
                          activeColor: const Color(0xFFE65C00),
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Forgot password
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: TextButton(
                          onPressed: controller.goToForgetpassword,
                          child: Text('14'.tr,
                              style: const TextStyle(
                                color: Color(0xFFE65C00),
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Sign in button
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0xFFFF8C00), Color(0xFFE65C00)],
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ElevatedButton(
                          onPressed: controller.login,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            shadowColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text('15'.tr,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              )),
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Divider
                      Row(children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text('or continue with',
                              style: TextStyle(
                                  color: Colors.grey.shade500, fontSize: 12)),
                        ),
                        const Expanded(child: Divider()),
                      ]),
                      const SizedBox(height: 16),

                      // Google button
                      OutlinedButton.icon(
                        onPressed: () => Get.snackbar(
                          "Notice",
                          "Google Sign in is temporarily unavailable.",
                          snackPosition: SnackPosition.BOTTOM,
                        ),
                        icon: const Icon(Icons.g_mobiledata_rounded,
                            color: Colors.redAccent, size: 28),
                        label: const Text('Sign in with Google'),
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Sign up row
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('16'.tr,
                                style: TextStyle(color: Colors.grey.shade600)),
                            const SizedBox(width: 4),
                            GestureDetector(
                              onTap: controller.goToSignUp,
                              child: Text('17'.tr,
                                  style: const TextStyle(
                                    color: Color(0xFFE65C00),
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ]),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
