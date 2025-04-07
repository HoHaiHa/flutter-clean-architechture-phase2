import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/theme_repository.dart';
import '../../shared/utils/logger.dart';

@Injectable(as: ThemeRepository)
class ThemeRepositoryImpl extends ThemeRepository {
  ThemeRepositoryImpl();

  @override
  Future<String> checkCurrentTheme() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('currentTheme') ?? '';
  }

  @override
  Future<bool> rememberTheme(String currentTheme) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('currentTheme', currentTheme);
      return true;
    }
    catch (e) {
      logger.d('co loi khi remember theme $e');
      return false;
    }
  }
}