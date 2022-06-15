import 'package:flutter/material.dart';
import 'package:flutter_fire_starter/src/core/app_configs/app_colors.dart';
import 'package:flutter_fire_starter/src/core/l10n/locale_provider.dart';
import 'package:flutter_fire_starter/src/view_models/samples/sample_view_model.dart';
import 'package:flutter_fire_starter/src/views/samples/sample_home_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SampleVM()),
        ChangeNotifierProvider(create: (_) => LocaleProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

  static Map<int, Color> color = {
    50: HexColor(AppColors.primary).withOpacity(.1),
    100: HexColor(AppColors.primary).withOpacity(.2),
    200: HexColor(AppColors.primary).withOpacity(.3),
    300: HexColor(AppColors.primary).withOpacity(.4),
    400: HexColor(AppColors.primary).withOpacity(.5),
    500: HexColor(AppColors.primary).withOpacity(.6),
    600: HexColor(AppColors.primary).withOpacity(.7),
    700: HexColor(AppColors.primary).withOpacity(.8),
    800: HexColor(AppColors.primary).withOpacity(.9),
    900: HexColor(AppColors.primary).withOpacity(1),
    // 50: Color.fromRGBO(136, 14, 79, .1),
    // 100: Color.fromRGBO(136, 14, 79, .2),
    // 200: Color.fromRGBO(136, 14, 79, .3),
    // 300: Color.fromRGBO(136, 14, 79, .4),
    // 400: Color.fromRGBO(136, 14, 79, .5),
    // 500: Color.fromRGBO(136, 14, 79, .6),
    // 600: Color.fromRGBO(136, 14, 79, .7),
    // 700: Color.fromRGBO(136, 14, 79, .8),
    // 800: Color.fromRGBO(136, 14, 79, .9),
    // 900: Color.fromRGBO(136, 14, 79, 1),
  };
  MaterialColor primeColor = MaterialColor(HexColor(AppColors.primary).value, color);
  MaterialColor accentColor = MaterialColor(HexColor(AppColors.secondary).value, color);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        Locale('fr'), // French, no country code
        Locale('en'), // English, no country code
      ],
      locale: provider.locale,
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
        primarySwatch: primeColor,
      ),
      home: const SampleHomeView(),
    );
  }
}
