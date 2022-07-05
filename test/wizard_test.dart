import 'package:poo/poo.dart';
import 'package:test/test.dart';

void main() {
  late Wizard harry;
  late Wizard rogue;
  late Wizard ron;

  late Spell stupefy;

  setUp(() {
    harry = Wizard('Harry Potter', Level.C);
    rogue = Wizard('Severus Rogue', Level.B);
    ron = Wizard('Ron Weasley', Level.C);
    
    stupefy = Spell('Stupefy');
  });

  test('Possède un nom', () {
    expect(harry.name, 'Harry Potter');
    expect(Wizard(' \n \t', Level.D).name, 'You-Know-Who');
  });

  test('Lance un sort', () {
    expect(harry.cast(stupefy), 'Harry Potter casts STUPEFY !');
  });

  test('Augmente de niveau : D -> C (7)', () {
    final harryWithLevelD = Wizard("Harry Potter", Level.D);
    _repeatCasts(harryWithLevelD, stupefy, 7);
    expect(harryWithLevelD.level, 'C');
  });

  test('Augmente de niveau : C -> B (5)', () {
    _repeatCasts(harry, stupefy, 5);
    expect(harry.level, 'B');
  });

  test('Augmente de niveau : B -> A (3)', () {
    _repeatCasts(rogue, stupefy, 3);
    expect(rogue.level, 'A');
  });

  test('Augmente de niveau : C -> A (10)', () {
    _repeatCasts(ron, stupefy, 10);
    expect(ron.level, 'A');
  });

  test("N'augmente pas de niveau au-delà du niveau A", () {
    final youKnowWho = Wizard("", Level.A);
    _repeatCasts(youKnowWho, stupefy, 10);
    expect(youKnowWho.level, 'A');
  });
}

void _repeatCasts(Wizard w, Spell s, int time) {
  for (var i = 0; i < time; i++) {
    w.cast(s);
  }
}