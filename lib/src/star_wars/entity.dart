class Entity {
  final String name;
  late int _hitPoints;

  int get hitPoints => _hitPoints;

  Entity(this.name, int hitPoints) {
    _hitPoints = hitPoints.abs();
  }

  void takeHit(int damage) {
    _hitPoints -= damage;
  }

  bool isAlive() {
    return _hitPoints > 0;
  }

  @override
  operator ==(dynamic other) {
    return other is Entity &&
    name == other.name;
  }

  @override
  int get hashCode => name.hashCode;

  @override
  String toString() {
    return 'Entity(name: $name, hitPoints: $hitPoints)';
  }
}