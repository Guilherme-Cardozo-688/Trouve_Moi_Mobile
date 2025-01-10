import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:trouve_moi_mobile/apresentation/standart/app_colors.dart';

class WaveClipPathExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wave ClipPath"),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 100,
          child: ClipPath(
            clipper: WaveClipper(),
            child: Container(
              color: AppColors.buttonVerde,
            ),
          ),
        ),
      ),
    );
  }
}

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, size.height * 0.5); // Ponto inicial
    path.quadraticBezierTo(
      size.width * 0.25, // Controle da curva
      size.height * 0.2, // Posição superior
      size.width * 0.5, // Final da primeira curva
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.2, // Controle da curva
      size.height * 0.90, // Posição inferior
      size.width, // Final da segunda curva
      size.height * 0.5,
    );
    path.lineTo(size.width, size.height); // Linha até o canto inferior direito
    path.lineTo(0, size.height); // Linha até o canto inferior esquerdo
    path.close(); // Fecha o caminho
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false; // Não precisa recalcular o recorte
  }
}
