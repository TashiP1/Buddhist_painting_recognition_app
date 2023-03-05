import 'package:flutter/material.dart';

class help extends StatefulWidget {
  const help({super.key});

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(225, 232, 104, 32),
      ),
       body: const Center(
        child: Text(
          'Help section',
          style: TextStyle(fontSize: 20),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(225, 232, 104, 32),
              ),
              child: Text(
                'Navigation Drawer',
                style: TextStyle(fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' About us '),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text(' Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.rate_review),
              title: const Text(' Rate us'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}