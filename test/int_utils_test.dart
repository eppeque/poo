import 'package:poo/poo.dart';
import 'package:test/test.dart';

void main() {
  test('makeRandomSequence() -> happy path', () {
    final random = makeRandomSequence(5, 0, 100);

    expect(random.length, 5);

    for (final randNb in random) {
      expect(randNb >= 0 && randNb <= 99, true);
    }
  });

  test('makeRandomSequence() -> negative length', () {
    final random = makeRandomSequence(-5, 0, 100);

    expect(random.length, 5);

    for (final randNb in random) {
      expect(randNb >= 0 && randNb <= 99, true);
    }
  });

  test('makeRandomSequence() -> 0 length', () {
    final random = makeRandomSequence(0, 0, 100);

    expect(random.length, 0);
  });

  test('makeRandomSequence() -> upperBoundExcl before lorwerBoundIncl', () {
    final random = makeRandomSequence(4, 10, 5);

    expect(random.length, 4);

    for (final randNb in random) {
      expect(randNb >= 5 && randNb <= 9, true);
    }
  });

  test('makeRandomSequence() -> upperBoundExcl == lowerBoundIncl', () {
    final random = makeRandomSequence(4, 10, 10);

    expect(random.length, 4);

    for (final randNb in random) {
      expect(randNb, 10);
    }
  });
}