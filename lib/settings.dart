import 'package:app_movie/models.dart';
import 'package:app_movie/prefservice.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final _preferenceService = PreferencesService();
  final _usernameController = TextEditingController();
  var _selectedGender = Gender.Female;
  // ignore: prefer_collection_literals
  var _selectedGenre = Set<GenrePreference>();
  @override
  void initState() {
    super.initState();
    _populateField();
  }

  void _populateField() async {
    final settings = await _preferenceService.getSettings();
    setState(() {
      _usernameController.text = settings.username;
      _selectedGender = settings.gender;
      _selectedGenre = settings.genrePreference;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text('User Settings'),
      ),
      body: ListView(children: [
        ListTile(
          title: TextField(
            controller: _usernameController,
            decoration: const InputDecoration(labelText: 'Username'),
          ),
        ),
        RadioListTile(
          title: const Text('Female'),
          value: Gender.Female,
          groupValue: _selectedGender,
          onChanged: (newValue) => setState(
            () => _selectedGender = newValue!,
          ),
        ),
        RadioListTile(
          title: const Text('Male'),
          value: Gender.Male,
          groupValue: _selectedGender,
          onChanged: (newValue) => setState(
            () => _selectedGender = newValue!,
          ),
        ),
        RadioListTile(
          title: const Text('Other'),
          value: Gender.Other,
          groupValue: _selectedGender,
          onChanged: (newValue) => setState(
            () => _selectedGender = newValue!,
          ),
        ),
        Divider(),
        Container(
            child: const Center(
          child: Text(
            'Preference',
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        )),
        CheckboxListTile(
            title: const Text('Action'),
            value: _selectedGenre.contains(GenrePreference.Action),
            onChanged: (_) {
              setState(() {
                _selectedGenre.contains(GenrePreference.Action)
                    ? _selectedGenre.remove(GenrePreference.Action)
                    : _selectedGenre.add(GenrePreference.Action);
              });
            }),
        CheckboxListTile(
            title: const Text('Adventure'),
            value: _selectedGenre.contains(GenrePreference.Adventure),
            onChanged: (_) {
              setState(() {
                _selectedGenre.contains(GenrePreference.Adventure)
                    ? _selectedGenre.remove(GenrePreference.Adventure)
                    : _selectedGenre.add(GenrePreference.Adventure);
              });
            }),
        CheckboxListTile(
            title: const Text('Horror'),
            value: _selectedGenre.contains(GenrePreference.Horror),
            onChanged: (_) {
              setState(() {
                _selectedGenre.contains(GenrePreference.Horror)
                    ? _selectedGenre.remove(GenrePreference.Horror)
                    : _selectedGenre.add(GenrePreference.Horror);
              });
            }),
        CheckboxListTile(
            title: const Text('Fantasy'),
            value: _selectedGenre.contains(GenrePreference.Fantasy),
            onChanged: (_) {
              setState(() {
                _selectedGenre.contains(GenrePreference.Fantasy)
                    ? _selectedGenre.remove(GenrePreference.Fantasy)
                    : _selectedGenre.add(GenrePreference.Fantasy);
              });
            }),
        CheckboxListTile(
            title: const Text('Comedy'),
            value: _selectedGenre.contains(GenrePreference.Comedy),
            onChanged: (_) {
              setState(() {
                _selectedGenre.contains(GenrePreference.Comedy)
                    ? _selectedGenre.remove(GenrePreference.Comedy)
                    : _selectedGenre.add(GenrePreference.Comedy);
              });
            }),
        // ignore: sized_box_for_whitespace
        Container(
          height: 100,
          child: TextButton(
            onPressed: _saveSettings,
            child: const Text('Save Settings'),
          ),
        )
      ]),
    );
  }

  void _saveSettings() {
    final newSettings =
        Settings(_usernameController.text, _selectedGender, _selectedGenre);

    _preferenceService.saveSettings(newSettings);
  }
}
