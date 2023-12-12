import 'package:flutter/material.dart';
import 'package:home_automation_system/Models/User.dart';

import '../IssueTraking/IssueTrakerPage.dart';

class HomePage extends StatefulWidget {
  final User? user;
  const HomePage({super.key, this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // The index of the selected tab in the BottomNavigationBar

  // List of widget pages to navigate through the bottom navigation bar
  final List<Widget> _pages = [
    const IssueTrackerScreen(), // The issue tracker page widget
    const WidgetPlaceholder(), // Replace with actual widget for second tab
    const WidgetPlaceholder(), // Replace with actual widget for third tab
    // Add more widgets if you have more items
  ];

  // Function to handle on tap on the bottom navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue[800],
        onTap: _onItemTapped,
      ),
    );
  }
}

// Placeholder widget to demonstrate navigation
class WidgetPlaceholder extends StatelessWidget {
  const WidgetPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Placeholder Widget'),
    );
  }
}
