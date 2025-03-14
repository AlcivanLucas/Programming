import 'dart:async';
import 'dart:io';

void main() {
  Timer.periodic(Duration(seconds: 1), (_) => _updateClock());
  _updateClock(); // Exibir imediatamente
}

void _updateClock() {
  final now = DateTime.now();
  _clearScreen();
  stdout.write('''
╔═════════════════╗
║  ${_formatTime(now)}  ║
╚═════════════════╝
''');
}

String _formatTime(DateTime t) {
  return '${t.hour.toString().padLeft(2, '0')}:'
         '${t.minute.toString().padLeft(2, '0')}:'
         '${t.second.toString().padLeft(2, '0')}';
}

void _clearScreen() {
  stdout.write('\x1B[2J\x1B[0;0H');
}