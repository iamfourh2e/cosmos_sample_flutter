
import 'package:east_rider/core/locale_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WidgetHelper {
  static locale(BuildContext context) {
    return PopupMenuButton<Locale>(
      icon: const Icon(Icons.language),
      onSelected: (Locale locale) {
        context.read<LocaleProvider>().setLocale(locale);
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
    );
  }
}
