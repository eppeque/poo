import 'dart:io';

import 'package:poo/poo.dart';

void stringUtils() {
  // Message de démarrage
  print('POO - Labo 1 - Exercice 4');
  print('=========================');

  String smallest = '\uffff'; // La chaine la plus petite
  String greatest = ''; // La chaine la plus grande

  String input = ''; // L'entrée de l'utilisateur

  // Tant que l'utilisateur n'a pas entré 'Fin'
  while (input.toLowerCase() != 'fin') {
    // Affichage de la demande d'entrée sans passage à la ligne suivante
    stdout.write('Encodez un mot (Fin pour terminer) : ');

    // Lecture de l'entrée de l'utilisateur
    input = stdin.readLineSync()!;

    input = input.trim(); // Suppression des espaces avant et après la chaine

    // Si le mot entré n'est pas vide et qu'il ne vaut pas 'Fin'
    if (input.isNotEmpty && input.toLowerCase() !=  'fin') {
      final wordToCompare = StringUtils.wordInTitleCase(input); // Formattage du mot en title case
      smallest = wordToCompare.min(smallest); // Mise à jour du mot le plus petit
      greatest = wordToCompare.max(greatest); // Mise à jour du mot le plus grand
    }
  }

  // Si rien n'a changé
  if (smallest == '\uffff' && greatest == '') {
    print('Aucun mot encodé');
  } else { // Sinon
    print('Plus petit mot : $smallest');
    print('Plus grand mot : $greatest');
  }
  
  print('Fin d\'exécution');
}