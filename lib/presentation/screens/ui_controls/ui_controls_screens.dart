import 'package:flutter/material.dart';

class UiControlsScreens extends StatelessWidget {
  const UiControlsScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UI Controls"),
      ),
      body: _UiControlsView(),
    );
  }
}

class _UiControlsView extends StatefulWidget {
  const _UiControlsView();

  @override
  State<_UiControlsView> createState() => _UiControlsViewState();
}

enum Transportation { car, bike, bus, train }

class _UiControlsViewState extends State<_UiControlsView> {
  bool isDeveloper = true;
  Transportation selectedTransportation = Transportation.car;
  bool wantsBreakfast = false;
  bool wantsLunch = false;
  bool wantsDinner = false;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const ClampingScrollPhysics(),
      children: [
        SwitchListTile(
            title: const Text("Developer Mode"),
            subtitle: const Text("Controles adicionales"),
            value: isDeveloper,
            onChanged: (value) {
              setState(() {
                isDeveloper = !isDeveloper;
              });
            }),
        ExpansionTile(
            title: const Text("Tipo de Transporte"),
            subtitle: Text("$selectedTransportation"),
            children: [
              RadioListTile(
                title: const Text("Car"),
                subtitle: const Text("Viajar en Carro"),
                value: Transportation.car,
                groupValue: selectedTransportation,
                onChanged: (value) {
                  setState(() {
                    selectedTransportation = Transportation.car;
                  });
                },
              ),
              RadioListTile(
                title: const Text("Bike"),
                subtitle: const Text("Viajar en Bicicleta"),
                groupValue: Transportation.bike,
                value: selectedTransportation,
                onChanged: (value) => setState(
                    () => selectedTransportation = Transportation.bike),
              ),
              RadioListTile(
                title: const Text("Train"),
                subtitle: const Text("Viajar en Tren"),
                groupValue: Transportation.train,
                value: selectedTransportation,
                onChanged: (value) => setState(
                    () => selectedTransportation = Transportation.train),
              ),
              RadioListTile(
                title: const Text("Bus"),
                subtitle: const Text("Viajar en Bus"),
                groupValue: Transportation.bus,
                value: selectedTransportation,
                onChanged: (value) =>
                    setState(() => selectedTransportation = Transportation.bus),
              ),
            ]),

        CheckboxListTile(
          title: const Text("Desayuno"),
          value: wantsBreakfast,
           onChanged: (value )=> setState(() {
            wantsBreakfast = !wantsBreakfast;
           })),
           CheckboxListTile(
          title: const Text("Almuerzo"),
          value: wantsLunch,
           onChanged: (value )=> setState(() {
            wantsLunch = !wantsLunch;
           })),

           CheckboxListTile(
          title: const Text("Cena"),
          value: wantsDinner,
           onChanged: (value )=> setState(() {
            wantsDinner = !wantsDinner;
           })),
      ],
    );
  }
}
