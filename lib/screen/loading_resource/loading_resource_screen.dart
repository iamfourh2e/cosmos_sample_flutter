import 'dart:math';

import 'package:east_rider/core/ui_state.dart';
import 'package:east_rider/helpers/widget_helper.dart';
import 'package:east_rider/l10n/app_localizations.dart';
import 'package:east_rider/screen/loading_resource/loading_resource_state.dart';
import 'package:flutter/material.dart';

class LoadingResourceScreen extends StatefulWidget {
  const LoadingResourceScreen({super.key});

  @override
  State<LoadingResourceScreen> createState() => _LoadingResourceScreenState();
}

class _LoadingResourceScreenState extends State<LoadingResourceScreen> {
  final loadingResourceState = LoadingState();
  @override
  void initState() {
    super.initState();
    loadingResourceState.checkComplete();
  }

  @override
  Widget build(BuildContext context) {
    final l18n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('East Rider'),
        actions: [
          WidgetHelper.themeToggle(context),
          WidgetHelper.locale(context),
        ],
      ),
      body: StreamBuilder<UiState<bool>>(
          stream: loadingResourceState.state$,
          initialData: loadingResourceState.currentState,
          builder: (context, snapshot) {
            var data = snapshot.data!;
            return switch (data) {
              Loading<bool>() => Center(child: const CircularProgressIndicator()),
              Complete<bool>(data: final d) => Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(l18n.localeName)
                ],
              ),),
              Error<bool>(message: final m) => Center(child: Text(m),),
            };
          }),
    );
  }
}
