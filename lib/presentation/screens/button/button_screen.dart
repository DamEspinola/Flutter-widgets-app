import 'package:flutter/material.dart';

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buttons title"),
      ),
      body: _ButtonsView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back),
      ),
    );
  }
}


class _ButtonsView extends StatelessWidget {
  const _ButtonsView();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Wrap(
          spacing: 10,
          alignment: WrapAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text("Elevated Button"),
            ),
            FilledButton(onPressed: (){}, child: Text("Filled button")),
            FilledButton.icon(onPressed: (){}, label: Text("Filled button"), icon: Icon(Icons.access_alarm),),
            TextButton(
              onPressed: () {},
              child: Text("Text Button"),
            ),
            OutlinedButton(
              onPressed: () {},
              child: Text("Outlined Button"),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Elevated Button Icon"),
            ),
            TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Text Button Icon"),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text("Outlined Button Icon"),
            ),
          
          const CustomButton(),
            
            IconButton(onPressed: (){},
              icon: Icon(Icons.app_registration_outlined),
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(color.primary),
                iconColor: WidgetStatePropertyAll(Colors.white))

                ,)
          ],
        ),
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Material(
        color: colors.primary,
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text("Hello world", style: TextStyle(color: Colors.white),),
          ),
        ),
      ),
    );
  }
}