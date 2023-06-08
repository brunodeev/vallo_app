import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vallo_app/models/page_manager.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PageManager(),
      child: Consumer<PageManager>(
        builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            title: const Text('Vallo'),
          ),
          body: model.currentScreen,
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
            ],
            currentIndex: model.currentTab,
            onTap: (int tab) {
              model.currentTab = tab;
            },
          ),
        ),
      ),
    );
  }
}
