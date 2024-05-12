

import 'package:course_app/core/common/widgets/gradient_background.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../res/media_res.dart';

class PageUnderConsrtuction extends StatelessWidget {
  const PageUnderConsrtuction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        image: MediaRes.onBoardingBackground,
        child: Center(child: Lottie.asset(MediaRes.pageUnderConstruction)),
       ),
    );
  }
}