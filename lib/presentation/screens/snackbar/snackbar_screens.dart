import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreens extends StatelessWidget {
  const SnackbarScreens({super.key});

  void showCustomSnackbar( BuildContext context ){
   
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text("Hello World"),
      action: SnackBarAction(label: "Ok!", onPressed: (){}),
      duration: Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('Título del diálogo'),
        content: Text('Contenido del diálogo'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: Text('Cancelar')),
          TextButton(onPressed: () => context.pop(), child: Text('Aceptar')),
        ],
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Snackbar y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(onPressed: (){
              showAboutDialog(context: context,
              children: [
                Text('Aplicación de ejemplo de uso de Snackbars y Diálogos')
              ]);
            },
             child: Text('Licencia usadas')),
            FilledButton.tonal(onPressed: () => openDialog(context), child: Text('Mostrar Diálogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: () => showCustomSnackbar(context), icon:  Icon(Icons.remove_red_eye_outlined), label: Text('Mostrar Snackbar')),
    );
  }
}