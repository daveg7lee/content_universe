import 'package:content_universe/constants/gaps.dart';
import 'package:content_universe/constants/sizes.dart';
import 'package:content_universe/train/complete.dart';
import 'package:flutter/material.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({Key? key}) : super(key: key);

  @override
  _PlanScreenState createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  String? selectedTrain;
  bool isPlanSelected = false;
  bool isHovered = false;

  // Replace this with your actual train data
  final List<Map<String, dynamic>> trainData = [
    {'name': 'KTX', 'time': '09:00 AM', 'price': '\$30'},
    {'name': 'Saemaeul', 'time': '10:30 AM', 'price': '\$20'},
    {'name': 'Mugunghwa', 'time': '12:00 PM', 'price': '\$15'},
    {'name': 'KTX', 'time': '01:30 PM', 'price': '\$35'},
    {'name': 'Saemaeul', 'time': '03:15 PM', 'price': '\$25'},
    {'name': 'Mugunghwa', 'time': '05:45 PM', 'price': '\$18'},
    {'name': 'KTX', 'time': '07:30 PM', 'price': '\$40'},
    {'name': 'Saemaeul', 'time': '09:00 PM', 'price': '\$28'},
    {'name': 'Mugunghwa', 'time': '10:45 PM', 'price': '\$20'},
    {'name': 'KTX', 'time': '12:15 AM', 'price': '\$32'},
    {'name': 'Saemaeul', 'time': '02:30 AM', 'price': '\$22'},
    {'name': 'Mugunghwa', 'time': '04:00 AM', 'price': '\$17'},
    {'name': 'KTX', 'time': '06:45 AM', 'price': '\$38'},
    {'name': 'Saemaeul', 'time': '08:15 AM', 'price': '\$27'},
    {'name': 'Mugunghwa', 'time': '10:30 AM', 'price': '\$19'},
    // Add more train options for KTX, Saemaeul, and Mugunghwa as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Choose your plan",
                style: TextStyle(
                  fontSize: Sizes.size32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // Change the color to your preference
                ),
              ),
            ),
            DropdownButton<String>(
              value: selectedTrain,
              hint: const Text('Select a train'),
              onChanged: (String? value) {
                setState(() {
                  selectedTrain = value;
                  isPlanSelected = false;
                });
              },
              items: ['KTX', 'Saemaeul', 'Mugunghwa'].map((String trainName) {
                return DropdownMenuItem<String>(
                  value: trainName,
                  child: Text(trainName),
                );
              }).toList(),
            ),
            Gaps.h24,
            Expanded(
              child: ListView.builder(
                itemCount: trainData.length,
                itemBuilder: (context, index) {
                  final train = trainData[index];
                  return Visibility(
                    visible: selectedTrain == train['name'],
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTrain = train['name'];
                          isPlanSelected = !isPlanSelected;
                        });
                      },
                      child: MouseRegion(
                        onEnter: (_) {
                          setState(() {
                            isHovered = true;
                          });
                        },
                        onExit: (_) {
                          setState(() {
                            isHovered = false;
                          });
                        },
                        child: Card(
                          elevation: isHovered ? 8 : 3,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 8,
                          ),
                          child: ListTile(
                            title: Text(train['name']),
                            subtitle:
                                Text('${train['time']} - ${train['price']}'),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            if (isPlanSelected)
              Card(
                elevation: 3,
                margin: const EdgeInsets.all(16),
                child: ListTile(
                  title: Text(
                    selectedTrain!,
                    style: const TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue, // Change the color to your preference
                    ),
                  ),
                  subtitle: Text(
                    '${trainData.firstWhere((train) => train['name'] == selectedTrain!)['time']} - ${trainData.firstWhere((train) => train['name'] == selectedTrain!)['price']}',
                    style: const TextStyle(
                      fontSize: Sizes.size20,
                      color:
                          Colors.black54, // Change the color to your preference
                    ),
                  ),
                ),
              ),
            if (isPlanSelected)
              Padding(
                padding: const EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const CompleteScreen(),
                        ),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    backgroundColor:
                        Colors.blue, // Change the color to your preference
                  ),
                  child: const Text(
                    'Next',
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
