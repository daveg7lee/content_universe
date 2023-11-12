import 'package:flutter/material.dart';

class TaxiReceipt extends StatelessWidget {
  final String passengerName;
  final String pickupLocation;
  final String dropOffLocation;
  final double fareAmount;
  final DateTime dateTime;

  const TaxiReceipt({
    Key? key,
    required this.passengerName,
    required this.pickupLocation,
    required this.dropOffLocation,
    required this.fareAmount,
    required this.dateTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple, // Set your desired app bar color
      ),
      body: Center(
        child: Container(
          width: 400,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 10,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Taxi Receipt',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple, // Set your desired text color
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Passenger: $passengerName',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Text('Pickup Location: $pickupLocation'),
              Text('Drop-off Location: $dropOffLocation'),
              const SizedBox(height: 20),
              Text(
                'Expected Fare Amount: \$${fareAmount.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green, // Set your desired text color
                ),
              ),
              const SizedBox(height: 10),
              Text('Date and Time: ${dateTime.toString()}'),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Receipt saved or shared successfully!'),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.deepPurple, // Set your desired button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),
                ),
                child: const Text(
                  'Save/Share Receipt',
                  style: TextStyle(
                    fontSize: 18,
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

void main() {
  runApp(MaterialApp(
    home: TaxiReceipt(
      passengerName: 'John Doe',
      pickupLocation: '123 Main Street',
      dropOffLocation: '456 Park Avenue',
      fareAmount: 25.50,
      dateTime: DateTime.now(),
    ),
  ));
}
