import 'package:Arogyam/Onboarding/Page1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:
          const Size(375, 812), // 375, 812 is the default size of the UI design
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Page1(),
      ),
    );
  }
}
