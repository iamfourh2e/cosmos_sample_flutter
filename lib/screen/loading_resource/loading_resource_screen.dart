import 'dart:math';

import 'package:east_rider/core/ui_state.dart';
import 'package:east_rider/helpers/widget_helper.dart';
import 'package:east_rider/l10n/app_localizations.dart';
import 'package:east_rider/models/user.dart';
import 'package:east_rider/screen/counter/counter_screen.dart';
import 'package:east_rider/screen/loading_resource/loading_resource_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class LoadingResourceScreen extends StatefulWidget {
  const LoadingResourceScreen({super.key});

  @override
  State<LoadingResourceScreen> createState() => _LoadingResourceScreenState();
}

class _LoadingResourceScreenState extends State<LoadingResourceScreen> {
  final loadingResourceState = LoadingScreenState();
  @override
  void initState() {
    super.initState();
    loadingResourceState.checkComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('East Rider'),
        actions: [
          WidgetHelper.themeToggle(context),
          WidgetHelper.locale(context),
        ],
      ),
      body: StreamBuilder<UiState<User>>(
          stream: loadingResourceState.state$,
          initialData: loadingResourceState.currentState,
          builder: (context, snapshot) {
            var data = snapshot.data!;
            return switch (data) {
              Loading<User>() => Center(child: const CircularProgressIndicator()),
              Complete<User>(data: final d) => CounterScreen().animate().fadeIn(),
              Error<User>(message: final m) => Center(child: Text(m),),
            };
          }),
    );
  }
}
