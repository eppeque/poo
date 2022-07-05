import 'package:poo/poo.dart';

/// Représente un sorcier
class Wizard {
  /// Le nom du sorcier (utilisé en interne)
  late String _name;

  /// Le nom du sorcier
  String get name => _name;

  /// Le niveau du sorcier (utilisé en interne)
  late Level _level;

  /// Le niveau du sorcier sous forme de chaîne de caractères.
  /// Le niveau peut être 'A', 'B', 'C' ou 'D'.
  String get level => _level.toString();

  /// Le nombre de sorts lancés par le sorcier (utilisé en interne uniquement)
  int _counter = 0;

  /// Crée un sorcier avec un nom et un niveau
  Wizard(String name, Level level) {
    _name = name.isBlank ? "You-Know-Who" : name;
    _level = level;
  }

  /// Permet au sorcier de lancer un sort.
  /// [s] représente le sortilège à lancer.
  String cast(Spell s) {
    _counter++;

    if (_counter == _level.number && _level.number != 1) {
      _level = _level.next();
      _counter = 0;
    }

    return '$name casts ${s.cast(_level.number)}';
  }

  @override
  String toString() {
    return 'Wizard(name: $name, level: $level)';
  }

  @override
  operator ==(dynamic other) {
    return other is Wizard && name == other.name;
  }

  @override
  int get hashCode => name.hashCode;
}