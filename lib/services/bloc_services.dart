import 'package:flutter_bloc/flutter_bloc.dart';
import '../app/app_event.dart';
import '../app/app_state.dart';

abstract class BlcoServices {
  Future<void> onClick(AppEvent event, Emitter<AppState> emit);
  Future<void> onUpdate(AppEvent event, Emitter<AppState> emit) async {}
  Future<void> onSubmit(AppEvent event, Emitter<AppState> emit) async {}
  Future<void> onDelete(AppEvent event, Emitter<AppState> emit) async {}
  Future<void> onAdd(AppEvent event, Emitter<AppState> emit) async {}
}
