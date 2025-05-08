import 'package:east_rider/core/stream_state.dart';
import 'package:east_rider/core/ui_state.dart';
import 'package:east_rider/models/user.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadingScreenState extends StreamState<User> {
  LoadingScreenState() {
    setState(Loading());
  }

  checkComplete() {
    Future.delayed(500.ms, () {
      setState(Complete(User(
          name: "kevin",
          age: 35,
          address: Address(city: "Battambang", country: "cambodia"))));
    });
  }

  addErr() {
    Future.delayed(200.ms, () {
      setState(Error("GG Well Played"));
    });
  }
}
