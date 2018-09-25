import 'package:flutter/material.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/src/bloc/comanda_bloc.dart';

class ComandaButton extends StatelessWidget {
  final VoidCallback onPressed;

  ComandaButton({this.onPressed});

  @override
  Widget build(BuildContext context) {
    ComandaBloc comandaBloc = BlocProvider.of<ComandaBloc>(context);

    print('build ComandaButton');

    return IconButton(
      icon: Stack(overflow: Overflow.visible, children: <Widget>[
        Icon(Icons.receipt),
        Positioned(
          top: -8.0,
          right: -6.0,
          child: StreamBuilder<String>(
              stream: comandaBloc.qtdItensStr,
              builder: (_, snapshot){
                print('mudou o valor ${snapshot.data}');
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
      onPressed: this.onPressed ?? () {},
    );
  }

}
