import 'package:flutter/material.dart';
import 'package:smart_garcom/app_configuration.dart';
import 'package:smart_garcom/component/card_view.dart';
import 'package:smart_garcom/model/categoria_produto.dart';
import 'package:smart_garcom/screen/produtos_screen.dart';

class CardapioScreen extends StatefulWidget {
  static String tag = 'cardapio-screen';
  final AppConfiguration configuration;
  final ValueChanged<AppConfiguration> updater;

  CardapioScreen(this.configuration, this.updater);

  @override
  _CardapioScreenState createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen> {
  @override
  Widget build(BuildContext context) {
    List<CategoriaProduto> _categoriasProdutos = [
      CategoriaProduto(1, 'Sanduíches', 'fast-food', 4.5),
      CategoriaProduto(2, 'Pizzas', 'pizza', 5.0),
      CategoriaProduto(3, 'Drinks', 'cocktail', 5.0),
      CategoriaProduto(4, 'Sucos', 'drink', 4.5),
      CategoriaProduto(5, 'Cafés', 'coffee-cup', 4.0),
      CategoriaProduto(6, 'Doces', 'dessert', 3.5),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: new Stack(children: <Widget>[
                new Icon(Icons.receipt),
                new Positioned(
                  // draw a red marble
                  top: 0.0,
                  right: 0.0,
                  child: new Icon(Icons.brightness_1,
                      size: 10.0, color: Colors.redAccent),
                )
              ]),
              onPressed: () {}),
        ],
      ),
      body: Container(
        child: OrientationBuilder(builder: (context, orientation) {
          return GridView.count(
              padding: const EdgeInsets.all(12.0),
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              children: _categoriasProdutos.map((cp) {
                return CardView(
                  onTap: () {
                    Navigator.pushNamed(context, ProdutosScreen.tag);
                  },
                  margin: EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        'assets/food_icons/${cp.imagem}.png',
                        color: Colors.blueGrey,
                        width: 64.0,
                        height: 64.0,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        cp.nome,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.subhead.copyWith(
                              fontSize: 20.0,
                              color: Colors.blueGrey,
                            ),
                      ),
                      SizedBox(height: 8.0),
                    ],
                  ),
                );
              }).toList());
        }),
      ),
    );
  }
}
