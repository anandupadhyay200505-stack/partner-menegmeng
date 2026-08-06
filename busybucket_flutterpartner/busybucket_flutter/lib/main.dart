import 'package:flutter/material.dart';
import 'screens/partner_entry_screen.dart';
import 'screens/partner_login_screen.dart';

void main() {
  runApp(const BusyBucketApp());
}

class BusyBucketApp extends StatelessWidget {
  const BusyBucketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Busy Bucket',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const PartnerEntryScreen(),
        '/partner-login': (context) => const PartnerLoginScreen(),
      },
    );
  }
}
