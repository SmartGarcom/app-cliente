import 'package:flutter/material.dart';
import 'package:smart_garcom/src/bloc/application_bloc.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/src/bloc/comanda_bloc.dart';
import 'package:smart_garcom/src/bloc/itens_bloc.dart';
import 'package:smart_garcom/src/screen/home_screen.dart';
import 'package:smart_garcom/src/screen/itens_screen.dart';
import 'package:smart_garcom/src/screen/login_screen.dart';
import 'package:smart_garcom/src/style.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Route<dynamic> _getRoute(RouteSettings settings) {
    //TODO IMPLEMENT
    final List<String> path = settings.name.split('/');
    if (path[0] == '') {}
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final applicationBloc = BlocProvider.of<ApplicationBloc>(context);

    return StreamBuilder<ThemeData>(
      stream: applicationBloc.theme,
      initialData: getTheme(),
      builder: (_, snapshot) => MaterialApp(
            title: 'Smart Garçom',
            theme: snapshot.data,
            initialRoute: LoginScreen.route,
            routes: <String, WidgetBuilder>{
              HomeScreen.route: (_) => HomeScreen(),
              LoginScreen.route: (_) => LoginScreen(),
              ItensScreen.route: (_) => ItensScreen(),
            },
            onGenerateRoute: _getRoute,
            debugShowCheckedModeBanner: false,
          ),
    );
  }
}

void main() {
  final applicationBloc = ApplicationBloc();

  Widget app = MyApp();

  Widget blocProvider = BlocProvider(child: app, bloc: applicationBloc);

  blocProvider = BlocProvider(child: blocProvider, bloc: ComandaBloc());
  blocProvider = BlocProvider(child: blocProvider, bloc: ItensBloc());

  runApp(blocProvider);
}
