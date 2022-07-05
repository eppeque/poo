/// Une énumération des niveaux possibles d'un sorcier.
enum Level {
  A(1), B(3), C(4), D(7);

  /// Le nombre d'incantations nécessaires pour passer au niveau suivant
  final int number;

  /// Crée un niveau avec un nombre d'incantations
  const Level(this.number);

  /// Donne le niveau suivant ce niveau
  Level next() {
    return values[index - 1];
  }

  @override
  String toString() {
    if (number == 1) return 'A';

    if (number == 3) return 'B';

    if (number == 4) return 'C';

    return 'D';
  }
}