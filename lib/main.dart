import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Screen/Home/home_screen.dart';
import 'Screen/auth/forgot_password_screen.dart';
import 'Screen/auth/login.dart';
import 'Screen/auth/register_screen.dart';
import 'Screen/splash_screen.dart';
import 'Screen/widgets/bottom_navbar.dart';
import 'firebase_options.dart';
import 'logic/bainding/my_bainding.dart';
import 'logic/themes_changer.dart';
import 'styles/gharkharcha_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ThemModeChange(),
      builder: (themcontroller) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/splashScreen',
          initialBinding: MyBinding(),
          themeMode: themcontroller.themeMode,
          theme: GkThemsData.lightTheme,
          darkTheme: GkThemsData.darkTheme,
          getPages: [
            GetPage(name: "/splashScreen", page: () => const SplashScreen()),
            GetPage(name: "/register", page: () => const RegisterScreen()),
            GetPage(name: "/login", page: () => const LoginScreen()),
            GetPage(
                name: "/forgot_password", page: () => const ForgotPassScreen()),
            GetPage(name: "/home", page: () => const HomeScreen()),
          ],
          defaultTransition: Transition.cupertino,
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                // Checking if the snapshot has any data or not
                if (snapshot.hasData) {
                  debugPrint(snapshot.hasData.toString());
                  // if snapshot has data which means user is logged in then we check the width
                  // of screen and accordingly display the screen layout
                  return const BottomNav();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('${snapshot.error}'),
                  );
                }
              }

              // means connection to future hasnt been made yet
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              return const LoginScreen();
            },
          ),
        );
      },
    );
  }
}
