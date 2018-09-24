import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/src/model/Item.dart';
import 'package:smart_garcom/src/model/comanda.dart';

class ComandaBloc extends BlocBase {
  ///
  /// Lista de Produtos adicionados na comanda
  ///
  final _comanda = Comanda();

  // ##########  STREAMS  ##############
  Stream<List<ComandaItem>> get itens => _itensSubject.stream;
  final _itensSubject = BehaviorSubject<List<ComandaItem>>();

  Stream<int> get qtdItens => _qtdItensSubject.stream;

  Stream<String> get qtdItensStr => qtdItens.map((qtd) => qtd.toString());

  final _qtdItensSubject = BehaviorSubject<int>();

  Sink<Item> get incrementoItem => _incrementoItemController.sink;
  final _incrementoItemController = StreamController<Item>();

  Sink<Item> get decrementoItem => _decrementoItemController.sink;
  final _decrementoItemController = StreamController<Item>();

  ComandaBloc() {
    _incrementoItemController.stream.listen(_handleIncItem);
    _decrementoItemController.stream.listen(_handleDecItem);
  }

  void _handleIncItem(Item item) {
    _comanda.itens.firstWhere((ci) => ci.item.cod == item.cod, orElse: () {
      var ci = ComandaItem(item: item, qtd: 0);
      _comanda.itens.add(ci);
      return ci;
    }).qtd++;
    _notify();
  }

  void _handleDecItem(Item item) {
    try {
      var ci = _comanda.itens.firstWhere((ci) => ci.item.cod == item.cod);
      ci.qtd--;

      if (ci.qtd == 0) _comanda.itens.remove(ci);
      _notify();
    } catch (e) {
      print(e);
    }
  }

  void _notify() {

    _qtdItensSubject
        .add(_comanda.itens.map((ci) => ci.qtd).fold(0, (a, b) => a + b));

    _itensSubject.add(List.unmodifiable(_comanda.itens));
  }

  @override
  void dispose() {
    _itensSubject?.close();
    _qtdItensSubject?.close();

    _incrementoItemController?.close();
    _decrementoItemController?.close();
  }
}
