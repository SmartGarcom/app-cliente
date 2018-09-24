import 'dart:async';
import 'dart:math';

import 'package:rxdart/rxdart.dart';
import 'package:smart_garcom/src/bloc/bloc_provider.dart';
import 'package:smart_garcom/src/model/Item.dart';
import 'package:smart_garcom/src/model/categoria_item.dart';

class ItensBloc extends BlocBase {
  ///
  /// Lista de Itens de acordo com a categoria
  ///
  final Set<Item> _itens = Set<Item>();

  final Set<CategoriaItem> _categorias = Set<CategoriaItem>();

  Stream<List<Item>> get itens => _itensSubject.stream;
  final _itensSubject = BehaviorSubject<List<Item>>();

  Stream<List<CategoriaItem>> get categorias => _categoriasSubject.stream;
  final _categoriasSubject = BehaviorSubject<List<CategoriaItem>>();

  Sink<CategoriaItem> get filtroCategoria => _filtroCategoriaController.sink;
  final _filtroCategoriaController = StreamController<CategoriaItem>();

  ItensBloc() {
    _filtroCategoriaController.stream.listen(_handleFiltroCategoria);

    List<CategoriaItem> _categoriasProdutos = [
      CategoriaItem(1, 'Sanduíches', 'fast-food', 4.5),
      CategoriaItem(2, 'Pizzas', 'pizza', 5.0),
      CategoriaItem(3, 'Drinks', 'cocktail', 5.0),
      CategoriaItem(4, 'Sucos', 'drink', 4.5),
      CategoriaItem(5, 'Cafés', 'coffee-cup', 4.0),
      CategoriaItem(6, 'Doces', 'dessert', 3.5),
    ];

    _handleLoadCategorias(_categoriasProdutos);
  }

  void _handleLoadCategorias(List<CategoriaItem> categorias) {
    _categorias.clear();
    _categorias.addAll(categorias);
    _notifyCategorias();
  }

  void _handleFiltroCategoria(CategoriaItem categoria) {
    _itens.clear();
    Random random = new Random();
    var sabores = [
      'Mussarela',
      'Calabresa',
      'Margherita',
      'Escarola',
      'Milho com Bacon',
      'Frango com Catupiry',
      '4 queijos',
      'Napolitana',
      'Vegetariana',
    ];

    sabores.forEach((sabor) {
      double preco = random.nextInt(20000) / 100;
      double avaliacao = (20 + random.nextInt(30)) / 10;
      int qtdAvaliacoes = 6 + random.nextInt(30);

      _itens.add(Item(
          'cod$sabor',
          '${categoria.nome} de $sabor',
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
          preco,
          'https://img.itdg.com.br/images/recipes/000/000/324/41196/41196_original.jpg',
          avaliacao,
          qtdAvaliacoes));
    });

    _itensSubject.add(List.unmodifiable(_itens));
  }

  void _notifyCategorias() {
    _categoriasSubject.add(List.unmodifiable(_categorias));
  }

  @override
  void dispose() {
    _itensSubject?.close();
    _categoriasSubject?.close();

    _filtroCategoriaController?.close();
  }
}
