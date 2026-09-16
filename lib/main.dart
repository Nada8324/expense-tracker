import 'package:expense_tracker/core/data%20source/firebase_datasource.dart';
import 'package:expense_tracker/features/home/presentation/screens/home_screen.dart';
import 'package:expense_tracker/features/onBording/onboarding_screen.dart';
import 'package:expense_tracker/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseDatasource datasource = FirebaseDatasource();
  datasource.logOut();
  final user = FirebaseAuth.instance.currentUser;
  runApp(MyApp(isloggedIn: user != null ? true : false));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isloggedIn});
  final bool isloggedIn;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 800),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: isloggedIn ? HomeScreen() : OnboardingScreen(),
      ),
    );
  }
}
