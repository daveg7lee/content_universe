import 'package:content_universe/taxi/time_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PassengerScreen extends StatefulWidget {
  const PassengerScreen({Key? key}) : super(key: key);

  @override
  _PassengerScreenState createState() => _PassengerScreenState();
}

class _PassengerScreenState extends State<PassengerScreen> {
  final TextEditingController _passengerController = TextEditingController();
  String? _passengerError;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo, // Set your desired app bar color
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.indigo[50], // Set your desired background color
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "For how many passengers?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo, // Set your desired text color
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _passengerController,
              decoration: InputDecoration(
                hintText: "Maximum Number is 9",
                errorText: _passengerError,
                filled: true,
                fillColor: Colors
                    .white, // Set your desired text field background color
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'^[0-9]+$')),
              ],
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final enteredPassengers =
                    int.tryParse(_passengerController.text);
                if (enteredPassengers != null && enteredPassengers <= 4) {
                  // Valid input, proceed to the next screen or perform necessary actions
                  _passengerError = null;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const TimeScreen(),
                    ),
                  );
                } else {
                  // Invalid input, show error message
                  setState(() {
                    _passengerError = "Please enter a number between 1 and 9.";
                  });
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Colors.indigo, // Set your desired button background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                "Next",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _passengerController.dispose();
    super.dispose();
  }
}
