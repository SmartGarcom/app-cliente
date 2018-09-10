import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smart_garcom/app_configuration.dart';
import 'package:smart_garcom/component/Buttons/roundedButton.dart';
import 'package:smart_garcom/component/card_view.dart';
import 'package:smart_garcom/model/produto.dart';

class ProdutosScreen extends StatefulWidget {
  static String tag = 'produtos-screen';
  final AppConfiguration configuration;
  final ValueChanged<AppConfiguration> updater;

  ProdutosScreen(this.configuration, this.updater);

  @override
  _ProdutosScreenState createState() => _ProdutosScreenState();
}

class _ProdutosScreenState extends State<ProdutosScreen> {
  Random random = new Random();
  var sabores = [
    'Mussarela',
    'Calabresa',
    'Margherita',
    'Escarola',
    'Milho com Bacon',
    'Frango com Catupiry',
    '4 queijos',
    'Napolitana',
    'Vegetariana',
  ];

  List<Produto> _produtos;

  List<int> _itensAdd = [];

  @override
  void initState() {
    super.initState();

    _itensAdd.add(3);
    _produtos = sabores.map((sabor) {
      double preco = random.nextInt(20000) / 100;
      double avaliacao = (20 + random.nextInt(30)) / 10;
      int qtd_avaliacoes = 6 + random.nextInt(30);

      return Produto(
          'codTeste',
          'Pizza de $sabor',
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
          preco,
          'https://img.itdg.com.br/images/recipes/000/000/324/41196/41196_original.jpg',
          avaliacao,
          qtd_avaliacoes);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pizzas'),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
              icon: new Stack(children: <Widget>[
                new Icon(Icons.receipt),
                new Positioned(
                  // draw a red marble
                  top: 0.0,
                  right: 0.0,
                  child: _itensAdd.length == 0
                      ? Container()
                      : new Icon(Icons.brightness_1,
                          size: 10.0, color: Colors.redAccent),
                )
              ]),
              onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: ListView.builder(
          padding: EdgeInsets.all(8.0),
            itemCount: _produtos.length,
            itemBuilder: (_, index) {
              Produto produto = _produtos[index];
              bool itemAdd = _itensAdd.contains(index);

              return Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  CardView(
                    onTap: () {},
                    margin: EdgeInsets.only(
                        top: 8.0, left: 8.0, right: 8.0, bottom: 16.0),
                    padding: EdgeInsets.only(bottom: 16.0),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0,
                                left: 16.0,
                                right: 16.0,
                                bottom: 8.0),
                            child: Row(
                              children: <Widget>[
                                new Container(
                                  width: 64.0,
                                  height: 64.0,
                                  margin: EdgeInsets.only(right: 16.0),
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: new NetworkImage(produto.imagem),
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Container(
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          produto.nome,
                                          style:
                                              Theme.of(context).textTheme.title,
                                        ),
                                        Row(
                                          children: List.generate(5, (s) {
                                            s++;
                                            IconData icon;

                                            if (produto.avaliacao >= s)
                                              icon = Icons.star;
                                            else if (produto.avaliacao <= s - 1)
                                              icon = Icons.star_border;
                                            else
                                              icon = Icons.star_half;

                                            return Icon(
                                              icon,
                                              size: 20.0,
                                              color: Colors.lightGreen,
                                            );
                                          })
                                            ..addAll([
                                              Text(
                                                '(${produto.qtd_avaliacoes})',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .caption,
                                              ),
                                            ]),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ClipPath(
                          clipper: TagClipper(),
                          child: Container(
                            width: 80.0,
                            height: 40.0,
                            color: Colors.blueGrey[300],
                            child: Center(
                                child: Text(
                              produto.valor.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 0.0,
                      right: 8.0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (itemAdd)
                              _itensAdd.remove(index);
                            else
                              _itensAdd.add(index);
                          });
                        },
                        child: Material(
                          elevation: 1.0,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(16.0),
                              topRight: Radius.circular(0.0),
                              bottomLeft: Radius.circular(16.0),
                              bottomRight: Radius.circular(16.0)),
                          color: itemAdd ? Colors.lightGreen : null,
                          child: Container(
                            height: 32.0,
                            width: 200.0,
                            child: Center(
                                child: Text(
                              itemAdd ? 'Item Adicionado' : 'Adicionar Item',
                              textScaleFactor: 0.9,
                            )),
                          ),
                        ),
                      )),
                ],
              );
            }),
      ),
    );
  }
}
