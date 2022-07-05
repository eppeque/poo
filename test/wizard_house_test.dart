import 'package:test/test.dart';
import 'package:poo/poo.dart';

void main() {
  test('Retourne le nom de famille du fondateur pour le nom de la maison', () {
    final belfikhHouse = WizardHouse(Wizard("Abderrahmen Belfikh", Level.A));
		final colletHouse = WizardHouse(Wizard("Marianne Collet", Level.A));
		final comblinHouse = WizardHouse(Wizard("Arnaud Comblin", Level.A));
		final goerlichHouse = WizardHouse(Wizard("François Goerlich", Level.A));
		final jadotHouse = WizardHouse(Wizard("Jean Jadot", Level.A));
		final lienardyHouse = WizardHouse(Wizard("Simon Liénardy", Level.A));
		final mathyHouse = WizardHouse(Wizard("Christiane Mathy", Level.A));

		expect(belfikhHouse.name, "Belfikh");
		expect(colletHouse.name, "Collet");
		expect(comblinHouse.name, "Comblin");
		expect(goerlichHouse.name, "Goerlich");
		expect(jadotHouse.name, "Jadot");
		expect(lienardyHouse.name, "Liénardy");
		expect(mathyHouse.name, "Mathy");
  });

  test('Possède une représentation sous forme de chaîne de caractères', () {
    final mathyHouse = WizardHouse(Wizard("Christiane Mathy", Level.A));

		expect(mathyHouse.toString(), "WizardHouse(founder: Wizard(name: Christiane Mathy, level: A))");
  });

  test('Possède un membre à la création', () {
    final jadotHouse = WizardHouse(Wizard("Jean Jadot", Level.A));
		
		expect(jadotHouse.count, 1);
  });

  test('Ajoute de nouveaux membres', () {
    final comblinHouse = WizardHouse(Wizard("Arnaud Comblin", Level.A));
		final simon = Wizard("Simon Lamy", Level.C);
		final dimitri = Wizard("Dimitri Bosteels", Level.D);
		
		comblinHouse.add(simon);
		comblinHouse.add(dimitri);
		
		expect(comblinHouse.count, 3);
  });

  test("N'ajoute pas un sorcier déjà membre", () {
    final comblinHouse = WizardHouse(Wizard("Arnaud Comblin", Level.A));
		final simon = Wizard("Simon Lamy", Level.C);
		final dimitri = Wizard("Dimitri Bosteels", Level.D);
		
		comblinHouse.add(simon);
		comblinHouse.add(dimitri);
		comblinHouse.add(simon); // Déjà membre
		comblinHouse.add(Wizard("Dimitri Bosteels", Level.D)); // Déjà membre aussi
		
		expect(comblinHouse.count, 3);
  });

  test("N'ajoute pas le fondateur", () {
    final arnaudComblin = Wizard("Arnaud Comblin", Level.A);
		final comblinHouse = WizardHouse(arnaudComblin);
		
		comblinHouse.add(Wizard("Arnaud Comblin", Level.A));
		comblinHouse.add(arnaudComblin);
		
		expect(comblinHouse.count, 1);
  });

  test("Supprime des membres", () {
    final comblinHouse = WizardHouse(Wizard("Arnaud Comblin", Level.A));
		final simon = Wizard("Simon Lamy", Level.C);
		final dimitri = Wizard("Dimitri Bosteels", Level.D);
		
		comblinHouse.add(simon);
		comblinHouse.add(dimitri);
		
		comblinHouse.remove(simon);
		
		expect(comblinHouse.count, 2);
  });

  test("Ignore la suppression d'un sorcier qui n'est pas membre", () {
    final comblinHouse = WizardHouse(Wizard("Arnaud Comblin", Level.A));
		final simon = Wizard("Simon Lamy", Level.C);
		final dimitri = Wizard("Dimitri Bosteels", Level.D);
		final jessica = Wizard("Jessica Sylvestre", Level.B);
		
		comblinHouse.add(simon);
		comblinHouse.add(dimitri);
		
		comblinHouse.remove(jessica);
		
		expect(comblinHouse.count, 3);
  });

  test('Ajoute, supprimer et ajoute à nouveau', () {
    final lienardyHouse = WizardHouse(Wizard("Simon Liénardy", Level.B));
		final ron = Wizard("Ronald Weasley", Level.D);
		final benoit = Wizard("Benoit Serge", Level.C);
		
		lienardyHouse.add(ron);
		lienardyHouse.add(benoit);
		
		lienardyHouse.remove(ron);
	
		lienardyHouse.add(ron);
		
		expect(lienardyHouse.count, 3);
  });

  test('Crée une maison avec des membres', () {
    final members = [
      Wizard("Quentin Eppe", Level.B),
      Wizard("Anthony Trolio", Level.C),
    ];
    final belfikhHouse = WizardHouse(Wizard("Abderrahmen Belfikh", Level.A), members);

    expect(belfikhHouse.membersNames, ["Abderrahmen Belfikh", "Anthony Trolio", "Quentin Eppe"]);
    expect(belfikhHouse.count, 3);

    belfikhHouse.remove(Wizard("Anthony Trolio", Level.C));

    expect(belfikhHouse.membersNames, ["Abderrahmen Belfikh", "Quentin Eppe"]);
    expect(belfikhHouse.count, 2);
    expect(members.length, 2);
  });
}