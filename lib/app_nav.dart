import 'package:flutter/material.dart';
import 'package:ricky_n_morty/screens/characters/character_details.dart';
import 'package:ricky_n_morty/screens/characters/characters_screen.dart';


GlobalKey<NavigatorState> _charactersNavigatorKey = GlobalKey<NavigatorState>();

class Appnav extends StatefulWidget {
  @override
  _AppnavState createState() => _AppnavState();
}

class CharactersNavigator extends StatefulWidget {
  @override
  _CharactersNavigatorState createState() => _CharactersNavigatorState();
}

class _AppnavState extends State<Appnav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          top: false,
          child: CharactersNavigator(),),
    );
  }

}

class _CharactersNavigatorState extends State<CharactersNavigator> {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _charactersNavigatorKey,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (context) {
              switch (settings.name) {
                case '/':
                  return CharactersScreen();
                case '/characterDetails':
                  return CharacterDetails();
              }
              return null;
            });
      },
    );
  }
}
