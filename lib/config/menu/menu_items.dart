import 'package:flutter/material.dart';

class MenuItems {
  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  const MenuItems(
      {required this.title,
      required this.subTitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItems>[
  MenuItems(
      title: "Botones",
      subTitle: "Varios botones",
      link: "/buttons",
      icon: Icons.smart_button_outlined),
  MenuItems(
      title: "Tarjetas",
      subTitle: "Contenedor estilizado",
      link: "/cards",
      icon: Icons.credit_card),
  MenuItems(
      title: "Progress Indicators",
      subTitle: "Generales y controlados",
      link: "/progress",
      icon: Icons.refresh_outlined),
  MenuItems(
      title: "Snackbar y dialogos",
      subTitle: "Indicadores en pantalla",
      link: "/snackbar",
      icon: Icons.info_outline),
  MenuItems(
      title: "Animated container",
      subTitle: "Stateful container",
      link: "/animated",
      icon: Icons.check_box_outline_blank_outlined),
  MenuItems(
      title: "UI Controls + Titles",
      subTitle: "Una serie de controles de Flutter",
      link: "/ui-controls",
      icon: Icons.car_rental_outlined),
  MenuItems(
      title: "Introducción a la aplicación",
      subTitle: "Tutorial",
      link: "/tutorial",
      icon: Icons.accessibility_rounded),


];
