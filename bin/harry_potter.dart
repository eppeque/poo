import 'dart:io';

import 'package:poo/poo.dart';

void harryPotter() {
  final wizards = [
    Wizard("Albus Dumbledore", Level.A),
    Wizard("Severus Rogue", Level.B),
    Wizard("Harry Potter", Level.C),
    Wizard("Hermione Granger", Level.C),
    Wizard("Ronald Weasley", Level.D),
    Wizard("", Level.A),
  ];

  final spells = [
    Spell("Stupefy"),
    Spell("Expecto patronum"),
    Spell("Wingardium leviosa"),
    Spell("Mucus ad nuseum"),
    Spell("Silencio"),
  ];

  Wizard? selectedWizard;

  print('POO - Labo 2 - Exercice 3');
  print('=========================');

  int option = 0;

  while (option != 3) {
    option = _selectItem();

    if (option == 1) {
      selectedWizard = _selectWizard(wizards);
    }

    if (option == 2) {
      if (selectedWizard != null) {
        final spell = _selectSpell(spells);
        final level = selectedWizard.level;
        print(selectedWizard.cast(spell));

        if (selectedWizard.level != level) {
          print('${selectedWizard.name} reached level ${selectedWizard.level}');
        }
      } else {
        print("Please select a wizard...");
        continue;
      }
    }
  }
}

int _selectItem() {
  var result = 0;

  print('1. Select a wizard');
  print('2. Practice');
  print('3. Exit');
  print('');

  while (result == 0) {
    stdout.write('Your choice: ');
    final input = stdin.readLineSync()!;

    try {
      result = int.parse(input);
    } catch (_) {
      print('Please enter a number!');
      continue;
    }

    if (result < 1 || result  > 3) {
      print('Please enter 1, 2 or 3 !');
      result = 0;
    }
  }

  return result;
}

Wizard _selectWizard(List<Wizard> wizards) {
  var option = 0;

  for (var i = 0; i < wizards.length; i++) {
    print('${i + 1}) ${wizards[i].name}');
  }

  print('');

  while (option == 0) {
    stdout.write('Your choice: ');
    final input = stdin.readLineSync()!;

    try {
      option = int.parse(input);
    } catch (_) {
      print('Please enter a number!');
      continue;
    }

    if (option < 1 || option > wizards.length) {
      print('Please enter a number between 1 and ${wizards.length} !');
      option = 0;
    }
  }

  print('${wizards[option - 1].name} selected');
  return wizards[option - 1];
}

Spell _selectSpell(List<Spell> spells) {
  var option = 0;

  for (var i = 0; i < spells.length; i++) {
    print('${i + 1}) ${spells[i].incantation}');
  }

  print('');

  while (option == 0) {
    stdout.write('Your choice: ');
    final input = stdin.readLineSync()!;

    try {
      option = int.parse(input);
    } catch (_) {
      print('Please enter a number!');
      continue;
    }

    if (option < 1 || option > spells.length) {
      print('Please enter a number between 1 and ${spells.length} !');
      option = 0;
    }
  }

  return spells[option - 1];
}