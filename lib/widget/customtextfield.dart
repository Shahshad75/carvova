import 'package:carnova/resource/const/fontstyle.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatelessWidget {
  String hint;
  bool isSufix;
  TextEditingController controller;
  TextInputType? keybordtype;
  bool? visiblity = true;
  Widget? suffixIcon;
  String? Function(String?)? validator;
  CustomTextfield(
      {super.key,
      this.validator,
      this.visiblity,
      this.keybordtype,
      required this.hint,
      required this.isSufix,
      required this.controller,
      this.suffixIcon});

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    if (isSufix == false) {
      obscureText = false;
    }
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
            height: MediaQuery.sizeOf(context).height / 15,
            width: double.maxFinite,
            child: TextFormField(
              validator: validator,
              readOnly: visiblity ?? false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: controller,
              textInputAction: TextInputAction.next,
              keyboardType: keybordtype,
              style: CustomFontStyles.hintstyleOne,
              decoration: InputDecoration(
                suffixIcon: suffixIcon,
                isDense: true,
                border: const OutlineInputBorder(),
                fillColor: Colors.transparent,
                filled: true,
                label: Text(hint),
                labelStyle: CustomFontStyles.hintstyleOne,
                errorBorder: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black)),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(color: Colors.black, width: 1),
                ),
                hintText: hint,
                hintStyle: CustomFontStyles.hintstyleOne,
              ),
            )));
  }
}
