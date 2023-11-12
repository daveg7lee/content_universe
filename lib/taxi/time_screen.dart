import 'package:content_universe/taxi/place_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({Key? key}) : super(key: key);

  @override
  _TimeScreenState createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  final TextEditingController _passengerController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
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
              "Select a Date",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo, // Set your desired text color
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _selectDate(context);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors
                      .white, // Set your desired text field background color
                ),
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${_selectedDate.toLocal()}".split(' ')[0],
                      style: const TextStyle(fontSize: 18),
                    ),
                    const Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            if (_passengerError != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _passengerError!,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final enteredDate = _selectedDate;
                if (enteredDate.isAfter(DateTime.now())) {
                  // Valid input, proceed to the next screen or perform necessary actions
                  _passengerError = null;
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PlaceScreen(),
                    ),
                  );
                } else {
                  // Invalid input, show error message
                  setState(() {
                    _passengerError = "Please select a future date.";
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

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != _selectedDate) {
      setState(() {
        _selectedDate = picked!;
      });
    }
  }

  @override
  void dispose() {
    _passengerController.dispose();
    super.dispose();
  }
}
