import 'dart:io';
import 'gerenciador_de_tarefas.dart';

final gerenciador = GerenciadorDeTarefas(); // Instância do gerenciador que será usada em todo o programa

void main() {
  while (true) {
    exibirMenu();
    String? escolha = stdin.readLineSync();

    switch (escolha) {
      case '1':
        criarNovaTarefa();
        break;
      case '2':
        gerenciador.listarTarefas();
        break;
      case '3':
        editarTarefa();
        break;
      case '4':
        excluirTarefa();
        break;
      case '5':
        marcarTarefaFinalizada();
        break;
      case '6':
        desmarcarTarefaFinalizada();
        break;
      case '7':
        print("\n👋 Saindo do programa. Até mais!");
        return; // Sai da função main e encerra o programa
      default:
        print("\n❌ Opção inválida. Por favor, tente novamente.");
    }
    
    // Pausa para o usuário ler a saída antes de limpar o menu
    print("\nPressione Enter para continuar...");
    stdin.readLineSync();
  }
}

void exibirMenu() {
  print("\n===== GERENCIADOR DE TAREFAS =====");
  print("1. Criar nova tarefa");
  print("2. Listar todas as tarefas");
  print("3. Editar uma tarefa");
  print("4. Excluir uma tarefa");
  print("5. Marcar tarefa como finalizada");
  print("6. Desmarcar tarefa como finalizada");
  print("7. Sair");
  print("====================================");
  stdout.write("Escolha uma opção: ");
}

// Função para obter o ID da tarefa do usuário
int? obterIdDaTarefa() {
  stdout.write("Digite o ID da tarefa: ");
  String? idInput = stdin.readLineSync();
  if (idInput == null || idInput.isEmpty) {
    print("\n❌ ID inválido.");
    return null;
  }
  // int.tryParse retorna null se a string não for um número válido
  return int.tryParse(idInput);
}

void criarNovaTarefa() {
  stdout.write("Digite o título da tarefa: ");
  String? titulo = stdin.readLineSync();

  if (titulo == null || titulo.isEmpty) {
    print("\n❌ O título não pode ser vazio.");
    return;
  }

  stdout.write("Digite a descrição (opcional, pressione Enter para pular): ");
  String? descricao = stdin.readLineSync();

  gerenciador.adicionarTarefa(titulo, descricao: descricao);
}

void editarTarefa() {
  gerenciador.listarTarefas();
  final id = obterIdDaTarefa();
  if (id == null) return;

  stdout.write("Digite o novo título: ");
  String? novoTitulo = stdin.readLineSync();
  if (novoTitulo == null || novoTitulo.isEmpty) {
    print("\n❌ O novo título não pode ser vazio.");
    return;
  }

  stdout.write("Digite a nova descrição (opcional): ");
  String? novaDescricao = stdin.readLineSync();

  gerenciador.editarTarefa(id, novoTitulo, novaDescricao);
}

void excluirTarefa() {
  gerenciador.listarTarefas();
  final id = obterIdDaTarefa();
  if (id != null) {
    gerenciador.excluirTarefa(id);
  }
}

void marcarTarefaFinalizada() {
  gerenciador.listarTarefas();
  final id = obterIdDaTarefa();
  if (id != null) {
    gerenciador.marcarComoFinalizada(id);
  }
}

void desmarcarTarefaFinalizada() {
  gerenciador.listarTarefas();
  final id = obterIdDaTarefa();
  if (id != null) {
    gerenciador.desmarcarComoFinalizada(id);
  }
}