import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ringo_media/core/routing/navigator.dart';
import 'package:ringo_media/core/routing/routes.dart';
import 'package:ringo_media/core/utilities/theme.dart';
import 'package:ringo_media/test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Ringo Media',
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppRoutes.onGenerateRoute,
         initialRoute: Routes.login,
        navigatorKey: AppRoutes.navigatorState,
        navigatorObservers: [AppRoutes.routeObserver],
        scaffoldMessengerKey: AppRoutes.scaffoldState,
        debugShowCheckedModeBanner: false,
       // home: const CustomCalendarSheet(),
      ),
    );
  }
}
