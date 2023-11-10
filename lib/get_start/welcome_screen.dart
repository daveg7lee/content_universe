import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:content_universe/constants/sizes.dart';
import 'package:content_universe/get_start/interests/interest_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  void _onPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 250.0,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Agne',
                    color: Colors.black,
                  ),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Find Your Path Right Now',
                        speed: const Duration(
                          milliseconds: 100,
                        ),
                      ),
                      TypewriterAnimatedText(
                        'Discover the hidden beauties in Korea',
                        speed: const Duration(
                          milliseconds: 100,
                        ),
                      ),
                      TypewriterAnimatedText(
                        'A guide that takes you from the beginnig to the end',
                        speed: const Duration(
                          milliseconds: 100,
                        ),
                      ),
                    ],
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
              _onPressed();
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
