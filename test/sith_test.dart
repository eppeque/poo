import 'package:test/test.dart';
import 'package:poo/poo.dart';

void main() {
  late Sith emperor;
  late Jedi master;

  setUp(() {
    emperor = Sith("Darth Sidious", 305, 21);
    master = Jedi("Mace Windu", 300, 25);
  });

  test('Est un utilisateur de la force', () {
    // ignore: unnecessary_type_check
    expect(emperor is Entity, true);
  });

  test('Utilise la force sur une autre entité', () {
    final actual = emperor.useForceOn(master);

    expect(actual, "Darth Sidious projette la force sur Mace Windu. Dégâts causés : 21");
    expect(master.hitPoints, 279);
  });

  test('Etrangle une autre entité', () {
    for (var i = 0; i < 2; i++) {
      emperor.useForceOn(master);
    }

    final actual = emperor.useForceOn(master);

    expect(actual, "Darth Sidious étrangle Mace Windu. Dégâts causés : 42");
    expect(master.hitPoints, 216);
  });

  test('Lance des éclairs sur une autre entité', () {
    for (var i = 0; i < 4; i++) {
      emperor.useForceOn(master);
    }

    final actual = emperor.useForceOn(master);
    
    expect(actual, "Darth Sidious lance des éclairs sur Mace Windu. Dégâts causés : 105");
    expect(master.hitPoints, 90);
  });

  test("Préfère les éclairs à l'étranglement", () {
    for (var i = 0; i < 14; i++) {
      emperor.useForceOn(master);
    }

    final actual = emperor.useForceOn(master);

    expect(actual, "Darth Sidious lance des éclairs sur Mace Windu. Dégâts causés : 105");
  });
}