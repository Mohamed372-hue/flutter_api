import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutterexample/app_routes.dart';
import 'package:flutterexample/constants/my_strings.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (context) => myapp(
      appRoutes: AppRoutes(),
    ), // Wrap your app
  ));
}

// ignore: camel_case_types
class myapp extends StatelessWidget {
  final AppRoutes appRoutes;

  const myapp({super.key, required this.appRoutes});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRoutes.generateroutes,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute: charactersscreen,
    );
  }
}
