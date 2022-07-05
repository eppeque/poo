import 'package:poo/poo.dart';
import 'package:test/test.dart';

void main() {
  late Entity senator;

  setUp(() {
    senator = Entity("Senator Organa", 10);
  });

  test('Connait son nom et ses points de vie', () {
    expect(senator.name, "Senator Organa");
    expect(senator.hitPoints, 10);
  });

  test('Valide des points de vie négatifs', () {
    final unknown = Entity("?", -20);

    expect(unknown.hitPoints, 20);
  });

  test('Prend des dégâts', () {
    senator.takeHit(9);
    
    expect(senator.hitPoints, 1);
    expect(senator.isAlive(), true);
  });

  test('Meurt avec trop de dégâts', () {
    senator.takeHit(10);

    expect(senator.hitPoints, 0);
    expect(senator.isAlive(), false);
  });
}