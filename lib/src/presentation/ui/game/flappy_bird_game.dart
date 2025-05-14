import 'package:flame/camera.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flappybird/src/presentation/cubits/game_cubit/game_cubit.dart';
import 'package:flappybird/src/presentation/ui/game/game_world.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FlappyBirdGame extends FlameGame<GameWorld>
    with KeyboardEvents, HasCollisionDetection {
  FlappyBirdGame(this.gameCubit)
      : super(
          world: GameWorld(),
          camera: CameraComponent.withFixedResolution(
            width: 600,
            height: 1000,
          ),
        );
  final GameCubit gameCubit;

  @override
  Color backgroundColor() => Colors.white;

  @override
  KeyEventResult onKeyEvent(
    KeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    if (event is KeyDownEvent &&
        keysPressed.contains(LogicalKeyboardKey.space)) {
      world.onSpaceDown();
      return KeyEventResult.handled;
    }
    return super.onKeyEvent(event, keysPressed);
  }
}
