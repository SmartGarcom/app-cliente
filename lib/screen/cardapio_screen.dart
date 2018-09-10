import 'package:flutter/material.dart';
import 'package:smart_garcom/app_configuration.dart';

class CardapioScreen extends StatefulWidget {
  static String tag = 'cardapio-screen';
  final AppConfiguration configuration;
  final ValueChanged<AppConfiguration> updater;

  CardapioScreen(this.configuration, this.updater);

  @override
  _CardapioScreenState createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen> {
  List<CategoriaProduto> _categoriasProdutos = [
    CategoriaProduto(1, 'Sanduíches', 'fast-food', 4.5),
    CategoriaProduto(2, 'Pizzas', 'pizza', 5.0),
    CategoriaProduto(3, 'Drinks', 'cocktail', 5.0),
    CategoriaProduto(4, 'Sucos', 'drink', 4.5),
    CategoriaProduto(5, 'Cafés', 'coffee-cup', 4.0),
    CategoriaProduto(6, 'Doces', 'dessert', 3.5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio'),
        elevation: 0.0,
      ),
      body: Container(
        child: OrientationBuilder(builder: (context, orientation) {
          return GridView.count(
              padding: const EdgeInsets.all(12.0),
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
              children: _categoriasProdutos.map((cp) {
                return Container(
                  margin: const EdgeInsets.all(12.0),
                  child: Material(
                    type: MaterialType.card,
                    elevation: 0.5,
                    borderRadius: BorderRadius.circular(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          child: Image.asset(
                            'assets/food_icons/${cp.imagem}.png',
                            color: Colors.blueGrey,
                            width: 64.0,
                            height: 64.0,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          cp.nome,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.subhead.copyWith(
                                    fontSize: 20.0,
                                    color: Colors.blueGrey,
                                  ),
                        ),
                        SizedBox(height: 8.0),
//                        Row(
//                          mainAxisAlignment: MainAxisAlignment.center,
//                          children: List.generate(5, (s) {
//                            s++;
//                            IconData icon;
//
//                            if (cp.avaliacao < s) {
//                              if (cp.avaliacao == s - 1)
//                                icon = Icons.star_border;
//                              else
//                                icon = Icons.star_half;
//                            } else
//                              icon = Icons.star;
//
//                            return Icon(
//                              icon,
//                              size: 20.0,
//                              color: Colors.lightGreen,
//                            );
//                          }),
//                        ),
                      ],
                    ),
                  ),
                );
              }).toList());
        }),
      ),
    );
  }
}

class CategoriaProduto {
  int id;
  String nome;
  String imagem;
  double avaliacao;

  CategoriaProduto(this.id, this.nome, this.imagem, this.avaliacao);
}
