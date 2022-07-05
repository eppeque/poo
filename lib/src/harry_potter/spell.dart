import 'package:poo/poo.dart';

/// Représente un sortilège
class Spell {
  /// L'incantation du sort
  late String _incantation;

  /// L'incantation du sort en lettres majuscules
  String get incantation => _incantation.toUpperCase();

  /// Crée un sort avec une incantation
  Spell(String incantation) {
    _incantation = incantation.isBlank ? "NO INCANTATION" : incantation;
  }

  /// Permet de lancer le sort.
  /// [time] représente le nombre de points à placer entre chaque mot.
  /// Chaque point représente un dixième de seconde.
  String cast(int time) {
    time = time <= 0 ? 1 : time;
    return "${incantation.split(' ').join('.' * time)} !";
  }
}