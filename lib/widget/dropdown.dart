import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:carnova/resource/const/fontstyle.dart';
import 'package:carnova/resource/const/static.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDownWid extends StatefulWidget {
  DropDownWid(
      {super.key,
      required this.listIndex,
      required this.controller,
      required this.titletext,
      required this.hinttext});
  final int listIndex;
  final String titletext;
  final String hinttext;
  final TextEditingController controller;
  List<dynamic>? mainList = [
    StaticData.fuelList,
    StaticData.transList,
    StaticData.wheeltype,
    StaticData.brand
  ];
  @override
  State<DropDownWid> createState() => _DropDownWidState();
}
class _DropDownWidState extends State<DropDownWid> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Text(
          widget.titletext,
         style: CustomFontStyles.tabcardtext1,
        ),
        const SizedBox(height: 8),
        CustomDropdown(
           selectedStyle: CustomFontStyles.hintstyleOne,
          hintText: widget.hinttext,
            hintStyle: CustomFontStyles.hintstyleOne,
          items: widget.mainList?[widget.listIndex],
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
          controller: widget.controller,
          excludeSelected: false,
          listItemBuilder: (context, result) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  result,
                ),
                const Icon(Icons.circle_outlined)
              ],
            );
          },
        ),
      ],
    );
  }
}
