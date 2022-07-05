import 'dart:io';

import 'string_utils.dart';
import 'harry_potter.dart';
import 'star_wars.dart';
import 'channels.dart';

// Le point d'entrée du script
void main() {
  final number = _readFeatureOption();

  // On lance la fonctionnalité désirée
  switch (number) {
    case 1:
      stringUtils();
      break;
    case 2:
      harryPotter();
      break;
    case 3:
      starWars();
      break;
    case 4:
      channels();
      break;
  }
}

/// Affiche les options disponibles et lit le choix de l'utilisateur en console.
int _readFeatureOption() {
  // La liste des noms des fonctionnalités
  final List<String> features = [
    "String Utils",
    "Harry Potter",
    "Star Wars",
    "Channels"
  ];

  // Affichage des fonctionnalités
  print('Voici les fonctionnalités disponibles :');

  for (var i = 0; i < features.length; i++) {
    print('${i + 1}. ${features[i]}');
  }

  // Demande à l'utilisateur d'entrer le numéro de fonctionnalité
  print('Veuillez entrer le numéro de la fonctionnalité que vous voulez utiliser :');
  final input = stdin.readLineSync()!; // Lecture de l'entrée de l'utilisateur
  var number = 0; // Le numéro effectivement entré

  try {
    number = int.parse(input); // On tente de convertir l'entrée en nombre
  } catch (e) {
    print("Veuillez entrer un nombre !"); // Si erreur, on affiche un message
  }

  if (number < 1 || number > features.length) {
    // Si le nombre n'est pas valide
    print('Numéro invalide');
    exit(-1);
  }

  return number;
}