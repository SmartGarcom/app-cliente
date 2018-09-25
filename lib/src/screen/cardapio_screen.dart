import 'package:flutter/material.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/src/bloc/itens_bloc.dart';
import 'package:smart_garcom/src/model/item.dart';
import 'package:smart_garcom/src/widget/categoria_item_view.dart';
import 'package:smart_garcom/src/widget/comanda_button.dart';

class CardapioScreen extends StatefulWidget {
  static String route = 'cardapio-screen';

  CardapioScreen();

  @override
  _CardapioScreenState createState() => _CardapioScreenState();
}

class _CardapioScreenState extends State<CardapioScreen> {
  @override
  Widget build(BuildContext context) {
    final ItensBloc itensBloc = BlocProvider.of<ItensBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cardápio'),
        elevation: 0.0,
        actions: <Widget>[ComandaButton()],
      ),
      body: Container(
        child: OrientationBuilder(builder: (context, orientation) {
          return StreamBuilder<List<CategoriaItem>>(
            stream: itensBloc.categorias,
            initialData: [],
            builder: (_, snapshot) => GridView.count(
                padding: const EdgeInsets.all(12.0),
                crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                children: snapshot.data.map((categoria) {
                  return CategoriaItemView(categoria);
                }).toList()),
          );
        }),
      ),
    );
  }
}
