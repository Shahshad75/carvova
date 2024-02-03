import 'package:carnova/model/vehicle_model.dart';
import 'package:carnova/view/detail_screen.dart';
import 'package:flutter/material.dart';

class CarTile extends StatelessWidget {
  const CarTile({
    super.key,
    required this.details,
  });
  final Vehicle details;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => CarDataShow(
                    vehicleData: details,
                  )));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
            height: media.height * 0.2,
            child: Row(
              children: [
                Container(
                  width: media.width * 0.35,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(details.images.first),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                    child: Container(
                  padding: const EdgeInsets.only(left: 12, top: 9, bottom: 9),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        details.brand,
                        maxLines: 1,
                        style: const TextStyle(
                            fontFamily: "outfit",
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 78, 78, 78)),
                      ),
                      Text(
                        details.model.toString(),
                        maxLines: 1,
                        style: const TextStyle(
                            fontFamily: "outfit",
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color.fromARGB(255, 78, 78, 78)),
                      ),
                      Row(
                        children: [
                          const Text(
                            "Wheeltype:",
                            style: TextStyle(
                                fontFamily: "outfit",
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 78, 78, 78)),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            details.wheeltype,
                            maxLines: 1,
                            style: const TextStyle(
                                fontFamily: "outfit",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 78, 78, 78)),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Row(
                        children: [
                          const Text(
                            " Color:",
                            style: TextStyle(
                                fontSize: 14,
                                fontFamily: "outfit",
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 78, 78, 78)),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            details.color,
                            maxLines: 1,
                            style: const TextStyle(
                                fontSize: 12,
                                fontFamily: "outfit",
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 78, 78, 78)),
                          ),
                        ],
                      ),
                      Text("MFD :  ${details.mfd}",
                          maxLines: 1,
                          style: const TextStyle(
                              fontFamily: "outfit",
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 78, 78, 78))),
                    ],
                  ),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
