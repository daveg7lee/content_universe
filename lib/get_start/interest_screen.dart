import 'package:content_universe/constants/gaps.dart';
import 'package:content_universe/constants/sizes.dart';
import 'package:content_universe/get_start/interest_button.dart';
import 'package:content_universe/main/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const interests = [
  "서울",
  "부산",
  "인천",
  "대구",
  "울산",
  "광주",
  "경산",
  "바다",
  "산",
  "풍경",
  "아무거나",
];

class InterestScreen extends StatefulWidget {
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _showTitle = false;

  void _onPress() {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const HomepageScreen()),
        (route) => false);
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onScaffoldTap() {
      FocusScope.of(context).unfocus();
    }

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
                  Gaps.v40,
                  Wrap(
                    runSpacing: 15,
                    spacing: 15,
                    children: [
                      for (var interest in interests)
                        InterestButton(interest: interest)
                    ],
                  ),
                ],
              ),
            ),
          ),
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
