import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Repo {
  static Future<bool> addCarDocument(String model, String color, String mfd,
      String wheeltype, List<String> image, String brand) async {
    try {
      final CollectionReference carsCollection =
          FirebaseFirestore.instance.collection('cars');
      await carsCollection.add({
        'model': model,
        'color': color,
        'mfd': mfd,
        'wheeltype': wheeltype,
        'image': image,
        'brand': brand
      });
      return true;
    } catch (error) {
      return false;
    }
  }

  static Future<String> getImageUrl(
    File imageFile,
  ) async {
    String uniqueName = DateTime.now().millisecond.toString();
    final Reference storageReference =
        FirebaseStorage.instance.ref().child('images/$uniqueName');
    final UploadTask uploadTask = storageReference.putFile(imageFile);
    final TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
    final String imageUrl = await snapshot.ref.getDownloadURL();
    return imageUrl;
  }
}
