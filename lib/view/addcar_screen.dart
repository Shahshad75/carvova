// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:carnova/bloc/vehicle_bloc.dart';
import 'package:carnova/resource/func/imagepicker.dart';
import 'package:carnova/resource/snacbars/snackbar.dart';
import 'package:carnova/view/home_page.dart';
import 'package:carnova/widget/add_image.dart';
import 'package:carnova/widget/custombutton.dart';
import 'package:carnova/widget/customtextfield.dart';
import 'package:carnova/widget/datepicker.dart';
import 'package:carnova/widget/dropdown.dart';
import 'package:carnova/widget/group_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class AddVehicle extends StatelessWidget {
  AddVehicle({
    Key? key,
  }) : super(key: key);

  final TextEditingController _brandController = TextEditingController();

  final TextEditingController _modalController = TextEditingController();

  final TextEditingController manufactDateController = TextEditingController();

  final TextEditingController _wheelTypeController = TextEditingController();

  final TextEditingController colorController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add your vehicle",
          style: GoogleFonts.outfit(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextfield(
                  hint: 'Modal',
                  isSufix: false,
                  controller: _modalController,
                  keybordtype: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),

                BlocListener<VehicleBloc, VehicleState>(
                  listener: (context, state) {
                    if (state is DatepickerState) {
                      manufactDateController.text = state.date;
                    }
                  },
                  child: CustomTextfield(
                    hint: 'Manifacturing Year',
                    isSufix: true,
                    keybordtype: TextInputType.none,
                    controller: manufactDateController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                        onPressed: () {
                          DatePickerFun.getTimeFromUser(context);
                        },
                        icon: const Icon(
                          Icons.calendar_month,
                          size: 22,
                        )),
                  ),
                ),

                CustomTextfield(
                  hint: 'Vehicle Color',
                  isSufix: false,
                  controller: colorController,
                  keybordtype: TextInputType.name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                DropDownWid(
                  listIndex: 2,
                  controller: _wheelTypeController,
                  titletext: "WheelType",
                  hinttext: "Choose wheeltype",
                ),
                DropDownWid(
                    listIndex: 3,
                    controller: _brandController,
                    titletext: "Car Brand",
                    hinttext: "Select Your Vehicle Brand"),
                const SizedBox(height: 10),

                BlocListener<VehicleBloc, VehicleState>(
                  listener: (context, state) {
                    if (state is ImagelimitedState) {
                      Snackbars.showSnackBar(context, "You reached limit");
                    }
                  },
                  child: AddImage(onTap: () async {
                    String? file = await ImagePickService.pickCropImage(
                        cropAspectRatio:
                            const CropAspectRatio(ratioX: 16, ratioY: 9),
                        imageSource: ImageSource.gallery);
                    if (file != null) {
                      context
                          .read<VehicleBloc>()
                          .add(AddImageEvent(image: File(file)));
                    }
                  }),
                ),

                //group image (grid view)
                GroupImages(),
                BlocListener<VehicleBloc, VehicleState>(
                  listener: (context, state) {
                    if (state is DetailsAddedSucessfullyState) {
                      showSuccessDialog(context);
                    } else if (state is DetaialAddedFailedState) {
                      Snackbars.showSnackBar(
                          context, "Something missing please try again");
                    } else if (state is ErrorNotSelectPicState) {
                      Snackbars.showSnackBar(context, "Add image");
                    }
                  },
                  child: MyLoadingButton(
                    title: "NEXT",
                    isLoading: false,
                    onTap: () {
                      submitForm(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<VehicleBloc>().add(AddCarDetailsEvent(
          color: colorController.text.trim(),
          model: _modalController.text.trim(),
          wheelTypr: _wheelTypeController.text.trim(),
          vehicleBrand: _brandController.text.trim()));
    }
  }

  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Success"),
          content: const Text("Successfully added!"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const HomeScreen()));

                colorController.clear();
                _modalController.clear();
                _wheelTypeController.clear();
                _brandController.clear();
              },
              child: const Text("Done"),
            ),
          ],
        );
      },
    );
  }
}
