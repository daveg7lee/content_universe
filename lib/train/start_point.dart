import 'package:content_universe/constants/gaps.dart';
import 'package:content_universe/constants/sizes.dart';
import 'package:content_universe/train/interest_button.dart';
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

class StartPointScreen extends StatefulWidget {
  const StartPointScreen({
    super.key,
  });

  @override
  State<StartPointScreen> createState() => _StartPointScreenState();
}

class _StartPointScreenState extends State<StartPointScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;
  final TextEditingController _searchController = TextEditingController();
  List<String> filteredInterests = List.from(interests);
  List<String> selectedInterests = [];

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
                    "Where do you want to start?",
                    style: TextStyle(
                      fontSize: Sizes.size32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v20,
                  TextField(
                    controller: _searchController,
                    onChanged: onSearchTextChanged,
                    decoration: const InputDecoration(
                      labelText: 'Search',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                  Gaps.v20,
                  ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(15), // Optional padding
                    children: [
                      for (var interest in filteredInterests)
                        Container(
                          margin: const EdgeInsets.only(
                              bottom:
                                  15), // Adjust the margin to control spacing
                          child: InterestButton(
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
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
