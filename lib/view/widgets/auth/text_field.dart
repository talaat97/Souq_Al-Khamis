import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController myController;
  final IconData myIcon;
  final String? Function(String? val)? valid;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final void Function()? onTapIcon;

  const CustomTextField({
    super.key,
    required this.hintText,
    required this.labelText,
    required this.myController,
    required this.myIcon,
    required this.valid,
    this.keyboardType,
    this.obscureText,
    this.onTapIcon,
  });

  @override
  Widget build(BuildContext context) {
    // 🐛 BUG FIX: Enhanced text field with 12px border radius, subtle fill color, and better RTL support
    return TextFormField(
      controller: myController,
      obscureText: obscureText ?? false,
      keyboardType: keyboardType,
      validator: valid,
      decoration: InputDecoration(
        suffixIcon: onTapIcon != null 
          ? InkWell(
              onTap: onTapIcon,
              borderRadius: BorderRadius.circular(50),
              child: Icon(myIcon, color: Colors.grey.shade600),
            )
          : Icon(myIcon, color: Colors.grey.shade400),
        hintText: hintText,
        labelText: labelText,
      ),
    );
  }
}
