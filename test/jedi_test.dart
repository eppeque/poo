import 'package:test/test.dart';
import 'package:poo/poo.dart';

void main() {
  late Jedi master;

  setUp(() {
    master = Jedi("Mace Windu", 300, 25);
  });

  test('Est un utilisateur de la force', () {
    // ignore: unnecessary_type_check
    expect(master is ForceUser, true);
  });

  test('Peut utiliser sa force sur une autre entité', () {
    final trooper = Entity("StormTrooper 2", 15);

    final actual = master.useForceOn(trooper);

    expect(actual, "Mace Windu projette la force sur StormTrooper 2. Dégâts causés : 25");
    expect(trooper.isAlive(), false);
  });

  test('Utilise la rage de la force quand presque mort', () {
    master.takeHit(298); // Preque mort
    final atAt = Entity("AT-AT Walker", 1000);

    final actual = master.useForceOn(atAt);

    expect(actual, "Mace Windu utilise la rage de la force sur AT-AT Walker. Dégâts causés : 250");
    expect(atAt.hitPoints, 750);
  });

  test('Utilise la rage de la force quand presque mort une seule fois', () {
    master.takeHit(298); // Preque mort
    final atAt = Entity("AT-AT Walker", 1000);
    master.useForceOn(atAt); // Utilise la rage de la force

    final actual = master.useForceOn(atAt); // Utilise la simple projection

    expect(actual, "Mace Windu projette la force sur AT-AT Walker. Dégâts causés : 25");
    expect(atAt.hitPoints, 725);
  });
}