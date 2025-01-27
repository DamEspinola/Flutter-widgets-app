import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class ThemeChangerScreen extends ConsumerWidget {

   const ThemeChangerScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final bool isDarkMode = ref.watch(isDarkModeProvider);
    final bool isDarkMode = ref.watch(themeNotifierProvider).isDarkMode;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme changer"),
         actions: [
            IconButton(
              icon: isDarkMode
                  ? Icon(Icons.dark_mode)
                  : Icon(Icons.light_mode_outlined),
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();
                // ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
                // ref.read(isDarkModeProvider.notifier).update((state) => !state );
              },
            )
          ],
      ),
      body: _ThemeChangerView(),

    );
  }
}

class _ThemeChangerView extends ConsumerWidget {
  const _ThemeChangerView();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Color> colors = ref.watch(colorListProvider);

    // final int selectedColorIndex = ref.watch(selectedColorProvider);
    final int selectedColorIndex = ref.watch(themeNotifierProvider).selectedColor;

    return ListView.builder(
      itemCount: colors.length,
      itemBuilder:(context, index) {
        final Color color = colors[index];
        return RadioListTile(
          title: Text("Color:", style: TextStyle(color: color) ),
          subtitle: Text("${color.g}"),
          activeColor: color,
          value: index,
          groupValue: selectedColorIndex,
          onChanged: ( value ) => {
            ref.read(themeNotifierProvider.notifier).changeColorIndex(index)
            // ref.read(selectedColorProvider.notifier).state = index
            // ref.read(selectedColorProvider.notifier).update((state) => value!)
          });
      }, 
    );
  }
}