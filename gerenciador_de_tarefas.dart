import 'tarefa.dart';

class GerenciadorDeTarefas {
  final List<Tarefa> _tarefas = []; // Armazena as tarefas
  int _proximoId = 1; // Contador para gerar IDs únicos para cada nova tarefa

  // Método para adicionar uma nova tarefa
  void adicionarTarefa(String titulo, {String? descricao}) {
    final novaTarefa = Tarefa(
      id: _proximoId,
      titulo: titulo,
      descricao: descricao,
    );
    _tarefas.add(novaTarefa);
    _proximoId++;
    print("\n✅ Tarefa adicionada com sucesso!");
  }

  // Método para listar todas as tarefas
  void listarTarefas() {
    if (_tarefas.isEmpty) {
      print("\nℹ️ Nenhuma tarefa na lista.");
      return;
    }
    
    print("\n--- LISTA DE TAREFAS ---");
    for (var tarefa in _tarefas) {
      print(tarefa);
    }
    print("------------------------");
  }

  // Método para encontrar uma tarefa pelo ID
  Tarefa? _encontrarTarefaPorId(int id) {
    try {
      return _tarefas.firstWhere((tarefa) => tarefa.id == id); // Procura a primeira tarefa que corresponde ao ID fornecido
    } catch (e) {
      return null;
    }
  }

  // Método para editar uma tarefa existente
  void editarTarefa(int id, String novoTitulo, String? novaDescricao) {
    final tarefa = _encontrarTarefaPorId(id);
    if (tarefa != null) {
      tarefa.titulo = novoTitulo;
      tarefa.descricao = novaDescricao;
      print("\n✅ Tarefa (ID: $id) atualizada com sucesso!");
    } else {
      print("\n❌ Erro: Tarefa com ID $id não encontrada.");
    }
  }

  // Método para excluir uma tarefa
  void excluirTarefa(int id) {
    final tarefa = _encontrarTarefaPorId(id);
    if (tarefa != null) {
      _tarefas.remove(tarefa);
      print("\n✅ Tarefa (ID: $id) excluída com sucesso!");
    } else {
      print("\n❌ Erro: Tarefa com ID $id não encontrada.");
    }
  }

  // Método para marcar uma tarefa como finalizada
  void marcarComoFinalizada(int id) {
    final tarefa = _encontrarTarefaPorId(id);
    if (tarefa != null) {
      tarefa.finalizada = true;
      print('\n✅ Tarefa (ID: $id) marcada como finalizada.');
    } else {
      print("\n❌ Erro: Tarefa com ID $id não encontrada.");
    }
  }

  // Método para marcar uma tarefa como pendente
  void desmarcarComoFinalizada(int id) {
    final tarefa = _encontrarTarefaPorId(id);
    if (tarefa != null) {
      tarefa.finalizada = false;
      print('\n✅ Tarefa (ID: $id) marcada como pendente.');
    } else {
      print("\n❌ Erro: Tarefa com ID $id não encontrada.");
    }
  }
}