import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'East Rider';

  @override
  String get counterText => 'You have pushed the button this many times:';

  @override
  String get increment => 'Increment';

  @override
  String get changeLanguage => 'Change Language';
}
