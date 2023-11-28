import 'package:flutter/animation.dart';

Tween<Offset> slideAnimation() {
  return Tween<Offset>(
    begin: const Offset(0, 1), // Start below the visible screen
    end: Offset.zero,
  );
}
Tween<Offset> slideAnimation2() {
  return Tween<Offset>(
    begin: const Offset(0, -1), // Start below the visible screen
    end: Offset.zero,
  );
}
Tween<Offset> slideAnimationTopTOBottom() {
  return Tween<Offset>(
    begin: Offset(0, -1), // Start from the top
    end: Offset(0, 0),
  );
}
Duration animateDuration() => const Duration(milliseconds: 500);
Duration animateDuration1000() => const Duration(milliseconds: 1000);