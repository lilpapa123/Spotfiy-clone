import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sptiy_grand/core/configs/assets/app_vectors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: SvgPicture.asset(AppVectors.spotifyLogoSvg),
        ),
      ),
    );
  }
}
