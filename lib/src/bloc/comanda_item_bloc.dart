import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/src/model/Item.dart';
import 'package:smart_garcom/src/model/comanda.dart';

class ComandaItemBloc extends BlocBase {
  Stream<ComandaItem> get item => _itemSubject.stream;
  final _itemSubject = BehaviorSubject<ComandaItem>();

  Sink<List<ComandaItem>> get comandaItens => _comandaItensController.sink;
  final _comandaItensController = StreamController<List<ComandaItem>>();

  ComandaItemBloc(Item item) {
    _comandaItensController.stream
        .map((list) => list.firstWhere((ci) => ci.item.cod == item.cod,
            orElse: () => null))
        .listen(_itemSubject.add);
  }

  @override
  void dispose() {
    _itemSubject?.close();

    _comandaItensController?.close();
  }
}
