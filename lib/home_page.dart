// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:meuapp/slide_title.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.7);

  // ignore: unused_field
  late int _currentPage = 0;

  final _listSlide = [
    {'id': 0, 'image': 'assets/images/img1.jpg'},
    {'id': 1, 'image': 'assets/images/img2.jpg'},
    {'id': 2, 'image': 'assets/images/img3.jpg'},
  ];

  @override
  void initState() {
    _pageController.addListener(() {
      int? next = _pageController.page?.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next!;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: _listSlide.length,
                    itemBuilder: (_, currentIndex) {
                      bool activePage = currentIndex == _currentPage;
                      return SlideTitle(
                        activePage: activePage,
                        image: _listSlide[currentIndex]['image'],
                      );
                    })),
            _buildBullets()
          ],
        ),
      ),
    );
  }

  Widget _buildBullets() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.black26),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.lightGreen),
          ),
          Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30), color: Colors.black26),
          ),
        ],
      ),
    );
  }
}
