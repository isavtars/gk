import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:gharkhracha/Screen/widgets/custom_buttons.dart';
import 'package:gharkhracha/Screen/widgets/snackbar.dart';
import 'package:gharkhracha/logic/user_controller.dart';
import 'package:gharkhracha/styles/color.dart';
import 'package:gharkhracha/styles/sizeconfig.dart';

import 'package:image_picker/image_picker.dart';

import '../../resources/users_resources.dart';
import '../../utils/utils.dart';
import '../widgets/custom_inputs.dart';

class UserProfileUpdate extends StatefulWidget {
  const UserProfileUpdate({super.key});

  @override
  State<UserProfileUpdate> createState() => _UserProfileUpdateState();
}

List<String> items = [
  'Less than 200K',
  '200K - 400K',
  '400K - 600K',
  'More than 600K'
];

class _UserProfileUpdateState extends State<UserProfileUpdate> {
  final fullNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final bankAccountController = TextEditingController();
  final kycController = TextEditingController();
  final ageController = TextEditingController();
  String reminderdropvalue = "Income range";

  bool isLoding = false;
  Uint8List? image;

  void selectedImages() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      image = im;
    });
  }

  @override
  void dispose() {
    fullNameController.dispose();
    phoneNumberController.dispose();
    bankAccountController.dispose();
    kycController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  final user = Get.find<UserController>().getUsers!;
  updateUser() async {
    setState(() {
      isLoding = true;
    });
    String res = await UserMethods().updateUserDate(
        uid: user.uid,
        fullName: fullNameController.text.toString(),
        age: ageController.text.toString(),
        phoneNumber: phoneNumberController.text.toString(),
        bankAccNumber: bankAccountController.text.toString(),
        kyc: kycController.text.toString(),
        incomeRange: reminderdropvalue,
        picfile: image!);
    if (res == "Success") {
      Get.back();
    } else {
      showSnackBar(
        context,
        text: res.toString(), color: Colors.red);
    }

    setState(() {
      isLoding = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final height = SizeConfig.blockSizeVertical;
    final width = SizeConfig.blockSizeHorizontal;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return OrientationBuilder(builder: (context, orientation) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            color: Colors.green,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.keyboard_arrow_left,
                                color: Theme.of(context).iconTheme.color,
                                size: 40)),
                        SizedBox(
                          width: width! * 10,
                        ),
                        Text(
                          "Update Acounts",
                          style: kJakartaBodyBold.copyWith(fontSize: 26),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height! * 1,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 120,
                            width: 130,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 4,
                                    color: Theme.of(context).cardColor),
                                shape: BoxShape.circle,
                                color: Theme.of(context).canvasColor),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: image != null
                                    ? CircleAvatar(
                                        radius: 64,
                                        backgroundImage: MemoryImage(image!),
                                      )
                                    : const Icon(
                                        Icons.person,
                                        size: 90,
                                        color: kGrayTextC,
                                      )),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 3,
                            child: Container(
                                height: 35,
                                width: 35,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 3,
                                        color: Theme.of(context).primaryColor),
                                    shape: BoxShape.circle,
                                    color: Theme.of(context).cardColor),
                                child: GestureDetector(
                                  onTap: () => selectedImages(),
                                  child: const Icon(
                                    Icons.edit,
                                    size: 20,
                                    color: kGrayTextC,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 1.2,
                    ),
                    //TextInputFeild

                    Form(
                        child: Container(
                      child: Column(
                        children: [
                          CustomeInputs(
                            textEditingController: fullNameController,
                            hintText: "fullName",
                            icons: Icons.account_box,
                            textinputTypes: TextInputType.text,
                          ),
                          SizedBox(
                            height: height * 1.4,
                          ),
                          //pn
                          CustomeInputs(
                            textEditingController: phoneNumberController,
                            hintText: "PhoneNumber",
                            icons: Icons.phone,
                            textinputTypes: TextInputType.phone,
                          ),
                          SizedBox(
                            height: height * 1.4,
                          ),
                          //bankacc
                          CustomeInputs(
                            textEditingController: bankAccountController,
                            hintText: "BankAcoountNumber",
                            icons: Icons.account_balance,
                            textinputTypes: TextInputType.number,
                          ),
                          SizedBox(
                            height: height * 1.4,
                          ),
                          CustomeInputs(
                            textEditingController: kycController,
                            hintText: "Kyc Number",
                            icons: Icons.account_balance,
                            textinputTypes: TextInputType.number,
                          ),
                          SizedBox(
                            height: height * 1.4,
                          ),
                          CustomeInputs(
                            textEditingController: ageController,
                            hintText: "Age",
                            icons: Icons.account_circle_outlined,
                            textinputTypes: TextInputType.number,
                          ),
                          SizedBox(
                            height: height * 1.4,
                          ),
                          //dropedown
                          CustomeInputWithdrop(
                              perfix: Icons.currency_rupee,
                              hintText: "$reminderdropvalue",
                              // suffixIcon: Icons.keyboard_arrow_down,
                              suffix: DropdownButton<String>(
                                elevation: 10,
                                iconSize: 32,
                                style: kJakartaHeading4.copyWith(
                                    color: kGrayTextfieldC, fontSize: 19),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: kGrayTextfieldC,
                                ),
                                items: items.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: kJakartaHeading3.copyWith(
                                          fontSize: 19, color: kGrayTextfieldC),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? value) {
                                  // This is called when the user selects an item.
                                  setState(() {
                                    reminderdropvalue = value!;
                                  });
                                },
                              )),

                          SizedBox(
                            height: height * 1.4,
                          ),

                          CustomeBtn(
                            btnTitleName: isLoding
                                ? const CircularProgressIndicator()
                                : Text(
                                    "Continue",
                                    style: kJakartaHeading3.copyWith(
                                        color: Colors.white,
                                        fontSize: height * 2),
                                  ),
                            onPress: updateUser,
                          ),
                        ],
                      ),
                    )),
                    SizedBox(
                      height: height * 5,
                    ),
                  ],
                ),
              ),
            );
          });
        }),
      ),
    );
  }
}




//TODO FOR THIS SCREEN
//1 VALIDATION BOTH SIDE 
//CHANGE CircularProgressIndicator() COLOR
