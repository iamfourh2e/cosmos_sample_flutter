import 'package:east_rider/helpers/widget_helper.dart';
import 'package:flutter/material.dart';
import '../../l10n/app_localizations.dart';
import '../../core/ui_state.dart';
import 'counter_state.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  var counterStream = CounterState();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(

      body: Center(
          child: StreamBuilder<UiState>(
              stream: counterStream.state$,
              initialData: counterStream.currentState,
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                final data = snapshot.data;
                return switch (data) {
                  Loading() => const CircularProgressIndicator(),
                  Complete(data: final count) => Center(
                      child: Text("${l10n.counterText}\n$count"),
                    ),
                  Error(message: final msg) => Center(child: Text(msg)),
                  null => Center(
                      child: Text("unknown"),
                    ),
                };
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () => counterStream.increment(),
        tooltip: l10n.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}
