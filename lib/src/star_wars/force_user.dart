import 'package:poo/poo.dart';

class ForceUser extends Entity {
  final int damagePoints;

  ForceUser(super.name, super.hitPoints, this.damagePoints);

  String useForceOn(Entity target) {
    target.takeHit(damagePoints.abs());

    return '$name projette la force sur ${target.name}. Dégâts causés : $damagePoints';
  }
}