import 'package:flutter/material.dart';

class ContactBackdrop extends StatelessWidget {
  const ContactBackdrop({super.key});

  @override
  Widget build(BuildContext context) => const Stack(
    fit: StackFit.expand,
    children: [
      DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFE6F1FC), Color(0xFFCAD6F3), Color(0xFFE2D2ED)],
          ),
        ),
      ),
      DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(1.1, -.55),
            radius: .9,
            colors: [Color(0x9994A9EB), Color(0x0094A9EB)],
          ),
        ),
      ),
      DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(-1.1, .4),
            radius: .85,
            colors: [Color(0x887ED4DC), Color(0x007ED4DC)],
          ),
        ),
      ),
      DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(.8, 1.1),
            radius: .65,
            colors: [Color(0x99E5ACCE), Color(0x00E5ACCE)],
          ),
        ),
      ),
    ],
  );
}
