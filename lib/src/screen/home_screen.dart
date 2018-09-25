import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_garcom/src/widget/card_view.dart';
import 'package:smart_garcom/src/widget/cardapio_categoria_list_view.dart';
import 'package:smart_garcom/src/widget/comanda_button.dart';

class HomeScreen extends StatefulWidget {
  static String route = 'home-screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _bottomBarIndex = StreamController<int>();
  var _tituloPagina = StreamController<String>();
  var _pagina = StreamController<Widget>();

  @override
  void initState() {
    super.initState();
    _bottomBarIndex.add(0);
  }

  @override
  void dispose() {
    _bottomBarIndex?.close();
    _tituloPagina?.close();
    _pagina?.close();

    super.dispose();
  }

  void _updatePage(int index) {
    _bottomBarIndex.sink.add(index);

    String titulo = '';
    Widget pagina = Center(child: Text('Página vazia'));

    if (index == 0) {
      titulo = 'Smart Garçom';
      pagina = _buildHomeView();
    } else if (index == 1) {
      titulo = 'Cardápio';
      pagina = CardapioCategoriaListView();
    } else if (index == 2) titulo = 'Meu Perfil';

    _tituloPagina.add(titulo);
    _pagina.add(pagina);
  }

  Widget _buildHomeView() {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Material(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [0, 1, 2, 3, 4, 5, 6]
                    .map((value) => new Container(
                          width: 64.0,
                          height: 64.0,
                          margin: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 8.0),
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            image: new DecorationImage(
                              fit: BoxFit.fill,
                              image: new NetworkImage(
                                  'https://img.itdg.com.br/images/recipes/000/000/324/41196/41196_original.jpg'),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ]
          ..add(SizedBox(height: 8.0))
          ..addAll([1, 2, 3, 4].map((value) => CardView(
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text('teste', style: Theme.of(context).textTheme.title),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                      style: Theme.of(context).textTheme.caption,
                    )
                  ],
                ),
              ))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('buildou HomeScreen');
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.restaurant_menu),
        title: StreamBuilder(
          stream: _tituloPagina.stream,
          initialData: 'Smart Garçom',
          builder: (_, snapshot) => Text(snapshot.data),
        ),
        elevation: 0.0,
        actions: <Widget>[ComandaButton()],
      ),
      body: StreamBuilder(
        stream: _pagina.stream,
        initialData: Container(),
        builder: (_, snapshot) => snapshot.data,
      ),
      bottomNavigationBar: StreamBuilder(
        stream: _bottomBarIndex.stream,
        initialData: 0,
        builder: (_, snapshot) => BottomNavigationBar(
              currentIndex: snapshot.data,
              onTap: _updatePage,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home), title: Text('Início')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.restaurant_menu), title: Text('Cardápio')),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), title: Text('Meu Perfil')),
              ],
            ),
      ),
    );
  }
}
