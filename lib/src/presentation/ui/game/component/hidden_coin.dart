import 'dart:async';
import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';

// class HiddenCoin extends PositionComponent with CollisionCallbacks {
//   HiddenCoin({required super.position})
//       : super(anchor: Anchor.center, priority: 25);
//   @override
//   FutureOr<void> onLoad() {
//     size = Vector2.all(50);
//     add(CircleHitbox(
//       radius: size.x / 2,
//       collisionType: CollisionType.passive,
//       anchor: Anchor.center,
//       position: Vector2(size.x / 2, size.y / 2),
//     ));
//     debugMode = true;
//     return super.onLoad();
//   }

//   @override
//   void render(Canvas canvas) {
//     final paint = Paint()..color = const Color(0xFFE8C11D);
//     canvas.drawCircle(
//         Vector2(size.x / 2, size.y / 2).toOffset(), size.x / 2, paint);
//     super.render(canvas);
//   }
// }

class HiddenCoin extends PositionComponent with CollisionCallbacks {
  HiddenCoin({required super.position}) : super(anchor: Anchor.center);

  @override
  FutureOr<void> onLoad() {
    size = Vector2.all(50);
    add(CircleHitbox(
      // radius: size.x / 2,
      collisionType: CollisionType.passive,
      // anchor: Anchor.center,
    ));

    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    final paint = Paint()..color = const Color(0xFFFFD700); // Gold
    // canvas.drawCircle(
    //   Offset(size.x / 2, size.y / 2),
    //   size.x / 2,
    //   paint,
    // );
    super.render(canvas);
  }
}
