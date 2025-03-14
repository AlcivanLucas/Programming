import 'dart:io';

void main() {
  print('=== IMC ===');

  final peso = _lerDado('Peso (kg): ');
  final altura = _lerDado('Altura (m): ');
  final imc = peso / (altura * altura);

  print('\nIMC: ${imc.toStringAsFixed(1)} - ${_classificar(imc)}');
}

double _lerDado(String prompt) {
  while (true) {
    stdout.write(prompt);
    final input = double.tryParse(stdin.readLineSync() ?? '');
    if (input != null && input > 0) return input;
    print('Valor inválido! ');
  }
}

String _classificar(double imc) {
  return switch (imc) {
    < 16 => 'Magreza grave',
    < 17 => 'Magreza moderada',
    < 18.5 => 'Magreza leve',
    < 25 => 'Saudável',
    < 30 => 'Sobrepeso',
    < 35 => 'Obesidade Grau I',
    < 40 => 'Obesidade Grau II',
    _ => 'Obesidade Grau III'
  };
}