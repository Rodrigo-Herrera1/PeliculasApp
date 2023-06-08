import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main() =>
    runApp(AppState()); //ejecuto privero el appstate que es el movie provider
// asi puedo utilizarlo en todos los demas widgets

class AppState extends StatelessWidget {
  //movieprovider
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ), //llamado a movieprovider
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Peliculas App',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomeScreen(),
          'details': (_) => DetailsScreen(),
        },
        theme: ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(color: Color.fromARGB(255, 111, 19, 13))));
  }
}
