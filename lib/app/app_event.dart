abstract class AppEvent {
  Object? arguments;
  AppEvent(this.arguments);
}

class Click extends AppEvent {
  Click({Object? arguments}) : super(arguments);
}

class Update extends AppEvent {
  Update({Object? arguments}) : super(arguments);
}
