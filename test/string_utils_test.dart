import 'package:poo/poo.dart';
import 'package:test/test.dart';

void main() {
  test('min() donne la chaine de caractères la plus petite', () {
    expect("abc".min("def"), "abc");
    expect("abc".min("abc"), "abc");
    expect("abc".min("Abc"), "Abc");
  });

  test('max() donne la chaine de caractères la plus grande', () {
    expect("abc".max("def"), "def");
    expect("abc".max("abc"), "abc");
    expect("abc".max("Abc"), "abc");
  });

  test(
    'wordInTitleCase() donne un mot en title case -> Première lettre en majuscule et les autres en minuscules',
    () {
      expect(StringUtils.wordInTitleCase(""), "");
      expect(StringUtils.wordInTitleCase("abc"), "Abc");
      expect(StringUtils.wordInTitleCase("aBc"), "Abc");
      expect(StringUtils.wordInTitleCase("DEF"), "Def");
      expect(StringUtils.wordInTitleCase(" \tDEF"), "Def");
      expect(StringUtils.wordInTitleCase("deF "), "Def");
      expect(StringUtils.wordInTitleCase("\tdef "), "Def");
    },
  );

  test('toTitleCase() convertit tous les mots contenu dans cette chaine en Title Case', () {
    expect("bonjour tout va bien".toTitleCase(), "Bonjour Tout Va Bien");
    expect("BONJOUR! TOUT VA BIEN".toTitleCase(), "Bonjour Tout Va Bien");
    expect("SALUT! COMMENT vas-tu ? bien!".toTitleCase(), "Salut Comment Vas Tu Bien");
  });
}