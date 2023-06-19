import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gk/Screen/widgets/drawer.dart';

import '../../logic/user_controller.dart';
import '../Home/home_screen.dart';
import '../auth/login.dart';
import '../planning/planning.dart';
import '../userprofile/user_profile.dart';
import '../wallet/wallet.dart';

import '../../styles/color.dart';
import '../../styles/gharkharcha_themes.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'planning_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  final usercontroller = Get.find<UserController>().getUsers!;
  @override
  void initState() {
    addData();
    super.initState();
  }

  final controller = PersistentTabController(initialIndex: 0);

  void addData() async {
    final usercontroller = Get.find<UserController>();
    await usercontroller.refressUser();
  }

  List<Widget> _buildScreen() {
    return const [
      HomeScreen(),
      WalletScreen(),
      PlanningScren(),
      UserProfile(),
    ];
  }

  List<PersistentBottomNavBarItem> navBarItem() {
    dynamic navBarColor =
        // ignore: unrelated_type_equality_checks
        GkThemsData.isDarkMode(context) == true
            ? kDarkGreenNavIconC
            : kGreenNavC;
    return [
      PersistentBottomNavBarItem(
        inactiveColorPrimary: navBarColor,
        activeColorPrimary: navBarColor,
        icon: const Icon(Icons.home),
      ),
      PersistentBottomNavBarItem(
          inactiveColorPrimary: navBarColor,
          activeColorPrimary: navBarColor,
          icon: const Icon(Icons.account_balance_wallet)),
      PersistentBottomNavBarItem(
          inactiveColorPrimary: navBarColor,
          activeColorPrimary: navBarColor,
          icon: const Icon(Icons.article)),
      PersistentBottomNavBarItem(
          inactiveColorPrimary: navBarColor,
          activeColorPrimary: navBarColor,
          icon: const Icon(Icons.person)),
    ];
  }

  // bool isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              drawer: DrawerWidget(),
              body: PersistentTabView(
                context,
                screens: _buildScreen(),
                items: navBarItem(),
                controller: controller,
                navBarHeight: 60,
                decoration: NavBarDecoration(
                    // ignore: unrelated_type_equality_checks
                    colorBehindNavBar: GkThemsData.isDarkMode(context) == true
                        ? kDarkGreenBackC
                        : kGreenDarkC,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                padding: const NavBarPadding.all(0),
                backgroundColor: Theme.of(context).primaryColor,
                navBarStyle: NavBarStyle.style3,
                itemAnimationProperties: const ItemAnimationProperties(
                  duration: Duration(milliseconds: 400),
                  curve: Curves.ease,
                ),
                screenTransitionAnimation:
                    const ScreenTransitionAnimation(curve: Curves.ease),
              ),
            );
          }

          return const LoginScreen();
        });
  }
}

//heloo