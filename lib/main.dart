import 'package:accessibility_tools/accessibility_tools.dart';
import 'package:flutter/material.dart';
import 'package:items_store/routes/navigation.dart';

import 'di/service_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final bool enableAccessibilityTools;
  const MyApp({super.key, this.enableAccessibilityTools = false});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      title: 'Flutter Demo',
      builder: (context, child) => enableAccessibilityTools
          ? AccessibilityTools(
              enableButtonsDrag: true,
              checkFontOverflows: true,
              checkImageLabels: true,
              buttonsAlignment: .bottomRight,
              child: child!,
            )
          : child!,

      darkTheme: ThemeData.dark(useMaterial3: true),
    );
  }
}
