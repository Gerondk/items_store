import 'package:flutter/material.dart';
import 'package:items_store/routes/navigation.dart';

import 'di/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
    );
  }
}
