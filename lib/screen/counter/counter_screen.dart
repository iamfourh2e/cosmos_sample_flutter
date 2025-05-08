import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../l10n/app_localizations.dart';
import '../../core/ui_state.dart';
import '../../core/locale_provider.dart';
import 'counter_state.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

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
        child: Consumer<CounterState>(
          builder: (context, state, child) {
            return switch (state.state) {
              Loading<int>() => const CircularProgressIndicator(),
              Complete<int>(data: final count) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(l10n.counterText),
                  Text(
                    '$count',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              Error<int>(message: final msg) => Text(msg),
            };
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<CounterState>().increment(),
        tooltip: l10n.increment,
        child: const Icon(Icons.add),
      ),
    );
  }
}