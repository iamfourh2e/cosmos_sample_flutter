import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../core/ui_state.dart';
import '../../core/locale_provider.dart';
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
    final localeProvider = Provider.of<LocaleProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(l10n.appTitle),
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: (Locale locale) {
              localeProvider.setLocale(locale);
            },
            itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  value: Locale('en'),
                  child: Text('English'),
                ),
                PopupMenuItem(
                  value: Locale('es'),
                  child: Text('Español'),
                ),
              ];
            },
          ),
        ],
      ),
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
                      child: Text("$count"),
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
