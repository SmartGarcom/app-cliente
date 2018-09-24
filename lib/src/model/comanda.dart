import 'package:smart_garcom/src/model/item.dart';
import 'package:smart_garcom/src/utils.dart' as utils;

class Comanda {
  List<ComandaItem> itens;
  String obs;

  double get valorTotal =>
      itens.map((ci) => ci.valorTotal).fold(0.0, utils.soma);

  int get qtdItens => itens.map((ci) => ci.qtd).fold(0, utils.soma);

  Comanda() {
    this.itens = [];
  }

  void addItem(ComandaItem item) {
    itens.add(item);
  }
}

class ComandaItem {
  Item item;
  int qtd;

  double get valorTotal => qtd * item.valor;

  ComandaItem({this.item, this.qtd});

  @override
  String toString() {
    return "$item - $qtd";
  }
}
