import 'package:base/utility/route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/subjects.dart';
import '../app/app_event.dart';
import '../app/app_state.dart';

class KeyBordBloc extends Bloc<AppEvent, AppState> {
  KeyBordBloc() : super(Start());

  final BehaviorSubject<bool> isKeyboardOpen =
      BehaviorSubject<bool>.seeded(false);

  Function(bool) get changeKeyBoardState => isKeyboardOpen.add;

  Stream<bool> get currentKayboardState => isKeyboardOpen.stream;

  @override
  Future<void> close() {
    isKeyboardOpen.close();
    return super.close();
  }
}

KeyBordBloc get keyboard => BlocProvider.of(navigator.currentContext!);
