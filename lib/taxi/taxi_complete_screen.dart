import 'package:content_universe/constants/sizes.dart';
import 'package:content_universe/taxi/receipt.screen.dart';
import 'package:flutter/material.dart';

class TaxiCompleteScreen extends StatelessWidget {
  const TaxiCompleteScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set your desired background color
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(
              Sizes.size20), // Add padding inside the container
          decoration: BoxDecoration(
            color: Colors.white, // Set your desired container background color
            borderRadius: BorderRadius.circular(
                Sizes.size16), // Set border radius if needed
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your reservation has been completed.",
                textAlign: TextAlign.center, // Center text horizontally
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Set your desired text color
                ),
              ),
              const SizedBox(height: Sizes.size20),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => TaxiReceipt(
                          passengerName: "James",
                          pickupLocation: "Busan",
                          dropOffLocation: "Seoul",
                          fareAmount: 12,
                          dateTime: DateTime.now(),
                        ),
                      ),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.blue, // Set your desired button background color
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size20,
                    vertical: Sizes.size12,
                  ),
                ),
                child: const Text(
                  "Get Receipt",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
