import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sptiy_grand/common/widgets/button/basic_app_button.dart';
import 'package:sptiy_grand/core/configs/assets/app_images.dart';
import 'package:sptiy_grand/core/configs/assets/app_vectors.dart';
import 'package:sptiy_grand/core/configs/theme/app_colors.dart';
import 'package:sptiy_grand/presentation/choose_page/pages/choose_page.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image filling the entire screen
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AppImages.introBG),
                ),
              ),
            ),
          ),

          // Semi-transparent overlay filling the entire screen
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.15)),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(
                    // Corrected from AppVectors.logo
                    AppVectors.spotifyLogoSvg,
                  ),
                ),
                const Spacer(),
                const Text(
                  'Enjoy Listening To Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 21),
                const Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30), // Add some space before the button
                BasicAppButton(
                  title: 'Get Started',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChoosePage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20), // Add some space after the button
              ],
            ),
          ),
        ],
      ),
    );
  }
}
