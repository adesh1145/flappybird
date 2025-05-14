import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappybird/src/presentation/cubits/game_cubit/game_cubit.dart';
import 'package:flappybird/src/presentation/ui/game/component/background.dart';

import 'component/bird.dart';
import 'component/pipe_pair.dart';
import 'flappy_bird_game.dart';

class FlappyRootComponent extends Component
    with
        HasGameReference<FlappyBirdGame>,
        FlameBlocReader<GameCubit, GameState> {
  late final Bird _bird;
  late PipePair _lastPipePair;
  final double _pipeDistance = 400;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(Background());
    _bird = Bird();
    add(_bird);
    generatePipePair(300);

    // game.camera.viewfinder.scale = Vector2.all(0.04);
  }

  // @override
  // bool listenWhen(GameState previousState, GameState newState) {
  //   return previousState.playState == PlayState.gameover &&
  //       newState.playState == PlayState.idle;
  // }

  // @override
  // void onNewState(GameState state) {
  //   super.onNewState(state);
  //   print(state.playState.toString());
  //   if (state.playState == PlayState.idle) {
  //     while (children.whereType<PipePair>().isNotEmpty) {
  //       remove(children.whereType<PipePair>().toList()[0]);
  //     }
  //     remove(_bird);
  //     _bird = Bird();
  //     add(_bird);
  //     generatePipePair(300);
  //   }
  // }

  generatePipePair(double fromX) {
    for (int i = 0; i < 5; i++) {
      double area = 600;
      double y = Random().nextDouble() * area - area / 2;
      double gap = max(Random().nextDouble() * 400, 200);
      _lastPipePair = PipePair(
          gap: gap,
          position: Vector2(fromX + i * _pipeDistance, y),
          pipeWidth: 80);
      add(_lastPipePair);
    }
  }

  void removePipePairLast5() {
    if (children.whereType<PipePair>().length >= 10) {
      for (int i = 0; i < 5; i++) {
        remove(children.whereType<PipePair>().toList()[i]);
      }
    }
  }

  void onTapDown(TapDownEvent event) {
    _checkToStartGame();
    _bird.jump();
  }

  void onSpaceDown() {
    _checkToStartGame();
    _bird.jump();
  }

  void _checkToStartGame() {
    if (bloc.state.playState == PlayState.idle) {
      bloc.startPlaying();
    }
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_bird.x >= _lastPipePair.x) {
      removePipePairLast5();

      generatePipePair(_lastPipePair.x + _pipeDistance);
    }
  }
}
