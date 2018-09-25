import 'package:flutter/material.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/src/bloc/itens_bloc.dart';
import 'package:smart_garcom/src/model/item.dart';
import 'package:smart_garcom/src/screen/itens_screen.dart';
import 'package:smart_garcom/src/widget/card_view.dart';

class CategoriaItemView extends StatelessWidget {
  final CategoriaItem categoria;

  CategoriaItemView(this.categoria);

  @override
  Widget build(BuildContext context) {
    final ItensBloc itensBloc = BlocProvider.of<ItensBloc>(context);
    return CardView(
      onTap: () {
        itensBloc.filtroCategoria.add(categoria);
        Navigator.pushNamed(context, ItensScreen.route);
      },
      margin: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            'assets/food_icons/${categoria.imagem}.png',
            color: Colors.blueGrey,
            width: 64.0,
            height: 64.0,
          ),
          SizedBox(height: 8.0),
          Text(
            categoria.nome,
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
  }
}