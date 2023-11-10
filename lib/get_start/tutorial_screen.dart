import 'package:content_universe/constants/gaps.dart';
import 'package:content_universe/constants/sizes.dart';
import 'package:content_universe/main/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TutorialScreen extends StatelessWidget {
  const TutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350.0,
                child: Text(
                  "Language Barrier? Not here!",
                  style: TextStyle(
                    fontSize: Sizes.size36,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              Gaps.v20,
              SizedBox(
                width: 350,
                child: Text(
                  "We will match you with the perfect drivers",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: Sizes.size20,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: Sizes.size40,
            top: Sizes.size16,
            left: Sizes.size24,
            right: Sizes.size24,
          ),
          child: CupertinoButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const Homepage()),
                  (route) => false);
            },
            color: Colors.blue,
            child: const Text(
              "Get Start!",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Sizes.size20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
