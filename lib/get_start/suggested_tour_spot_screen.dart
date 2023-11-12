import 'package:flutter/material.dart';

class TravelPlan {
  final String route;
  final String time;
  final double price;

  TravelPlan({
    required this.route,
    required this.time,
    required this.price,
  });
}

class TravelPlanScreen extends StatelessWidget {
  final List<TravelPlan> selectedTracks; // List of TravelPlan objects

  const TravelPlanScreen({
    Key? key,
    required this.selectedTracks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Travel Plan Details"),
      ),
      body: ListView.builder(
        itemCount: selectedTracks.length,
        itemBuilder: (context, index) {
          final track = selectedTracks[index];
          return ListTile(
            title: Text(track.route),
            subtitle: Text(
              "Time: ${track.time}, Price: \$${track.price.toStringAsFixed(2)}",
            ),
          );
        },
      ),
    );
  }
}
