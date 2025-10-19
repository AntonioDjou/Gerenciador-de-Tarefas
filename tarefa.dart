class Tarefa {
  int id;
  String titulo;
  String? descricao;
  bool finalizada;

  Tarefa({
    required this.id,
    required this.titulo,
    this.descricao,
    this.finalizada = false,
  });

  @override
  String toString() {
    String status = finalizada ? '[X]' : '[ ]';
    String output = '$status ID: $id - Título: "$titulo"';

    if (descricao != null && descricao!.isNotEmpty) {
      output += ' - Descrição: "$descricao"';
    }
    return output;
  }
}