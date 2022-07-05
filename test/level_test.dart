import 'package:poo/poo.dart';
import 'package:test/test.dart';

void main() {
  test('Les valeurs numériques des niveaux sont corrects', () {
    expect(Level.A.number, 1);
    expect(Level.B.number, 3);
    expect(Level.C.number, 4);
    expect(Level.D.number, 7);
  });

  test('next() donne le niveau suivant le niveau actuel correctement', () {
    expect(Level.D.next(), Level.C);
    expect(Level.C.next(), Level.B);
    expect(Level.B.next(), Level.A);
  });

  test('toString() donne une représentation en chaines de caractères pour chaque niveau', () {
    expect(Level.A.toString(), 'A');
    expect(Level.B.toString(), 'B');
    expect(Level.C.toString(), 'C');
    expect(Level.D.toString(), 'D');
  });
}