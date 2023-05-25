import 'package:flutter/material.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: [
        Container(
          color: Colors.red,
          child: TextButton(
              onPressed: () {
                pageController.jumpToPage(1);
              },
              child: const Text(
                'Próximo',
                style: TextStyle(color: Colors.white),
              )),
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.blue,
        ),
      ],
    );
  }
}
