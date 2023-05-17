import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _muteAudio = false;

  void _toggleAudio() {
    setState(() {
      _muteAudio = !_muteAudio;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Audio',
              style: TextStyle(fontSize: 24),
            ),
            SwitchListTile(
              title: const Text('Mute Audio'),
              value: _muteAudio,
              onChanged: (value) {
                setState(() {
                  _muteAudio = value;
                });
              },
            ),
            const SizedBox(height: 20),
            const Text(
              'Credits',
              style: TextStyle(fontSize: 24),
            ),
            const Text(
              'Coloque seu nome',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
