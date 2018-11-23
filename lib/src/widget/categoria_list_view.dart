import 'package:flutter/material.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/src/bloc/itens_bloc.dart';
import 'package:smart_garcom/src/model/item.dart';
import 'package:smart_garcom/src/widget/categoria_item_view.dart';
import 'package:smart_garcom/src/widget/loading.dart';

class CategoriaListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itensBloc = BlocProvider.of<ItensBloc>(context);

    return Container(
      child: OrientationBuilder(builder: (context, orientation) {
        return StreamBuilder<List<CategoriaItem>>(
            stream: itensBloc.categorias,
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                    child: Loading(loadingMessage: 'Carregando Cardápio'));
              }

              return GridView.count(
                  padding: const EdgeInsets.all(12.0),
                  crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
                  children: snapshot.data.map((categoria) {
                    return CategoriaItemView(categoria);
                  }).toList());
            });
      }),
    );
  }
}
