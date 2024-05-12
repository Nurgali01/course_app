
import 'package:flutter/material.dart';

class GradientBackground extends StatelessWidget {
  const GradientBackground({
    required this.child,
    required this.image,
    Key? key, // Added the correct syntax for the key
  });

  final Widget child;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(), // Fixed typo in "expand"
      decoration: BoxDecoration(
        image: DecorationImage( // Changed AssetImage to DecorationImage
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}


