import 'package:poo/poo.dart';

class Sith extends ForceUser {
  int _callCount = 0;

  Sith(super.name, super.hitPoints, super.damagePoints);

  @override
  String useForceOn(Entity target) {
    _callCount++;
    if (_callCount % 5 == 0) {
      target.takeHit(damagePoints.abs() * 5);
      return '$name lance des éclairs sur ${target.name}. Dégâts causés : ${damagePoints.abs() * 5}';
    }

    if (_callCount % 3 == 0) {
      target.takeHit(damagePoints * 2);
      return '$name étrangle ${target.name}. Dégâts causés : ${damagePoints.abs() * 2}';
    }

    return super.useForceOn(target);
  }
}