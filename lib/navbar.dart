import 'package:flutter/material.dart';
import './appText.dart';
import './settings.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.teal.shade50,
      child: ListView(
        children: [
          const Card(
            child: Icon(
              Icons.category,
              size: 60,
              color: Colors.amber,
            ),
          ),
          const Card(
            elevation: 8,
            child: Center(
              child: myAppText(text: '', color: Colors.black, size: 40),
            ),
          ),
          const Divider(),
          ListTile(
              tileColor: Colors.lightBlue,
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => SettingsPage()),
                  ),
                );
              }),
          ListTile(
            tileColor: Colors.lightBlue,
            leading: const Icon(Icons.credit_score_outlined),
            title: const Text('Credits'),
            // ignore: avoid_returning_null_for_void
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}
