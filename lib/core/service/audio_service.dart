import 'package:flame_audio/flame_audio.dart';

class FlameAudioService {
  bool _isInitialized = false;

  Future<void> initialize() async {
    if (_isInitialized) return;

    await FlameAudio.audioCache.loadAll([
      'background.mp3',
      'score.mp3',
      'die.wav',
      'wing.wav',
      'hit.wav',
    ]);

    _isInitialized = true;
  }

  void playBackgroundMusic() {
    FlameAudio.bgm.play('background.mp3');
  }

  void stopBackgroundMusic() {
    if (!FlameAudio.bgm.isPlaying) return;
    FlameAudio.bgm.stop();
  }

  void playJump() {
    FlameAudio.play('wing.wav');
  }

  void playHit() {
    FlameAudio.play('hit.wav');
  }

  void playPoint() {
    FlameAudio.play('score.mp3');
  }

  void playDie() {
    FlameAudio.play('die.wav');
  }
}
