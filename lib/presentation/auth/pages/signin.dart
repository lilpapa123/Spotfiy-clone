import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sptiy_grand/common/widgets/appbar/app_bar.dart';
import 'package:sptiy_grand/common/widgets/button/basic_app_button.dart';
import 'package:sptiy_grand/core/configs/assets/app_vectors.dart';
import 'package:sptiy_grand/data/models/auth/signin_user_req.dart';
import 'package:sptiy_grand/domain/usecase/auth/signin.dart';
import 'package:sptiy_grand/presentation/auth/pages/signup.dart';
import 'package:sptiy_grand/presentation/root/pages/root.dart';
import 'package:sptiy_grand/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signinText(context),
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
            _emilFiled(context),
            const SizedBox(height: 20),
            _passwordFiled(context),
            const SizedBox(height: 20),
            BasicAppButton(
              title: "Sign In",
              onPressed: () async {
                var result = await sl<SigninCase>().call(
                  params: SigninUserReq(
                    email: _email.text.toString(),
                    password: _password.text.toString(),
                  ),
                );
                result.fold(
                  (l) {
                    var snackBar = SnackBar(content: Text(l));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  (r) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => RootPage()),
                      (route) => false,
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      "SignIn",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      textAlign: TextAlign.center,
    );
  }

  Widget _emilFiled(BuildContext context) {
    return TextFormField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: "Enter Email",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordFiled(BuildContext context) {
    return TextFormField(
      controller: _password,
      decoration: const InputDecoration(
        hintText: "Enter Password",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Not A Member? ",
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignupPage()),
              );
            },
            child: Text("Rigster Now"),
          ),
        ],
      ),
    );
  }
}
