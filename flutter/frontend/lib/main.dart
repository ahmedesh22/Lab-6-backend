import 'package:flutter/material.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.loginScreen,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
