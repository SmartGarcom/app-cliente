import 'package:flutter/material.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/src/bloc/itens_bloc.dart';
import 'package:smart_garcom/src/model/item.dart';
import 'package:smart_garcom/src/widget/comanda_button.dart';
import 'package:smart_garcom/src/widget/item_view.dart';

class ItensScreen extends StatefulWidget {
  static String route = 'itens-screen';

  @override
  _ItensScreenState createState() => _ItensScreenState();
}

class _ItensScreenState extends State<ItensScreen> {
  @override
  Widget build(BuildContext context) {
    final ItensBloc itensBloc = BlocProvider.of<ItensBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Pizzas'),
        elevation: 0.0,
        actions: <Widget>[ComandaButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: StreamBuilder<List<Item>>(
          stream: itensBloc.itens,
          initialData: [],
          builder: (_, snapshot) => ListView(
                padding: EdgeInsets.all(8.0),
                children: snapshot.data.map((item) => ItemView(item)).toList(),
              ),
        ),
      ),
    );
  }
}
