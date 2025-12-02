import 'package:flutter/material.dart';
import 'package:yumee/screens/splashscreen.dart';
import 'package:yumee/theme/theme.dart';
import 'services/hive_service.dart';
import 'services/data_resep.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inisialisasi Hive melalui service
  await HiveService.init();

  //tambah data resep
  await DataInitializer.addInitialData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yumee',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}