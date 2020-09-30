import 'package:shared_preferences/shared_preferences.dart';

class SharedStorage {
  Future<SharedPreferences> _sharedPreference;

  SharedStorage() {
    _sharedPreference = SharedPreferences.getInstance();
  }
  Future<int> getCountFavoritePref() async {
    return _sharedPreference.then((prefs) {
      return prefs.getInt("countFavorite") == null
          ? 0
          : prefs.getInt("countFavorite");
    });
  }

  Future<void> setCountFavoritePref(int countFavorite) async {
    return _sharedPreference.then((prefs) {
      prefs.setInt("countFavorite", countFavorite);
    });
  }

  getcheckFavoritePref(String id) {
    return _sharedPreference.then((prefs) {
      return prefs.getBool("checkFavorite$id") == null
          ? false
          : prefs.getBool("checkFavorite$id");
    });
  }

  Future<void> setCheckFavoritePref(String id, bool checkFavorite) async {
    return _sharedPreference.then((prefs) {
      prefs.setBool("checkFavorite$id", checkFavorite);
    });
  }
}
