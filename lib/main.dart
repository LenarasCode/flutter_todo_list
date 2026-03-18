import 'dart:io';

void main() {
  List<String> tasks = []; // Список задач
  bool isRunning = true;

  while (isRunning) {
    print('\n--- Меню ---');
    print('1. Добавить задачу');
    print('2. Удалить задачу');
    print('3. Показать задачи');
    print('4. Выход');
    stdout.write('Выберите действие (1-4): ');
    
    String? choice = stdin.readLineSync();
    
    switch (choice) {
      case '1':
        // Добавление задачи
        stdout.write('Введите задачу: ');
        String? task = stdin.readLineSync();
        if (task != null && task.isNotEmpty) {
          tasks.add(task);
          print('Задача добавлена!');
        } else {
          print('Ошибка: задача не может быть пустой.');
        }
        break;
        
      case '2':
        // Удаление задачи
        if (tasks.isEmpty) {
          print('Список задач пуст.');
          break;
        }
        // Показываем задачи с номерами
        for (int i = 0; i < tasks.length; i++) {
          print('${i + 1}. ${tasks[i]}');
        }
        stdout.write('Введите номер задачи для удаления: ');
        String? input = stdin.readLineSync();
        int? index = int.tryParse(input ?? '');
        if (index != null && index >= 1 && index <= tasks.length) {
          String removed = tasks.removeAt(index - 1);
          print('Удалена задача: $removed');
        } else {
          print('Ошибка: неверный номер.');
        }
        break;
        
      case '3':
        // Показать задачи
        if (tasks.isEmpty) {
          print('Список задач пуст.');
        } else {
          print('\nВаши задачи:');
          for (int i = 0; i < tasks.length; i++) {
            print('${i + 1}. ${tasks[i]}');
          }
        }
        break;
        
      case '4':
        // Выход
        isRunning = false;
        print('До свидания!');
        break;
        
      default:
        print('Неверный выбор. Попробуйте снова.');
    }
  }
}