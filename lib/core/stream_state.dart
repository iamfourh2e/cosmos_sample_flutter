import 'package:rxdart/rxdart.dart';
import 'ui_state.dart';

abstract class StreamState<T> {
  final _stateSubject = BehaviorSubject<UiState<T>>();

  Stream<UiState<T>> get state$ => _stateSubject.stream;
  UiState<T> get currentState => _stateSubject.value;

  void setState(UiState<T> state) {
    if (!_stateSubject.isClosed) {
      _stateSubject.add(state);
    }
  }

  void dispose() {
    _stateSubject.close();
  }
}