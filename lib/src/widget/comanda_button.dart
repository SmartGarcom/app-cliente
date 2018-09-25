import 'package:flutter/material.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/src/bloc/comanda_bloc.dart';

class ComandaButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build');
    final ComandaBloc comandaBloc = BlocProvider.of<ComandaBloc>(context);

    return IconButton(
        icon: new Stack(overflow: Overflow.visible, children: <Widget>[
          new Icon(Icons.receipt),
          Positioned(
            top: -8.0,
            right: -6.0,
            child: StreamBuilder<String>(
                stream: comandaBloc.qtdItensStr,
                builder: (_, snapshot) {
                  if (!snapshot.hasData) return Container();
                  return Material(
                    type: MaterialType.circle,
                    elevation: 1.0,
                    color: Colors.red,
                    child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          snapshot.data,
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
//                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  );
                }),
          ),
        ]),
        onPressed: () {});
  }
}