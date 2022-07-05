import 'package:poo/poo.dart';

class Jedi extends ForceUser {
  bool _hasUsedForceFury = false;

  Jedi(super.name, super.hitPoints, super.damagePoints);

  @override
  String useForceOn(Entity target) {
    if (hitPoints <= 2 && !_hasUsedForceFury) {
      target.takeHit(damagePoints.abs() * 10);
      _hasUsedForceFury = true;
      return '$name utilise la rage de la force sur ${target.name}. Dégâts causés : ${damagePoints.abs() * 10}';
    }

    return super.useForceOn(target);
  }
}