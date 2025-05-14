import 'package:flappybird/core/di/dependency_injection.dart';
import 'package:flappybird/core/service/audio_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_state.dart';
part 'game_cubit.freezed.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit() : super(GameState());

  void startPlaying() {
    sl.get<FlameAudioService>().playBackgroundMusic();
    emit(state.copyWith(playState: PlayState.playing, score: 0));
  }

  void pausePlaying() {
    emit(state.copyWith(playState: PlayState.pause));
  }

  void gameover() {
    sl.get<FlameAudioService>().playHit();
    sl.get<FlameAudioService>().stopBackgroundMusic();
    emit(state.copyWith(playState: PlayState.gameover));
  }

  void birdDie() {
    sl.get<FlameAudioService>().stopBackgroundMusic();
    sl.get<FlameAudioService>().playDie();
    emit(state.copyWith(playState: PlayState.gameover));
  }

  void birdJump() {
    sl.get<FlameAudioService>().playJump();
  }

  void increaseScore() {
    sl.get<FlameAudioService>().playPoint();
    emit(state.copyWith(score: state.score + 1));
  }

  void restart() {
    emit(state.copyWith(playState: PlayState.idle, score: 0));
  }
}
