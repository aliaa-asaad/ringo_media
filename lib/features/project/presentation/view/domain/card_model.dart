import 'dart:ui';

class CardModel {
  final Color topColor;
  final Color bottomColor;
  final String icon;
  final int number;
  final String title;

  CardModel(
      {required this.icon,
      required this.number,
      required this.title,
      required this.topColor,
      required this.bottomColor});
}
