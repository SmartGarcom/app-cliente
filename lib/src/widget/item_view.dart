import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/src/bloc/comanda_bloc.dart';
import 'package:smart_garcom/src/bloc/comanda_item_bloc.dart';
import 'package:smart_garcom/src/model/Item.dart';
import 'package:smart_garcom/src/model/comanda.dart';
import 'package:smart_garcom/src/widget/card_view.dart';
import 'package:smart_garcom/src/widget/tag_clipper.dart';

class ItemView extends StatefulWidget {
  final Item item;

  ItemView(this.item);

  @override
  _ItemViewState createState() => _ItemViewState();
}

class _ItemViewState extends State<ItemView> {
  StreamSubscription _comandaItemSubscription;

  @override
  void dispose() {
//    _comandaItemSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ComandaBloc comandaBloc = BlocProvider.of<ComandaBloc>(context);
    ComandaItemBloc comandaItembloc = ComandaItemBloc(widget.item);

    _comandaItemSubscription =
        comandaBloc.itens.listen(comandaItembloc.comandaItens.add);

    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        CardView(
          onTap: () {},
          margin:
              EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 16.0),
          padding: EdgeInsets.only(bottom: 16.0),
          child: Row(
            children: <Widget>[
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
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
                            image: new NetworkImage(widget.item.imagem),
                          ),
                        ),
                      ),
                      Flexible(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                widget.item.nome,
                                style: Theme.of(context).textTheme.title,
                              ),
                              Row(
                                children: List.generate(5, (s) {
                                  s++;
                                  IconData icon;

                                  if (widget.item.avaliacao >= s)
                                    icon = Icons.star;
                                  else if (widget.item.avaliacao <= s - 1)
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
                                      '(${widget.item.qtdAvaliacoes})',
                                      style:
                                          Theme.of(context).textTheme.caption,
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
                    widget.item.valor.toString(),
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
                comandaBloc.incrementoItem.add(widget.item);
              },
              child: Material(
                elevation: 1.0,
                color: Colors.grey[300],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.0),
                    topRight: Radius.circular(0.0),
                    bottomLeft: Radius.circular(16.0),
                    bottomRight: Radius.circular(16.0)),
//                            color: itemAdd ? Colors.lightGreen : null,
                child: Container(
                  height: 32.0,
                  width: 150.0,
                  child: StreamBuilder<ComandaItem>(
                      stream: comandaItembloc.item,
                      builder: (_, snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                              child: Text(
                            'Adicionar',
                            textScaleFactor: 0.9,
                          ));
                        } else {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              InkWell(
                                onTap: (){
                                  comandaBloc.decrementoItem.add(widget.item);
                                },
                                child: Container(
                                  height: 32.0,
                                  width: 32.0,
                                  child: Center(
                                      child: Text(
                                        '-',
                                        style: Theme.of(context).textTheme.title,
                                      )),
                                ),
                              ),
                              Expanded(
                                  child: Center(
                                      child: Text('${snapshot.data.qtd}'))),
                              Container(
                                height: 32.0,
                                width: 32.0,
                                child: Center(
                                    child: Text(
                                  '+',
                                  style: Theme.of(context).textTheme.title,
                                )),
                              ),
                            ],
                          );
                        }
                      }),
                ),
              ),
            )),
      ],
    );
  }
}
