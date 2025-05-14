import 'dart:async';
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/collisions.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappybird/core/constants/app_images.dart';
import 'package:flappybird/src/presentation/ui/game/component/hidden_coin.dart';
import 'package:flappybird/src/presentation/ui/game/component/pipe.dart';
import 'package:flappybird/src/presentation/ui/game/flappy_bird_game.dart';

import '../../../cubits/game_cubit/game_cubit.dart';

class Bird extends PositionComponent
    with
        HasGameReference<FlappyBirdGame>,
        CollisionCallbacks,
        FlameBlocReader<GameCubit, GameState> {
  Bird()
      : super(
          priority: 25,
          anchor: Anchor.center,
          size: Vector2.all(80),
          position: Vector2(0, 0),
        );

  late final Sprite _sprite;
  final Vector2 _gravity = Vector2(0, 800);
  Vector2 _velocity = Vector2.zero();
  final Vector2 _jump = Vector2(0, -400);

  @override
  Future<void> onLoad() async {
    _sprite = await Sprite.load(AppImages.bird);
    add(
      CircleHitbox(
          collisionType: CollisionType.active,
          radius: size.x * 0.4,
          anchor: Anchor.center,
          position: Vector2(size.x / 2, size.y / 2) * 1.1),
    );
    return super.onLoad();
  }

  void jump() {
    _velocity = _jump;
  }

  @override
  void update(double dt) {
    if (bloc.state.playState != PlayState.playing) {
      return;
    }
    _velocity += _gravity * dt;
    final newPosition = position + _velocity * dt;
    if (newPosition.y > game.size.y / 2) {
      bloc.birdDie();
    }
    position = newPosition;

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _sprite.render(canvas, size: size);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is HiddenCoin) {
      bloc.increaseScore();
      other.removeFromParent();
    } else if (other is Pipe) {
      bloc.gameover();
    }
  }
}
