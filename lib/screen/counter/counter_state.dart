import 'package:flutter/foundation.dart';
import '../../core/ui_state.dart';

class CounterState extends ChangeNotifier {
  UiState<int> _state = const Complete(0);
  UiState<int> get state => _state;

  void increment() {
    _state = const Loading();
    notifyListeners();

    // Simulate async operation
    Future.delayed(const Duration(milliseconds: 500), () {
      final currentValue = switch (_state) {
        Complete(data: final value) => value,
        _ => 0,
      };
      _state = Complete(currentValue + 1);
      notifyListeners();
    });
  }
}