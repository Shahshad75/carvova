import 'package:flutter/material.dart';

class CarDetailsCard extends StatelessWidget {
  const CarDetailsCard({super.key, required this.cardetails});
  final List cardetails;
  @override
  Widget build(BuildContext context) {
    List<IconData> iconsCustom = [
      Icons.local_taxi,
      Icons.brightness_auto_rounded,
      Icons.date_range,
      Icons.flag_circle_outlined,
      Icons.color_lens
    ];
    return SizedBox(
      height: 80,
      width: double.infinity,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(2),
            width: 100,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  iconsCustom[index],
                  color: Colors.black,
                ),
                const SizedBox(height: 5),
                Text(cardetails[index],
                    maxLines: 1,
                    style: const TextStyle(fontSize: 16, fontFamily: "outfit"))
              ],
            ),
          );
        },
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: iconsCustom.length,
      ),
    );
  }
}
