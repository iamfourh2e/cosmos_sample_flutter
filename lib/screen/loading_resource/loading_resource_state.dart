import 'package:east_rider/core/stream_state.dart';
import 'package:east_rider/core/ui_state.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadingState extends StreamState<bool> {
  LoadingState() {
    setState(Loading());
  }

  checkComplete() {
    Future.delayed(200.ms, () {
        setState(Complete(true));
    });
  }

  addErr() {
    Future.delayed(200.ms, () {
      setState(Error("GG Well Played"));
    });
  }

}