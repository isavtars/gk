import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resources/auth_resources.dart';
import '../../styles/color.dart';
import '../../styles/sizeconfig.dart';
import '../widgets/custom_buttons.dart';
import '../widgets/custom_inputs.dart';
import '../widgets/snackbar.dart';
import 'verefirdmail.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmComtroller = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  //signup
  bool isLodding = false;
  void signUsers() async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isLodding = true;
      });
    }

    if (passwordController.text == confirmComtroller.text) {
      String res = await AuthMethods().signUpUser(
          email: emailController.text,
          password: passwordController.text,
          confirmPassword: confirmComtroller.text);

      setState(() {
        isLodding = false;
      });

      debugPrint(res);

      if (res != "Succes") {
        showSnackBar(context, text: res, color: Colors.red);
      } else {
        _formkey.currentState!.reset();
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const VerifeidEmailScreen()));
      }
    } else {
      // showSnackBar("password and confirmPassword are not same");
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmComtroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    debugPrint("${SizeConfig.blockSizeVertical}");
    debugPrint("${SizeConfig.blockSizeHorizontal}");

    bool isChecked = false;
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.green;
      }
      return Colors.green;
    }

    return Scaffold(
      backgroundColor: kGreenColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/logo.png',
                      ))),
              height: SizeConfig.blockSizeVertical! * 32,
            ),
            Container(
              height: SizeConfig.blockSizeVertical! * 68,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2.3,
                    ),
                    Text(
                      "Create account",
                      style: kJakartaBodyMedium.copyWith(
                          fontSize: SizeConfig.blockSizeHorizontal! * 6.3),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 2.5,
                    ),
                    Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          CustomeInputs(
                            textEditingController: emailController,
                            hintText: "Email",
                            icons: Icons.alternate_email,
                            textinputTypes: TextInputType.emailAddress,
                            credentials: false,
                            validators: (value) {
                              if (value!.isEmpty) {
                                return "Enter The email";
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 1.8,
                          ),
                          CustomeInputs(
                            validators: (value) {
                              if (value!.isEmpty) {
                                return "Enter The password";
                              }
                              return null;
                            },
                            textinputTypes: TextInputType.text,
                            textEditingController: passwordController,
                            hintText: "Password",
                            icons: Icons.lock,
                            credentials: true,
                          ),
                          SizedBox(
                            height: SizeConfig.blockSizeVertical! * 1.8,
                          ),
                          CustomeInputs(
                            validators: (value) {
                              if (value!.isEmpty) {
                                return "Enter The confirmpassword";
                              } else if (value != passwordController.text) {
                                return "Enter password And confirmpassword shouldbe same ";
                              }
                              return null;
                            },
                            textinputTypes: TextInputType.text,
                            textEditingController: confirmComtroller,
                            hintText: "Confirm Password",
                            icons: Icons.lock,
                            credentials: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 1.8,
                    ),
                    Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                  checkColor: Colors.white,
                                  fillColor: MaterialStateProperty.resolveWith(
                                      getColor),
                                  value: isChecked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      isChecked = value!;
                                    });
                                  }),
                              Text(
                                  'Agree to our Privacy Policy and \nTerms & Conditions.',
                                  maxLines: 2,
                                  style: kJakartaBodyRegular.copyWith(
                                    fontSize:
                                        SizeConfig.blockSizeHorizontal! * 3.6,
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 1.8,
                    ),
                    CustomeBtn(
                      btnTitleName: isLodding
                          ? const CircularProgressIndicator()
                          : const Text("Continue"),
                      onPress: signUsers,
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical! * 1,
                    ),
                    Center(
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Text('Already have an account?'),
                          ),
                          TextButton(
                              onPressed: () {
                                Get.toNamed("/login");
                              },
                              child: Text("LOGIN",
                                  style: kJakartaBodyRegular.copyWith(
                                      color: kGreenColor))),
                        ],
                      ),
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
