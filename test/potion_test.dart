import 'package:poo/poo.dart';
import 'package:test/test.dart';

void main() {
  test('Mixe deux potions', () {
    final felixFelicis = Potion([255, 200, 150], 7);
    final shrinkingSolution = Potion([51, 102, 51], 12);

    final newPotion = felixFelicis.mix(shrinkingSolution);

    expect(felixFelicis, Potion([255, 200, 150], 7));
    expect(shrinkingSolution, Potion([51, 102, 51], 12));
    expect(newPotion, Potion([126, 138, 87], 19));
  });

  test('Possède une représentation en chaînes de caractères', () {
    final myPotion = Potion([51, 102, 51], 12);

    expect(myPotion.toString(), 'Potion(color: [R: 51, G: 102, B: 51], volume: 12)');
  });
}