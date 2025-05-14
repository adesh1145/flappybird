part of 'game_cubit.dart';

@freezed
abstract class GameState with _$GameState {
  const factory GameState({
    @Default(0) int score,
    @Default(PlayState.idle) PlayState playState,
  }) = _GameState;
}

enum PlayState {
  idle,
  playing,
  pause,
  gameover,
}
