class Item {
  String cod;
  String nome;
  String descricao;
  double valor;
  String imagem;
  double avaliacao;
  int qtdAvaliacoes;

  Item(this.cod, this.nome, this.descricao, this.valor, this.imagem,
      this.avaliacao, this.qtdAvaliacoes);

  @override
  String toString() {
    return "$cod - $nome";
  }
}
