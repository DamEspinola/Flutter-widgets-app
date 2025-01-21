import 'package:flutter/material.dart';

class ProgressScreens extends StatelessWidget {
  const ProgressScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Screens'),
      ),
      body: _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 10),
          Text("Circular progress indicator"),
          SizedBox(height: 20),
          CircularProgressIndicator(strokeWidth: 2),
          SizedBox(height: 30),
          Text("Controlled progress indicator"),
          _ControlledProgressIndicator()
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value){
        return (value * 2) / 100;
      }).takeWhile((value) => value < 100),
      builder: (context, snapshot) {
        final progressValue = snapshot.data ?? 0.0;
        return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(value: progressValue, strokeWidth: 2),
                const SizedBox(width: 20),
                Expanded(
                  child: LinearProgressIndicator(value: progressValue),
                )
              ],
            ));
      }
    );
  }
}
