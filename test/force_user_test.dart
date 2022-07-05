import 'package:poo/poo.dart';
import 'package:test/test.dart';

void main() {
  late ForceUser princess;

  setUp(() {
    princess = ForceUser("Leia Organa", 30, 5);
  });

  test('Est une entité', () {
    // ignore: unnecessary_type_check
    expect(princess is Entity, true);
  });

  test('Connait son nom, ses points de vie et ses points de dégâts', () {
    expect(princess.name, "Leia Organa");
    expect(princess.hitPoints, 30);
    expect(princess.damagePoints, 5);
  });

  test('Utilise sa force sur une autre entité', () {
    final trooper = Entity("StormTrooper 1", 15);

    final actual = princess.useForceOn(trooper);

    expect(actual, "Leia Organa projette la force sur StormTrooper 1. Dégâts causés : 5");
    expect(10, trooper.hitPoints);
  });
}