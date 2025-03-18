import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:frontend/dependency_injection.dart';

import 'package:frontend/routing/app_router.dart';
import 'package:frontend/routing/routes.dart';

void main() async {
  await setupGetIt();

  runApp(MainApp(
    appRouter: AppRouter(),
  ));
}

class MainApp extends StatelessWidget {
  final AppRouter appRouter;
  const MainApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(412, 924),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.loginScreen,
            onGenerateRoute: appRouter.generateRoute,
          );
        });
  }
}
