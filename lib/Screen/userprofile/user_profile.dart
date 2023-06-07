import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:gharkhracha/logic/user_controller.dart';
import 'package:gharkhracha/styles/color.dart';
import 'package:gharkhracha/styles/sizeconfig.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../logic/themes_changer.dart';
import '../auth/forgot_password_screen.dart';
import '../auth/login.dart';
import '../widgets/custom_buttons.dart';
import 'update_user_profile.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final sizeh = SizeConfig.blockSizeHorizontal;
    final sizev = SizeConfig.blockSizeHorizontal;
    final usercontroller = Get.find<UserController>().getUsers!;
    final themcontroller = Get.find<ThemModeChange>();
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return OrientationBuilder(builder: (context, orientation) {
          return SafeArea(
              child: SingleChildScrollView(
                  child: Padding(
            padding: EdgeInsets.only(
                top: sizev! * 3, left: sizeh! * 3, right: sizeh * 3),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Profile",
                      style: kJakartaBodyMedium.copyWith(fontSize: sizeh * 6),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const UserProfileUpdate()));
                      },
                      icon: const Icon(Icons.edit),
                    )
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: orientation == Orientation.portrait
                          ? constraints.maxHeight * 0.2
                          : constraints.maxHeight * 0.4,
                      width: orientation == Orientation.portrait
                          ? constraints.maxHeight * 0.2
                          : constraints.maxHeight * 0.4,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4, color: Theme.of(context).cardColor),
                          shape: BoxShape.circle,
                          color: Theme.of(context).canvasColor),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: usercontroller.profilePic.toString() == ""
                            ? const Icon(
                                Icons.person,
                                size: 90,
                                color: kGrayTextC,
                              )
                            : Image.network(
                                usercontroller.profilePic.toString(),
                                scale: 1,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.03,
                ),
                ProfileTab(
                    constraints: constraints,
                    title: 'Full Name',
                    iconName: Icons.person,
                    titleValue: usercontroller.fullName),
                ProfileTab(
                    constraints: constraints,
                    title: 'Phone number',
                    iconName: Icons.call,
                    titleValue: usercontroller.phoneNumber),
                ProfileTab(
                    constraints: constraints,
                    title: 'Bank account number',
                    iconName: Icons.account_balance,
                    titleValue: usercontroller.bankAccNumber),
                ProfileTab(
                    constraints: constraints,
                    title: 'KYC number',
                    iconName: Icons.person,
                    titleValue: usercontroller.kyc),
                ProfileTab(
                    constraints: constraints,
                    title: 'Age',
                    iconName: Icons.person,
                    titleValue: usercontroller.age),
                ProfileTab(
                    constraints: constraints,
                    title: 'Income Range',
                    iconName: Icons.currency_rupee,
                    titleValue: usercontroller.incomeRange),
                SizedBox(
                  height: constraints.maxHeight * 0.01,
                ),
                Row(
                  children: [
                    const Text(
                      'Dark Mode',
                      style: TextStyle(fontSize: 18),
                    ),
                    const Spacer(),
                    theheSwitcher(context, themcontroller),
                  ],
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.04,
                ),
                TButton(
                  constraints: constraints,
                  btnColor: Theme.of(context).primaryColor,
                  btnText: 'Sign out',
                  onPressed: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
                  },
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.03,
                ),
                TButton(
                  constraints: constraints,
                  btnColor: Theme.of(context).primaryColor,
                  btnText: 'Reset Password',
                  onPressed: () {
                    PersistentNavBarNavigator.pushNewScreen(
                      context,
                      screen: const ForgotPassScreen(),
                      withNavBar: false, // OPTIONAL VALUE. True by default.
                    );
                  },
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.06,
                ),
              ],
            ),
          )));
        });
      }),
    );
  }

  FlutterSwitch theheSwitcher(BuildContext context, ThemModeChange themcontroller) {
    return FlutterSwitch(
                    width: 50,
                    height: 30,
                    padding: 0,
                    activeToggleColor: kDarkCardC,
                    inactiveToggleColor: Theme.of(context).primaryColor,
                    activeSwitchBorder: Border.all(
                      color: kDarkGreenBackC,
                      width: 4,
                    ),
                    inactiveSwitchBorder: Border.all(
                      color: kTextFieldBorderC,
                      width: 4,
                    ),
                    activeColor: kDarkGreenColor,
                    inactiveColor: kTextFieldColor,
                    activeIcon: Icon(
                      Icons.nightlight_round,
                      color: Theme.of(context).primaryColor,
                    ),
                    inactiveIcon: const Icon(
                      Icons.wb_sunny,
                      color: kTextFieldColor,
                    ),
                    value: themcontroller.isDarkMode(),
                    onToggle: (value) {
                      themcontroller.switchTheme(value);
                    },
                  );
  }
}

class ProfileTab extends StatelessWidget {
  const ProfileTab({
    super.key,
    required this.constraints,
    required this.title,
    required this.iconName,
    required this.titleValue,
  });

  final BoxConstraints constraints;
  final String title;
  final IconData iconName;
  final String titleValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              iconName,
              color: kGrayTextC,
              size: 25,
            ),
            SizedBox(
              width: constraints.maxWidth * 0.06,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: kGrayTextC, fontSize: 14),
                ),
                Text(
                  titleValue,
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: constraints.maxHeight * 0.01,
        ),
        Divider(
          thickness: 1,
          color: kGrayTextC.withOpacity(0.2),
        ),
        SizedBox(
          height: constraints.maxHeight * 0.01,
        ),
      ],
    );
  }
}
