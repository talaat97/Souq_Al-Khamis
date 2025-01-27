import 'package:e_comerse_app/core/class/status_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/colors.dart';

import 'package:pinput/pinput.dart';

import '../../../controller/auth/verfiyCodeSignUpControllerImp.dart';
import '../../widgets/auth/custom_button.dart';
import '../../widgets/auth/head_text_auth.dart';
import '../../widgets/auth/subhead_text_auth.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerfiyCodeSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Verfiy Code  ',
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(color: Colors.grey),
          ),
        ),
        body: GetBuilder<VerfiyCodeSignUpControllerImp>(
          builder: (controller) => controller.statusRequest ==
                  StatusRequest.loading
              ? const Center(child: Text('Loading...'))
              : Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: ListView(
                    children: [
                      const HeadLineAuth(
                        text: 'Check code ',
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
                              border:
                                  Border.all(color: AppColor.primaryColor)),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        onCompleted: (String verficationCode) {
                          controller.goToSuccessSignUp(verficationCode);
                        },
                      ),
                      const SizedBox(height: 50),
                      CustomButtonInLogeIn(
                        text: 'resend virify code',
                        onTap: () {
                              controller.reSend();
                        },
                      )
                    ],
                 ),
                ),
        ));
  }
}
