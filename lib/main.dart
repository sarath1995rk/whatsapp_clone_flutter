import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/colors.dart';
import 'package:whatsapp_clone/features/landing/screens/landing_screen.dart';
import 'package:whatsapp_clone/firebase_options.dart';
import 'package:whatsapp_clone/router.dart';
import 'package:whatsapp_clone/screens/mobile_layout_screen.dart';
import 'package:whatsapp_clone/screens/web_layout_screen.dart';
import 'package:whatsapp_clone/utils/responsive_layout.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
     
      title: 'Whatsapp UI',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
         appBarTheme: const AppBarTheme(
          color: appBarColor,
        ),
      ),
       onGenerateRoute: (settings) => generateRoute(settings),
      home: const ResponsiveLayout(
        mobileScreenLayout: LandingScreen(),
        webScreenLayout: WebLayoutScreen(),
      ),
    );
  }
}
