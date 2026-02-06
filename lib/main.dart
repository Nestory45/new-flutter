import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

// Screens
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/main_navigation_screen.dart';

// Services
import 'services/push_notification_service.dart';

// Theme
import 'theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 1️⃣ Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 2️⃣ Initialize Push Notifications (FCM)
  await PushNotificationService().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter SMS App',
      debugShowCheckedModeBanner: false,

      // App inaanzia Login
      initialRoute: '/login',

      routes: {
        // Auth
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),

        // Main App (after login)
        '/home': (context) => MainNavigationScreen(),

        // Chat
        '/chat': (context) => ChatScreen(),
      },

      // 🎨 GLOBAL THEME (Member 13)
      theme: AppTheme.lightTheme,
    );
  }
}
