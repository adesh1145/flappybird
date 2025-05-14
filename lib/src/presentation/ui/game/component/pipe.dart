import 'dart:ui';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappybird/src/presentation/cubits/game_cubit/game_cubit.dart';
import 'package:flappybird/src/presentation/ui/game/flappy_bird_game.dart';

import '../../../../../core/constants/app_images.dart';
import 'hidden_coin.dart';

class Pipe extends PositionComponent
    with
        HasGameReference<FlappyBirdGame>,
        CollisionCallbacks,
        FlameBlocReader<GameCubit, GameState> {
  Pipe({required this.isTop, required this.pipeWidth, required super.position})
      : super(
          anchor: Anchor.topCenter,
        );
  late final Sprite _sprite;
  final bool isTop;
  final double pipeWidth;
  final double speed = 100;
  @override
  Future<void> onLoad() async {
    _sprite = await Sprite.load(AppImages.pipe);
    double ratio = _sprite.srcSize.y / _sprite.srcSize.x;
    size = Vector2(pipeWidth, pipeWidth * ratio);
    add(RectangleHitbox(collisionType: CollisionType.passive));
    if (isTop) {
      flipVertically();
    }

    // debugMode = true;
    return super.onLoad();
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    _sprite.render(canvas, size: size, position: Vector2(0, 0));
  }
}
