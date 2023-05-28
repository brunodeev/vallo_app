import 'package:flutter/material.dart';
import 'package:vallo_app/constants/constant_colors.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  final PageController pageController = PageController();
  int currentIndex = 0;

  List pages = [
    Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/images/icon_vallo_transparent.png',
            scale: 12,
          ),
        ),
        backgroundColor: kSecondaryColor,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 150,
                color: Colors.blueAccent,
              ),
              Container(
                height: 200,
                width: 150,
                color: Colors.blueAccent,
              ),
              Container(
                height: 200,
                width: 150,
                color: Colors.blueAccent,
              ),
              Container(
                height: 200,
                width: 150,
                color: Colors.blueAccent,
              ),
              Container(
                height: 200,
                width: 150,
                color: Colors.blueAccent,
              ),
            ],
          ),
        )),
    Container(
      color: Colors.green,
    ),
    Container(
      color: Colors.blue,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        elevation: 2,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
