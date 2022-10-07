import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gigi/Providers/db_provider.dart';
import 'package:gigi/splash_screen.dart';
import 'package:provider/provider.dart';

import 'Providers/bottom_nav_provider.dart';

void main() async {
  await initDependencies();
  runApp(const MyApp());
}

Future<void> initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModelProviders()),
        ChangeNotifierProvider(create: (_) => DbProvider()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
