import 'package:content_universe/constants/sizes.dart';
import 'package:content_universe/get_start/tutorial_screen.dart';
import 'package:flutter/cupertino.dart';
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

class TravelPlanScreen extends StatefulWidget {
  final List<TravelPlan> selectedTracks; // List of TravelPlan objects

  const TravelPlanScreen({
    Key? key,
    required this.selectedTracks,
  }) : super(key: key);

  @override
  State<TravelPlanScreen> createState() => _TravelPlanScreenState();
}

class _TravelPlanScreenState extends State<TravelPlanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suggested tuorist attractions"),
      ),
      body: ListView.builder(
        itemCount: widget.selectedTracks.length,
        itemBuilder: (context, index) {
          final track = widget.selectedTracks[index];
          return ListTile(
            title: Text(
              track.route,
              style: const TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.normal,
              ),
            ),
            subtitle: Text(
              "Time: ${track.time}, Price: \$${track.price.toStringAsFixed(2)}",
            ),
          );
        },
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
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const TutorialScreen(),
                ),
              );
            },
            color: Colors.blue,
            child: const Text(
              "Next",
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
