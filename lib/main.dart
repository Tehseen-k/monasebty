import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:monasebty/ui/locaor.dart';
import 'package:monasebty/ui/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: Size(screenSize.width, screenSize.height),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: const TextTheme(
            headlineMedium: TextStyle(
              fontFamily: 'Salvador', // Apply Salvador font
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          bottomAppBarTheme: BottomAppBarTheme(
              surfaceTintColor: Colors.transparent,
              color: Colors.transparent,
              shadowColor: Colors.transparent),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
