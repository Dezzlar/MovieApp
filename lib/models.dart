// ignore: constant_identifier_names
enum Gender { Female, Male, Other }

// ignore: constant_identifier_names
enum GenrePreference { Action, Adventure, Horror, Fantasy, Comedy }

class Settings {
  final String username;
  final Gender gender;
  final Set<GenrePreference> genrePreference;

  Settings(this.username, this.gender, this.genrePreference);
}
