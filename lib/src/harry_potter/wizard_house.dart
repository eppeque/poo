import 'package:poo/poo.dart';

/// Représente une maison de sorciers
class WizardHouse {
  /// Le fondateur de la maison
  final Wizard _founder;

  /// Les membres de la maison
  late List<Wizard> _members;

  /// Crée une maison de sorciers avec un fondateur et, éventuellement, des membres
  WizardHouse(this._founder, [List<Wizard>? members]) {
    _members = List.from(members ?? []);
  }

  /// Donne le nom de la maison
  String get name => _founder.name.substring(_founder.name.indexOf(' ') + 1);

  /// Donne le nombre de membres de cette maison (le nombre de membres + le fondateur)
  int get count => _members.length + 1;

  /// Donne la liste des noms des membres triée dans l'ordre alphabétique
  List<String> get membersNames {
    final membersNames = _members.map((w) => w.name).toList();
    membersNames.add(_founder.name);
    membersNames.sort();

    return membersNames;
  }

  /// Ajoute un sorcier aux membres de cette maison
  void add(Wizard w) {
    if (!_members.contains(w) && w != _founder) {
      _members.add(w);
    }
  }

  /// Supprime un sorcier aux membres de cette maison
  void remove(Wizard w) {
    _members.remove(w);
  }

  @override
  String toString() {
    return 'WizardHouse(founder: ${_founder.toString()})';
  }
}