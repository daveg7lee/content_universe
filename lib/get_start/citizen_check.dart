import 'package:content_universe/constants/sizes.dart';
import 'package:flutter/material.dart';

class CitizenCheckScreen extends StatelessWidget {
  const CitizenCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("ARE YOU CITIZEN?"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Where are you going?",
                style: TextStyle(
                  fontSize: Sizes.size36,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text("I am Non-citizen"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
