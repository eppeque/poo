import 'dart:math';

/// Génère une liste de nombres entiers aléatoires compris entre [lowerBoundInc] et [upperBoundExcl]
List<int> makeRandomSequence(int length, int lowerBoundInc, int upperBoundExcl) {
  length = length.abs(); // Une valeur négative devient positive

  // Si la borne minimale est plus grande que la maximale -> on swap les données des deux variables
  if (lowerBoundInc > upperBoundExcl) {
    lowerBoundInc = lowerBoundInc ^ upperBoundExcl;
    upperBoundExcl = lowerBoundInc ^ upperBoundExcl;
    lowerBoundInc = lowerBoundInc ^ upperBoundExcl;
  }

  // Si la borne minimale est égale à la maximale -> On retourne une liste avec uniquement la valeur minimale
  if (lowerBoundInc == upperBoundExcl) return List<int>.generate(length, (index) => lowerBoundInc);

  // Initialisation de l'objet Random permettant de générer des nombres aléatoires en respectant une borne maximale
  final random = Random();

  // Retour du résultat étant une liste générée
  return List<int>.generate(length, (index) {
    final randomNb = random.nextInt(upperBoundExcl); // Tirage au sort du nombre

    // Si le nombre est plus petit que la borne minimale,
    // on ajoute la valeur de la borne minimale à ce nombre afin de respecter la borne
    if (randomNb < lowerBoundInc) return randomNb + lowerBoundInc;

    return randomNb; // Sinon, on retourne simplement le nombre tiré
  });
}