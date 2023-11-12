import 'package:content_universe/constants/gaps.dart';
import 'package:content_universe/constants/sizes.dart';
import 'package:content_universe/train/plan.dart';
import 'package:flutter/material.dart';

const interests = [
  'Seomyeon Station',
  'Haeundae Station',
  'Jagalchi Station',
  'Centum City Station',
  'Nampo Station',
  'Gwangan Station',
  'Dongnae Station',
  'Suyeong Station',
  'Pusan National University Station',
  'Beomnaegol Station',
  'Busan KTX Station',
  'Hadan Station',
  'Yangsan Station',
  'Seobusan Yutongjigu Station',
  'Jangsan Station',
  'Buam Station',
  'Myeongnyun Station',
  'Minam Station',
  'Hadan Station',
  'Deokcheon Station',
  'Gimhae International Airport Station',
  'Sasang Station',
  'Dadaepo Beach Station',
  'Suan Station',
];

class EndSpecificScreen extends StatefulWidget {
  const EndSpecificScreen({
    super.key,
  });

  @override
  State<EndSpecificScreen> createState() => _EndSpecificScreenState();
}

class _EndSpecificScreenState extends State<EndSpecificScreen> {
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
          .where(
            (interest) => interest.toLowerCase().contains(
                  query.toLowerCase(),
                ),
          )
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
            child: const Text("Choose Your Specific Destination"),
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
                    "Selected Specific Destination",
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
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) => const PlanScreen(),
                                  ),
                                  (route) => false);
                            },
                            child: AnimatedContainer(
                              duration: const Duration(microseconds: 300),
                              padding: const EdgeInsets.symmetric(
                                vertical: Sizes.size14,
                                horizontal: Sizes.size20,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  Sizes.size32,
                                ),
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.05),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.05),
                                    blurRadius: 5,
                                    spreadRadius: 5,
                                  ),
                                ],
                              ),
                              child: Text(
                                interest,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
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
