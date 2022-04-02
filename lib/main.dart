import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:quiz_app/config/app_config.dart';
import 'package:quiz_app/screen/profile/profile.dart';
import 'package:quiz_app/screen/ui/question.dart';
import 'package:quiz_app/screen/ui/runner_up_screen.dart';
import 'package:quiz_app/utils/splash%20screen.dart';
Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  OverlaySupport.global(
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppThemeConfig.appBackGroundColour,
          // backgroundColor: AppThemeConfig.appBackGroundColour
        ),
        debugShowCheckedModeBanner: false,
        home:  SplashScreen(),
      ),
    );
  }
}
