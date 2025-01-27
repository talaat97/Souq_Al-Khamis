import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../controller/forget_password/verfiyCodeCheckEmailController.dart';
import '../../../../core/constant/colors.dart';
import '../../../widgets/auth/head_text_auth.dart';
import '../../../widgets/auth/subhead_text_auth.dart';
import 'package:pinput/pinput.dart';

class VerfiyCodeCheckEmail extends StatelessWidget {
  const VerfiyCodeCheckEmail({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(VerfiyCodeCheckEmailControllerImp());
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
          child: ListView(
            children: [
              const HeadLineAuth(
                text: 'Verfiy code ',
              ),
              const SubHeadText(
                  text: 'Please enter the code we send to you here !'),
              const SizedBox(height: 30),
              Pinput(
                length: 5,
                showCursor: false,
                defaultPinTheme: PinTheme(
                  width: 50,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColor.primaryColor)),
                  textStyle: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                onCompleted: (String verfiyCodeCheckEmail) {
                  controller.goToResetPassword(verfiyCodeCheckEmail);
                },
              ),
            ],
          ),
        ));
  }
}
