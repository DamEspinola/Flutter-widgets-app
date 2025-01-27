
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';
 
 // listado para colores inmutables
final colorListProvider = Provider((ref) => colorsList);

final isDarkModeProvider = StateProvider((ref) => false);

final selectedColorProvider = StateProvider((ref) => 0 );

// Un objeto de tipo AppTheme (custom)

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref)=> ThemeNotifier() );

// Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme> {
  
  // STATE = Estado = new AppTheme();
  ThemeNotifier(): super( AppTheme() );

  void toggleDarkMode(){
    state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);

  }
}