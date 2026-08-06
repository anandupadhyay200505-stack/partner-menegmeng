import 'dart:ui';
import 'package:flutter/material.dart';

/// Color palette taken from the original CSS custom properties.
class BBColors {
  static const pineDark = Color(0xFF0F3D33);
  static const pine = Color(0xFF1A5C4D);
  static const pineLight = Color(0xFF25735F);
  static const coral = Color(0xFFFF8A3D);
  static const glass = Color(0x0FFFFFFF); // rgba(255,255,255,0.06)
  static const glassBorder = Color(0x24FFFFFF); // rgba(255,255,255,0.14)
}

class PartnerEntryScreen extends StatelessWidget {
  const PartnerEntryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isSmall = width < 480;

    return Scaffold(
      body: Stack(
        children: [
          // Base gradient background (mirrors the 160deg linear-gradient)
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.6, -1),
                end: Alignment(0.6, 1),
                colors: [BBColors.pineDark, BBColors.pine, BBColors.pineLight],
                stops: [0, 0.6, 1],
              ),
            ),
          ),
          // Soft radial glows to echo the CSS radial-gradient accents
          Positioned(
            top: -80,
            left: -60,
            child: _glow(220, Colors.white.withOpacity(0.05)),
          ),
          Positioned(
            bottom: -100,
            right: -80,
            child: _glow(260, BBColors.coral.withOpacity(0.10)),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Brand logo
                    _Brand(isSmall: isSmall),
                    const SizedBox(height: 36),
                    // Partner Panel card
                    _PartnerPanelCard(isSmall: isSmall),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _glow(double size, Color color) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(
          colors: [color, color.withOpacity(0)],
        ),
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  final bool isSmall;
  const _Brand({required this.isSmall});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Original HTML links to home/admin-home.html — hook up your
        // admin/home route here when it exists.
      },
      child: Image.asset(
        'assets/images/logo.png',
        width: isSmall ? 88 : 200,
        filterQuality: FilterQuality.high,
      ),
    );
  }
}

class _PartnerPanelCard extends StatefulWidget {
  final bool isSmall;
  const _PartnerPanelCard({required this.isSmall});

  @override
  State<_PartnerPanelCard> createState() => _PartnerPanelCardState();
}

class _PartnerPanelCardState extends State<_PartnerPanelCard> {
  bool _pressed = false;
  bool _hovering = false;

  void _openPartnerLogin() {
    Navigator.of(context).pushNamed('/partner-login');
  }

  @override
  Widget build(BuildContext context) {
    final logoSize = widget.isSmall ? 84.0 : 110.0;
    final titleSize = widget.isSmall ? 20.0 : 24.0;
    final descSize = widget.isSmall ? 13.5 : 15.0;
    final padding = widget.isSmall ? 20.0 : 28.0;
    final gap = widget.isSmall ? 16.0 : 24.0;

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _pressed = true),
        onTapUp: (_) => setState(() => _pressed = false),
        onTapCancel: () => setState(() => _pressed = false),
        onTap: _openPartnerLogin,
        child: AnimatedScale(
          scale: _pressed ? 0.99 : 1.0,
          duration: const Duration(milliseconds: 120),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            transform: Matrix4.translationValues(
              0,
              _hovering && !_pressed ? -3 : 0,
              0,
            ),
            constraints: const BoxConstraints(maxWidth: 560),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                child: Container(
                  padding: EdgeInsets.all(padding),
                  decoration: BoxDecoration(
                    color: _hovering
                        ? Colors.white.withOpacity(0.09)
                        : BBColors.glass,
                    border: Border.all(color: BBColors.glassBorder),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(_hovering ? 0.32 : 0.25),
                        blurRadius: _hovering ? 40 : 30,
                        offset: Offset(0, _hovering ? 14 : 8),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      // Logo ring
                      Container(
                        width: logoSize,
                        height: logoSize,
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.25),
                              blurRadius: 16,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'assets/images/busybucket.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(width: gap),
                      // Text content
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text('🤝', style: TextStyle(fontSize: 22)),
                                const SizedBox(width: 10),
                                Flexible(
                                  child: Text(
                                    'Partner Panel',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: titleSize,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: -0.2,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'View Jobs, Earnings, Profile & Notifications',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.72),
                                fontSize: descSize,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white.withOpacity(0.65),
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
