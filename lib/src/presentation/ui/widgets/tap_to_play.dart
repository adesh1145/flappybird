import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TapToPlay extends StatelessWidget {
  const TapToPlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 0.2),
      child: IgnorePointer(
        child: const Text(
          'TAP TO PLAY',
          style: TextStyle(
            fontFamily: 'Chewy',
            color: Color(0xFF2387FC),
            fontWeight: FontWeight.bold,
            fontSize: 38,
            letterSpacing: 4,
          ),
        )
            .animate(
              onPlay: (controller) => controller.repeat(
                reverse: true,
              ),
            )
            .scale(
              begin: const Offset(1.0, 1.0),
              end: const Offset(1.2, 1.2),
              duration: const Duration(milliseconds: 500),
            ),
      ),
    );
  }
}
