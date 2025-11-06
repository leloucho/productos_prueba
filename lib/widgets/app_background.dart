import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  final String? backgroundImage;
  final bool useGradientOverlay;
  
  const AppBackground({
    super.key,
    required this.child,
    this.backgroundImage,
    this.useGradientOverlay = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // Si hay imagen de fondo, usarla
        image: backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
                colorFilter: useGradientOverlay
                    ? ColorFilter.mode(
                        Colors.black.withOpacity(0.3),
                        BlendMode.darken,
                      )
                    : null,
              )
            : null,
        // Si no hay imagen, usar gradiente
        gradient: backgroundImage == null
            ? const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF1E3C72), // Azul oscuro
                  Color(0xFF2A5298), // Azul medio
                  Color(0xFF4A90E2), // Azul claro
                  Color(0xFF74B9FF), // Azul cielo
                ],
                stops: [0.0, 0.3, 0.7, 1.0],
              )
            : null,
      ),
      // Si usamos imagen Y queremos overlay de gradiente
      child: backgroundImage != null && useGradientOverlay
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF1E3C72).withOpacity(0.7),
                    const Color(0xFF2A5298).withOpacity(0.5),
                    const Color(0xFF4A90E2).withOpacity(0.3),
                    const Color(0xFF74B9FF).withOpacity(0.1),
                  ],
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
              ),
              child: child,
            )
          : child,
    );
  }
}