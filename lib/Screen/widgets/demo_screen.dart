import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gharkhracha/resources/auth_resources.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../../logic/themes_changer.dart';
import '../../logic/user_controller.dart';
import '../../styles/color.dart';
import '../userprofile/update_user_profile.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Placeholder(
        child: Center(child: Text(' PlanningScreeen')),
      ),
    );
  }
}

class PlanningScreeen extends StatelessWidget {
  const PlanningScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Placeholder(
        child: Center(child: Text(' PlanningScreeen')),
      ),
    );
  }
}

class UserProfileScreeen extends StatelessWidget {
  const UserProfileScreeen({super.key});

  @override
  Widget build(BuildContext context) {
    final themcontroller = Get.find<ThemModeChange>();
    final user = Get.find<UserController>().getUsers;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  AuthMethods auth = AuthMethods();
                  auth.logout();
                },
                child: const Row(
                  children: [Icon(Icons.logout), Text("logout")],
                )),
            FlutterSwitch(
              width: 100,
              height: 50,
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
              value: themcontroller.isDarkMode(context),
              onToggle: (value) {
                themcontroller.switchTheme(value);
              },
            ),
            Text("${user?.email}"),
            Text("${user?.uid}"),
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const UserProfileUpdate()));
              },
              icon: const Icon(Icons.edit),
            )
          ],
        ),
      ),
    );
  }
}
