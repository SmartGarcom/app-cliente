import 'package:smart_garcom/src/model/Item.dart';

class Comanda {
  List<ComandaItem> itens;
  String obs;

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

  ComandaItem({this.item, this.qtd});

  @override
  String toString() {
    return "$item - $qtd";
  }
}
