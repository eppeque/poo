import 'package:poo/poo.dart';
import 'package:test/test.dart';

void main() {
  final wingardiumLeviosa = Spell("wingardium leviosa");
  final stupefy = Spell("Stupefy");
  final mucusAdNuseum = Spell("Mucus ad nuseum");

  test("Le get de l'incantation donne l'incantation en lettres majuscules", () {
    expect(wingardiumLeviosa.incantation, "WINGARDIUM LEVIOSA");
    expect(Spell(" \n \t").incantation, "NO INCANTATION");
  });

  test('Cast wingardium leviosa', () {
    expect(wingardiumLeviosa.cast(3), "WINGARDIUM...LEVIOSA !");
    expect(wingardiumLeviosa.cast(0), "WINGARDIUM.LEVIOSA !");
    expect(wingardiumLeviosa.cast(-5), "WINGARDIUM.LEVIOSA !");
  });

  test('Cast stupefy', () {
    expect(stupefy.cast(5), "STUPEFY !");
    expect(stupefy.cast(-1), "STUPEFY !");
  });

  test('Cast mucus ad nuseum', () {
    expect(mucusAdNuseum.cast(1), "MUCUS.AD.NUSEUM !");
  });
}