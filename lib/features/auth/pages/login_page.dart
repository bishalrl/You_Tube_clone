import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:you_tube_clone/features/auth/repository/auth_service.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 242, 242),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 35,
              ),
              child: Image.asset(
                "assets/images/youtube-signin.jpg",
                height: 150,
              ),
            ),
            Text(
              "Welcome To Youtube ",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 55),
              child: GestureDetector(
                child: Image.asset(
                  "assets/images/signinwithgoogle.png",
                  height: 60,
                ),
                onTap: () async {
                  await ref.read(AuthServiceProvider).signinwithgoogle();
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
