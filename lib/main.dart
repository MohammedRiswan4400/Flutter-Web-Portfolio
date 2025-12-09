import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'view/home/screen_home.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: false,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // Laptop aanenkil 1920x1080, Mobile aanenkil 430x932
      designSize: kIsWeb ? const Size(1920, 1080) : const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Portfolio Web Flutter',
          // Home-il Responsive Layout vilikkunnu
          home: ScreenHome(),
        );
      },
    );
  }
}
