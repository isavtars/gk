
# GharKharcha

GharKharcha is a Flutter application designed to help you track your income and expenses and effectively manage your finances. The app aims to optimize your money utilization by allocating income into various categories such as savings, needs, expenses, emergency funds, and more.

## Features

- User Authentication: The app provides user registration and login functionality using Firebase authentication.

- Income and Expense Tracking: Track your income and expenses easily within the app, helping you stay organized and understand your financial situation.

- Income Allocation: Split your income into different categories, such as savings, needs, expenses, and emergency funds, to ensure optimal utilization of your money.

- Home Screen Dashboard: The app features a home screen dashboard that provides an overview of your income, expenses, and allocated funds. It gives you a clear picture of your financial health at a glance.

## Getting Started

1. Make sure you have Flutter installed. For instructions, refer to the official Flutter documentation: [Flutter Installation](https://flutter.dev/docs/get-started/install)

2. Clone the repository or download the code to your local machine.

3. Open the project in your preferred code editor.

4. Ensure that you have the necessary dependencies by running the following command in the terminal:

   ```
   flutter pub get
   ```

5. Set up Firebase for your project:

   - Create a new Firebase project in the Firebase console: [Firebase Console](https://console.firebase.google.com/)
   
   - Add an Android and/or iOS app to your Firebase project and follow the provided instructions to download the `google-services.json` (for Android) and/or `GoogleService-Info.plist` (for iOS) configuration files. Place these files in the respective platform folders (`android/app` for Android, `ios/Runner` for iOS) of the Flutter project.
   
   - Enable the necessary Firebase authentication methods (such as email/password, Google sign-in, etc.) in the Firebase console.

6. Run the app on a simulator or connected device:

   ```
   flutter run
   ```

## Project Structure

The project follows the following structure:

- `Screen/Home/home_screen.dart`: Home screen widget that displays the income and expense dashboard.
- `Screen/auth/forgot_password_screen.dart`: Screen for password recovery.
- `Screen/auth/login.dart`: Login screen widget.
- `Screen/auth/register_screen.dart`: Registration screen widget.
- `Screen/splash_screen.dart`: Splash screen widget shown during app initialization.
- `Screen/widgets/bottom_navbar.dart`: Widget for the bottom navigation bar.
- `firebase_options.dart`: Firebase configuration options for setting up Firebase services.
- `logic/bainding/my_bainding.dart`: Binding for initializing dependencies.
- `logic/themes_changer.dart`: Logic for changing app themes.
- `styles/gharkharcha_themes.dart`: Custom themes for the GharKharcha app.

## Additional Dependencies

The following dependencies are used in the project:

- `package:get/get.dart`: State management library for Flutter.
- `package:firebase_auth/firebase_auth.dart`: Firebase authentication package.
- `package:firebase_core/firebase_core.dart`: Firebase Core package.
- `package:flutter/material.dart`: Flutter framework.

## Contributing

Contributions to GharKharcha are welcome! If you encounter any issues or have suggestions for improvement, please feel free to submit a pull request or open an issue on the GitHub repository.

## License

This project is licensed under the [MIT License](LICENSE).
