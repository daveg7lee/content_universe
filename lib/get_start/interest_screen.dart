import 'package:content_universe/constants/gaps.dart';
import 'package:content_universe/constants/sizes.dart';
import 'package:content_universe/get_start/interest_button.dart';
import 'package:content_universe/main/plan_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const interests = [
  "Seoul",
  "Busan",
  "Incheon",
  "Daegu",
  "Gwangju",
  "Daejeon",
  "Suwon",
  "Ulsan",
  "Tongjin",
  "Goyang",
  "Changwon",
  "Seongnam",
  "Bucheon",
  "Cheongju",
  "Yanggok",
  "Ansan",
  "Cheonan",
  "Jeonju",
  "Anyang",
  "Kimhae",
  "Pohang",
  "Pyeongtaek",
  "Jeju",
  "Masan",
  "Siheung",
  "Uijeongbu",
  "Paju",
  "Kumi",
  "Gimpo",
  "Yeosu",
  "Chinju",
  "Asan",
  "Wonju",
  "Gwangmyeongni",
  "Asan",
  "Gwangju",
  "Iksan",
  "Yangsan",
  "Gunpo",
  "Chuncheon",
  "Gyeongsan",
  "Kunsan",
  "Yeosu",
  "Suncheon",
  "Gongju",
  "Mokpo",
  "Osan",
  "Gangneung",
  "Chungju",
  "Incheon",
  "Sejong",
  "Anseong",
  "Guri",
  "Sosan",
  "Pocheon",
  "Andong",
  "Uiwang",
  "Hanam",
  "Seogwipo",
  "Gwangyang",
  "Jicheon",
  "Chungmu",
  "Chechon",
  "Noksan",
  "Tangjin",
  "Sachon",
  "Sa-chon",
  "Hosan",
  "Jeonghae",
  "Yoju",
  "Yongju",
  "Miryang",
  "Sangju",
  "Boryeong",
  "Hongseong",
  "Muan",
  "Dongducheon",
  "Naju",
  "Kimje",
  "Sokcho",
  "Mungyong",
  "Samchok",
  "Pongnam",
  "Gwacheon",
  "Haeryong",
  "Taebaek",
  "Jeomchon",
  "Yeonil",
  "Heunghae",
  "Angang",
  "Munsan",
  "Hayang",
  "Hallim",
  "Kujwa",
  "Ulchin",
  "Daean",
  "Sapkyo",
  "Eumseong",
  "Guryongpo",
  "Seosaeng",
  "Pyongchang",
];

class InterestScreen extends StatefulWidget {
  const InterestScreen({
    super.key,
  });

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;
  final TextEditingController _searchController = TextEditingController();
  List<String> filteredInterests = List.from(interests);
  List<String> selectedInterests = [];

  void _onPress() {
    if (selectedInterests.isNotEmpty) {
      List<TravelPlan> selectedTracks = [];

      // Create TravelPlan objects for each selected interest
      for (int i = 0; i < selectedInterests.length; i++) {
        selectedTracks.add(
          TravelPlan(
            route: selectedInterests[i],
            time: "2 hours", // Set your desired time
            price: 55.0, // Set your desired price
          ),
        );
      }

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TravelPlanScreen(
            selectedTracks: selectedTracks,
          ),
        ),
      );
    } else {
      // Show an error message or prevent navigation
      // For example, you can display a snackbar with an error message:
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please select at least one interest.'),
        ),
      );
    }
  }

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (_showTitle = true) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      _onScroll();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  void onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void onSearchTextChanged(String query) {
    setState(() {
      filteredInterests = interests
          .where((interest) =>
              interest.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: AnimatedOpacity(
            duration: const Duration(microseconds: 300),
            opacity: _showTitle ? 1 : 0,
            child: const Text("Choose Your Interest"),
          ),
        ),
        body: Scrollbar(
          controller: _scrollController,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Padding(
              padding: const EdgeInsets.only(
                left: Sizes.size24,
                right: Sizes.size24,
                bottom: Sizes.size16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gaps.v32,
                  const Text(
                    "Choose Your Interest",
                    style: TextStyle(
                      fontSize: Sizes.size40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  const Text(
                    "Get better travel recommendations",
                    style: TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gaps.v20,
                  TextField(
                    controller: _searchController,
                    onChanged: onSearchTextChanged,
                    decoration: const InputDecoration(
                      labelText: 'Search Interests',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  Gaps.v20,
                  Wrap(
                    runSpacing: 15,
                    spacing: 15,
                    children: [
                      for (var interest in filteredInterests)
                        InterestButton(
                          interest: interest,
                          isSelected: selectedInterests.contains(interest),
                          onTap: (isSelected) {
                            if (isSelected) {
                              selectedInterests.add(interest);
                            } else {
                              selectedInterests.remove(interest);
                            }
                            setState(() {}); // Trigger a rebuild
                          },
                        )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: Sizes.size24,
              top: Sizes.size16,
              left: Sizes.size24,
              right: Sizes.size24,
            ),
            child: CupertinoButton(
              onPressed: _onPress,
              color: Theme.of(context).primaryColor,
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
      ),
    );
  }
}
