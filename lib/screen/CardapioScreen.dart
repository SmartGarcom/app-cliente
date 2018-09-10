import 'package:flutter/material.dart';

class CardapioScreen extends StatefulWidget {
  const CardapioScreen({Key key}) : super(key: key);

  static String tag = 'cardapio-screen';

  @override
  _CardapioScreenState createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cardápio'),elevation: 0.0,),
      backgroundColor: Colors.grey[200],
      body: Container(
        child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(10, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  type: MaterialType.card,
                  elevation: 0.5,
                  borderRadius: BorderRadius.circular(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.fastfood,
                        color: Colors.blueGrey,
                        size: 64.0,
                      ),
                      SizedBox(height: 8.0),
                      Center(
                        child: Text(
                          'Item $index',
                          style: Theme.of(context).textTheme.headline,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (s) {
                          return Icon(
                            Icons.star,
                            size: 20.0,
                            color: Colors.lightGreen,
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              );
            })),
      ),
    );
  }
}
