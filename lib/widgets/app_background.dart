import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  
  const AppBackground({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E3C72), // Azul oscuro
            Color(0xFF2A5298), // Azul medio
            Color(0xFF4A90E2), // Azul claro
            Color(0xFF74B9FF), // Azul cielo
          ],
          stops: [0.0, 0.3, 0.7, 1.0],
        ),
      ),
      child: child,
    );
  }
}