import 'package:event_bus/event_bus.dart';

class AppEventBus {
  static final AppEventBus _instance = AppEventBus._internal();
  EventBus _eventBus;

  AppEventBus._internal() : _eventBus = EventBus();

  factory AppEventBus() {
    return _instance;
  }

  // Listen for events of type T
  Stream<T> stream<T>() {
    return _eventBus.on<T>();
  }

  // Fire an event of type T
  void fire<T>(T event) {
    _eventBus.fire(event);
  }
}
