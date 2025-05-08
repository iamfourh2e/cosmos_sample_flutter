import 'package:east_rider/core/stream_state.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/ui_state.dart';

class CounterState extends StreamState<int> {
  CounterState() {
    setState(Loading());
    setState(Complete(0));
  }

  void increment() {
    // Simulate async operation
    Future.delayed(0.ms, () {
      if (currentState is Complete<int>) {
        var currentValue = (currentState as Complete<int>).data;
        setState(Complete(currentValue + 1));
      }
    });
  }
}
