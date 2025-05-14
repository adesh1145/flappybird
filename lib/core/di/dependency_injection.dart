import 'package:flame/flame.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:get_it/get_it.dart';
import 'package:flappybird/core/service/audio_service.dart';
import 'package:flappybird/src/presentation/cubits/game_cubit/game_cubit.dart';

final sl = GetIt.instance;
Future<void> dependencyInjection() async {
  sl.registerSingleton<FlameAudioService>(FlameAudioService()..initialize());

  sl.registerFactory<GameCubit>(() => GameCubit());
}
