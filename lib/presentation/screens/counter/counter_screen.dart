import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(isDarkModeProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Counter Screen"),
          actions: [
            IconButton(
              icon: isDarkMode
                  ? Icon(Icons.dark_mode)
                  : Icon(Icons.light_mode_outlined),
              onPressed: () {
                ref.read(themeNotifierProvider.notifier).toggleDarkMode();

                // ref.read(isDarkModeProvider.notifier).state = !isDarkMode;
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Counter: $counter",
                  style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ref.read(counterProvider.notifier).state++;
          },
          child: Icon(Icons.add),
        ));
  }
}
