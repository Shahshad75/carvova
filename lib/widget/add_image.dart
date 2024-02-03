import 'package:carnova/widget/text_widget.dart/subtile.dart';
import 'package:flutter/material.dart';

class AddImage extends StatelessWidget {
  const AddImage({super.key,required this.onTap});
 final  void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return InkWell(
      onTap:onTap ,
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: BoxDecoration(
            image: const DecorationImage(
                image: AssetImage("assets/bck.jpg"), fit: BoxFit.cover),
            color: Colors.black26,
            borderRadius: BorderRadius.circular(10)),
        height: height / 9,
        width: width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Icon(
              Icons.camera_alt,
              size: 35,
              color: Colors.white,
            ),
            TitleTexts(
                text: 'ADD YOUR VEHICLE IMAGES', size: 19, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
