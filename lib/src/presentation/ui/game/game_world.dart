import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame_bloc/flame_bloc.dart';
import 'package:flappybird/src/presentation/cubits/game_cubit/game_cubit.dart';
import 'package:flappybird/src/presentation/ui/game/flappy_bird_game.dart';
import 'package:flappybird/src/presentation/ui/game/flappy_root_component.dart';

class GameWorld extends World
    with HasGameReference<FlappyBirdGame>, TapCallbacks {
  late FlappyRootComponent _rootComponent;
  @override
  FutureOr<void> onLoad() {
    add(FlameBlocProvider<GameCubit, GameState>(
        create: () => game.gameCubit,
        children: [_rootComponent = FlappyRootComponent()]));
    return super.onLoad();
  }

  void onSpaceDown() => _rootComponent.onSpaceDown();
  @override
  void onTapDown(TapDownEvent event) {
    _rootComponent.onTapDown(event);
    super.onTapDown(event);
  }
}
