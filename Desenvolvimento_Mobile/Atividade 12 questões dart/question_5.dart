import 'dart:io';

void main() {
  final List<String> tasks = [];
  
  while (true) {
    _clearScreen();
    _displayMenu();
    
    final choice = _getUserInput('Digite sua opção: ');
    
    switch (choice) {
      case '1':
        _addTask(tasks);
        break;
      case '2':
        _removeTask(tasks);
        break;
      case '3':
        _showTasks(tasks);
        break;
      case '4':
        exit(0);
      default:
        print('Opção inválida!');
        _wait();
    }
  }
}

void _displayMenu() {
  print('=' * 40);
  print('Gerenciador de Tarefas'.padLeft(28));
  print('=' * 40);
  print('1. Adicionar Tarefa');
  print('2. Remover Tarefa Concluída');
  print('3. Exibir Tarefas');
  print('4. Sair');
  print('-' * 40);
}

void _addTask(List<String> tasks) {
  _clearScreen();
  final task = _getUserInput('Digite a nova tarefa: ');
  if (task.isNotEmpty) {
    tasks.add(task);
    print('\nTarefa adicionada com sucesso!');
  } else {
    print('\nTarefa não pode ser vazia!');
  }
  _wait();
}

void _removeTask(List<String> tasks) {
  _clearScreen();
  if (tasks.isEmpty) {
    print('Nenhuma tarefa para remover!');
    _wait();
    return;
  }

  _showTasks(tasks);
  final input = _getUserInput('\nDigite o número da tarefa concluída: ');
  final index = int.tryParse(input) ?? -1;

  if (index > 0 && index <= tasks.length) {
    final removed = tasks.removeAt(index - 1);
    print('\nTarefa removida: $removed');
  } else {
    print('\nÍndice inválido!');
  }
  _wait();
}

void _showTasks(List<String> tasks) {
  _clearScreen();
  if (tasks.isEmpty) {
    print('Nenhuma tarefa cadastrada!');
    _wait();
    return;
  }

  print('Lista de Tarefas:');
  for (var i = 0; i < tasks.length; i++) {
    print('${i + 1}. ${tasks[i]}');
  }
  _wait();
}

String _getUserInput(String prompt) {
  stdout.write(prompt);
  return stdin.readLineSync()?.trim() ?? '';
}

void _wait() {
  stdout.write('\nPressione Enter para continuar...');
  stdin.readLineSync();
}

void _clearScreen() {
  print('\x1B[2J\x1B[0;0H');
}