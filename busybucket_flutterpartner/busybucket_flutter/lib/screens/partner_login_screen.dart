import 'package:flutter/material.dart';
import 'partner_entry_screen.dart';

/// Placeholder for `home/director/manager/admin/partner/partner-login.html`.
/// Replace this with your real partner login UI — share that HTML file
/// and it can be converted the same way as the entry screen.
class PartnerLoginScreen extends StatelessWidget {
  const PartnerLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.6, -1),
            end: Alignment(0.6, 1),
            colors: [BBColors.pineDark, BBColors.pine, BBColors.pineLight],
          ),
        ),
        child: const SafeArea(
          child: Center(
            child: Text(
              'Partner Login screen goes here.\nShare partner-login.html to convert it.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
