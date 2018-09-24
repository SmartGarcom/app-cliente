import 'package:flutter/material.dart';
import 'package:smart_garcom/src/bloc/application_bloc.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/src/bloc/comanda_bloc.dart';
import 'package:smart_garcom/src/bloc/itens_bloc.dart';
import 'package:smart_garcom/src/screen/cardapio_screen.dart';
import 'package:smart_garcom/src/screen/itens_screen.dart';
import 'package:smart_garcom/src/style.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Route<dynamic> _getRoute(RouteSettings settings) {
    //TODO IMPLEMENT
    final List<String> path = settings.name.split('/');
    if (path[0] != '') return null;
    return null;
  }

  @override
  Widget build(BuildContext context) {
    ApplicationBloc applicationBloc = ApplicationBloc();

    return BlocProvider(
      bloc: applicationBloc,
      child: BlocProvider(
        bloc: ComandaBloc(),
        child: BlocProvider(
          bloc: ItensBloc(),
          child: StreamBuilder<ThemeData>(
            stream: applicationBloc.theme,
            initialData: getTheme(),
            builder: (_, snapshot) => MaterialApp(
                  title: 'Smart Garçom',
                  theme: theme,
                  routes: <String, WidgetBuilder>{
                    '/': (BuildContext context) =>
//                LoginScreen(_configuration, configurationUpdater),
//            CardapioScreen.route: (_) =>
                        CardapioScreen(),
                    ItensScreen.route: (_) => ItensScreen(),
                  },
                  onGenerateRoute: _getRoute,
                  debugShowCheckedModeBanner: false,
                ),
          ),
        ),
      ),
    );
  }
}

void main() => runApp(new MyApp());
