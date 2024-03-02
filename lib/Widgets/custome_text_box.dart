import 'package:flutter/material.dart';

class CustomeTextformField extends StatelessWidget {
  final String hintText;
  final bool? obSecure;
  TextEditingController controller = TextEditingController();
  final Widget? suffixIcon;
  String? Function(String?)? validator;
  TextInputAction? textInputAction;
  int? maxLine;
  CustomeTextformField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.obSecure = false,
      this.suffixIcon,
      required this.validator,
      this.maxLine,
      required this.textInputAction,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          maxLines: maxLine,
          textInputAction: textInputAction,
          controller: controller,
          // cursorColor: Colors.black,
          obscureText: obSecure!,
          decoration: InputDecoration(
            hintText: hintText,
            // errorText: errorText,
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(
              fontSize: 14,
            ),
            // fillColor: Colors.grey[200],
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey[200]!,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey[200]!,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey[200]!,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey[200]!,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(
                color: Colors.grey[200]!,
              ),
            ),
          ),
          validator: validator,
        ),
      ],
    );
  }
}
