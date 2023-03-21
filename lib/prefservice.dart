import 'package:shared_preferences/shared_preferences.dart';

import './models.dart';

class PreferencesService {
  Future saveSettings(Settings settings) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('username', settings.username);
    await preferences.setInt('gender', settings.gender.index);
    await preferences.setStringList('genrepreference',
        settings.genrePreference.map((pref) => pref.index.toString()).toList());
  }

  Future<Settings> getSettings() async {
    final preferences = await SharedPreferences.getInstance();
    final username = preferences.getString('username');
    final gender = Gender.values[preferences.getInt('gender') ?? 0];
    final genrePreferenceIndex = preferences.getStringList('genrepreference');

    final genrePreference = genrePreferenceIndex!
        .map((stringIndex) => GenrePreference.values[int.parse(stringIndex)])
        .toSet();

    return Settings(username!, gender, genrePreference);
  }
}
