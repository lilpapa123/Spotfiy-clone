import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sptiy_grand/common/widgets/appbar/app_bar.dart';
import 'package:sptiy_grand/common/widgets/button/basic_app_button.dart';
import 'package:sptiy_grand/core/configs/assets/app_vectors.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signInText(context),
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.spotifyLogoSvg,
          width: 30,
          height: 30,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(height: 20),
            _fullNameFiled(context),
            const SizedBox(height: 20),
            _emilFiled(context),
            const SizedBox(height: 20),
            _passwordFiled(context),
            const SizedBox(height: 20),
            BasicAppButton(title: "Create Account", onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "Register",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameFiled(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: "Full Name",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emilFiled(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: "Enter Email",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordFiled(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        hintText: "Enter Password",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signInText(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Do you have an Account? ",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          TextButton(onPressed: () {}, child: Text("Sign In")),
        ],
      ),
    );
  }
}
