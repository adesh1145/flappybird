import 'package:flame/game.dart';
import 'package:flappybird/core/di/dependency_injection.dart';
import 'package:flappybird/src/presentation/cubits/game_cubit/game_cubit.dart';
import 'package:flappybird/src/presentation/ui/game/flappy_bird_game.dart';
import 'package:flappybird/src/presentation/ui/widgets/game_over_widget.dart';
import 'package:flappybird/src/presentation/ui/widgets/tap_to_play.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PlayState? lastPlayState;
  late GameCubit gameCubit;

  @override
  void initState() {
    gameCubit = BlocProvider.of<GameCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<GameCubit, GameState>(
        listener: (context, state) {
          if (lastPlayState == PlayState.gameover &&
              state.playState == PlayState.idle) {
            sl.unregister<GameCubit>();
            sl.registerLazySingleton<GameCubit>(() => GameCubit());
            setState(() {
              gameCubit = BlocProvider.of<GameCubit>(context);
            });
          }
          lastPlayState = state.playState;
        },
        child: Stack(
          children: [
            GameWidget(game: FlappyBirdGame(gameCubit)),
            BlocBuilder<GameCubit, GameState>(builder: (context, state) {
              if (state.playState == PlayState.playing) {
                return Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: 25.h),
                      child: Text(state.score.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Chewy',
                            fontSize: 20.sp,
                          )),
                    ));
              }
              if (state.playState == PlayState.idle) {
                return TapToPlay();
              } else if (state.playState == PlayState.gameover) {
                return GameOverWidget();
              }

              return const SizedBox.shrink();
            })
          ],
        ),
      ),
    );
  }
}
