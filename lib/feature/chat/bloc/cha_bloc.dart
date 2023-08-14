import 'package:base/app/app_event.dart';
import 'package:base/app/app_state.dart';
import 'package:base/app/bloc_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatBloc extends Bloc<AppEvent, AppState> with BlcoServices {
  ChatBloc(super.initialState);

  @override
  Future<void> onClick(AppEvent event, Emitter<AppState> emit) async {}
}
