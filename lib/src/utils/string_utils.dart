extension StringUtils on String {
  /// Donne le chaîne la plus petite
  String min(String other) {
    return compareTo(other) < 0 ? this : other;
  }

  /// Donne la chaine la plus grande
  String max(String other) {
    return compareTo(other) > 0 ? this : other;
  }

  /// Formatte un mot en title case
  static String wordInTitleCase(String w) {
    w = w.trim(); // Remove spaces

    if (w.isEmpty) return "";

    if (w.length == 1) return w.toUpperCase();

    return w.substring(0, 1).toUpperCase() + w.substring(1).toLowerCase();
  }

  /// Détermine si un caractère est spécial ou pas.
  /// Vrai si le caractère est spécial, faux sinon.
  /// La chaine doit donc être de longueur 1.
  bool get isSpecialChar {
    if (isEmpty || length != 1) return false;

    final inUpperCase = toUpperCase();

    return inUpperCase.codeUnits[0] < 65 || inUpperCase.codeUnits[0] > 90;
  }

  /// Donne l'inverse de [isSpecialChar].
  /// Vrai si le caractère n'est pas spécial, faux sinon.
  /// La chaine doit être de longueur 1.
  bool get isNotSpecialChar => !isSpecialChar;

  /// Renvoie cette chaine sans caractères spéciaux
  String _removeSpecialChars() {
    final letters = split('');
    final result = <String>[];

    for (final letter in letters) {
      if (letter.isNotSpecialChar || letter == ' ') {
        result.add(letter);
      }
    }

    return result.join();
  }

  /// Donne cette chaine formattée avec tous les mots en title case.
  /// Tous les espaces avant et après la chaine sont supprimés.
  /// Les traits d'union sont remplacés par des espaces.
  /// Les caractères spéciaux sont supprimés.
  /// Tous les mots sont formattés en Title Case.
  String toTitleCase() {
    final words = trim().replaceAll(RegExp(r'-'), ' ')._removeSpecialChars().split(' ');

    words.remove('');

    for (var i = 0; i < words.length; i++) {
      words[i] = wordInTitleCase(words[i]);
    }

    return words.join(' ');
  }

  /// Détermine si une chaine est blanche ou non
  bool get isBlank => trim().isEmpty;
}