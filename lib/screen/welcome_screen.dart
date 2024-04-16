import 'package:demo_app/screen/signin_screen.dart';
import 'package:demo_app/screen/signup_screen.dart';
import 'package:demo_app/theme/theme.dart';
import 'package:demo_app/widgets/custom_scaffold.dart';
import 'package:demo_app/widgets/welcome_button.dart';
import 'package:flutter/material.dart';

import '../widgets/navbar_roots.dart';
import 'questions.dart';

// import 'package:login_signup/screens/signin_screen.dart';
// import 'package:login_signup/screens/signup_screen.dart';
// import 'package:login_signup/theme/theme.dart';
// import 'package:login_signup/widgets/custom_scaffold.dart';
// import 'package:login_signup/widgets/welcome_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // get child => null;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child: Column(
        children: [
          const SizedBox(height: 15),
          Align(
            alignment:Alignment.centerRight,
          child: TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuestionPage()));
              },
              child: const Text(
                "SKIP",
                style: TextStyle(color: Colors.white, fontSize: 20),
              )),
          ),
          Flexible(
              flex: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 40.0,
                ),
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Companion App\n',
                            style: TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w600,
                            )),
                        TextSpan(
                            text:
                                '\nHere we are to take care of your mental health!',
                            style: TextStyle(
                              fontSize: 20,
                              // height: 0,
                            ))
                      ],
                    ),
                  ),
                ),
              )),
          Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  const Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign in',
                      onTap: SignInScreen(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'Sign up',
                      onTap: const SignUpScreen(),
                      color: Colors.white,
                      textColor: lightColorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
