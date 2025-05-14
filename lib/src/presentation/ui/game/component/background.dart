import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/parallax.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappybird/core/constants/app_images.dart';
import 'package:flappybird/src/presentation/ui/game/flappy_bird_game.dart';
import 'package:flappybird/src/presentation/cubits/game_cubit/game_cubit.dart';

class Background extends ParallaxComponent<FlappyBirdGame>
    with FlameBlocReader<GameCubit, GameState> {
  Background() : super(anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    parallax = await game.loadParallax(
      [
        ParallaxImageData(AppImages.sky),
        ParallaxImageData(AppImages.cloud1),
        ParallaxImageData(AppImages.cloud2),
        ParallaxImageData(AppImages.cloud3),
        ParallaxImageData(AppImages.cloud4),
        ParallaxImageData(AppImages.cloud5),
        ParallaxImageData(AppImages.trees),
      ],
      baseVelocity: Vector2(1, 0),
      velocityMultiplierDelta: Vector2(1.72, 0),
    );
    return super.onLoad();
  }

  @override
  void update(double dt) {
    switch (bloc.state.playState) {
      case PlayState.idle:
      // break;

      case PlayState.playing:
        super.update(dt);
        break;
      case PlayState.pause:
      case PlayState.gameover:
        break;
    }
  }
}
