import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movement_shipment/provider/animation_provider.dart';
import 'package:movement_shipment/provider/navigation_provider.dart';
import 'package:movement_shipment/screeens/bottom_nav.dart';
import 'package:movement_shipment/utils/colors.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 954),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Babajide',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.white,
            primarySwatch: Colors.blue,
          ),
          home: MultiProvider(
            providers: [
              ChangeNotifierProvider(create: (context) => BottomNavigationProvider()),
              ChangeNotifierProvider(create: (context) => AnimationProvider()),
            ],
            child: BottomNavigatorScreen(),
          ),
        );
      },
    );
  }
}



