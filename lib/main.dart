import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/l10n/locale_provider.dart';
import 'package:flutter_fire_starter/src/view_models/sample_view_model.dart';
import 'package:flutter_fire_starter/src/views/sample_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  final prefs = await SharedPreferences.getInstance();
  String lang = prefs.getString('language') ?? 'fr';

  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SampleVM()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: MyApp(language: lang),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,required this.language}) : super(key: key);
  // This widget is the root of your application.

  final String language;

  @override
  Widget build(BuildContext context) 
  {
    final provider = Provider.of<LocaleProvider>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('fr', ''), // French, no country code
        Locale('en', ''), // English, no country code
      ],
      locale: Locale(language, ''), //provider.locale,
      localeResolutionCallback: (locale, supportedLocales) {
        return locale;
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blueGrey,
      ),
      home: const SampleView(title: 'Flutter Demo Home Page'),
    );
  }
}
