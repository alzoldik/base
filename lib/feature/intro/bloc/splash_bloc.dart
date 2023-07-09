import 'package:base/app/app_event.dart';
import 'package:base/app/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app/bloc_services.dart';

class SplashBloc extends Bloc<AppEvent, AppState> with BlcoServices {
  SplashBloc() : super(Start()) {
    on<Click>(onClick);
  }

  @override
  Future<void> onClick(AppEvent event, Emitter<AppState> emit) async {
    await Future.delayed(
      const Duration(seconds: 2),
      () {
        emit(Done());
      },
    );
  }
}
