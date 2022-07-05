/// Représente une potion magique
class Potion {
  /// La couleur de la potion
  final List<int> _color;

  /// Le volume de la potion
  late int _volume;

  /// Crée une potion avec une couleur et un volume
  Potion(this._color, int volume) {
    _volume = volume.abs(); // On prend la valeur positive
  }

  /// Mixe cette potion avec une autre
  Potion mix(Potion p) {
    final somme = _volume + p._volume;
    final poidsThis = _volume / somme;
    final poidsOther = p._volume / somme;

    final ponderationThis = [_color[0] * poidsThis, _color[1] * poidsThis, _color[2] * poidsThis];
    final ponderationOther = [p._color[0] * poidsOther, p._color[1] * poidsOther, p._color[2] * poidsOther];

    final result = [
      (ponderationThis[0] + ponderationOther[0]).round(),
      (ponderationThis[1] + ponderationOther[1]).round(),
      (ponderationThis[2] + ponderationOther[2]).round(),
    ];

    return Potion(result, somme);
  }

  /// Détermine si cette potion a la même couleur qu'une autre
  bool _hasSameColor(Potion other) {
    if (_color.length != other._color.length) return false;

    for (var i = 0; i < other._color.length; i++) {
      if (_color[i] != other._color[i]) return false;
    }

    return true;
  }

  @override
  operator ==(dynamic other) {
    return other is Potion &&
    _hasSameColor(other) &&
    _volume == other._volume;
  }

  @override
  int get hashCode => _color.hashCode * _volume.hashCode;

  @override
  String toString() {
    return 'Potion(color: [R: ${_color[0]}, G: ${_color[1]}, B: ${_color[2]}], volume: $_volume)';
  }
}