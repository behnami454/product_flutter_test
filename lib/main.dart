import 'package:flutter/material.dart';
import 'package:product_app/ui/splash_screen.dart';
import 'config/bloc_providers/bloc_providers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Product App',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            color: Colors.grey,
          ),
          textTheme: const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
          ),
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
