import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../shared/create_appbar.dart';
import '../../shared/dialog.dart';
import '../engagement/engagement.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar("Team River", context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            "assets/animations/social-media.json",
            fit: BoxFit.cover,
          ),
          ElevatedButton(
            onPressed: () {
              dialog(context, () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Engagement()));
              });
            },
            child: const Text(
              "Create Post",
            ),
          )
        ],
      ),
    );
  }
}
