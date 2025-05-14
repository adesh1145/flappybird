import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappybird/src/presentation/ui/game/component/hidden_coin.dart';
import 'package:flappybird/src/presentation/ui/game/component/pipe.dart';
import 'package:flappybird/src/presentation/ui/game/flappy_bird_game.dart';
import 'package:flappybird/src/presentation/cubits/game_cubit/game_cubit.dart';

class PipePair extends PositionComponent
    with
        HasGameReference<FlappyBirdGame>,
        FlameBlocReader<GameCubit, GameState> {
  PipePair({
    required super.position,
    required this.pipeWidth,
    required this.gap,
  });
  final double gap;
  final double pipeWidth;
  final double speed = 200;

  @override
  Future<void> onLoad() {
    add(Pipe(
        isTop: true, pipeWidth: pipeWidth, position: Vector2(0, -gap / 2)));
    add(Pipe(
        isTop: false, pipeWidth: pipeWidth, position: Vector2(0, gap / 2)));
    add(HiddenCoin(position: Vector2(0, 0)));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    switch (bloc.state.playState) {
      case PlayState.pause:
      case PlayState.gameover:
      case PlayState.idle:
        // We don't move it
        break;
      case PlayState.playing:
        position.x -= speed * dt;
        break;
    }
    super.update(dt);
  }
}
