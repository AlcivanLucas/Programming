import 'dart:io';

void main() {
  // Taxas de conversão fixas (baseadas no Dólar como moeda intermediária)
  const Map<String, double> rates = {
    'BRL': 5.30,  // 1 USD = 5.30 BRL
    'USD': 1.0,   // Moeda base
    'EUR': 0.92,  // 1 USD = 0.92 EUR
  };

  while (true) {
    final source = _showMenu("Selecione a moeda de origem:", true);
    if (source == 0) break;

    final target = _showMenu("Selecione a moeda de destino:", false);
    final amount = _getAmount();

    final result = _convertCurrency(
      amount: amount,
      source: _currencyCode(source),
      target: _currencyCode(target),
      rates: rates,
    );

    print('\nResultado: ${amount.toStringAsFixed(2)} ${_currencyCode(source)}'
        ' = ${result.toStringAsFixed(2)} ${_currencyCode(target)}\n');
  }
}

double _convertCurrency({
  required double amount,
  required String source,
  required String target,
  required Map<String, double> rates,
}) {
  if (source == target) return amount;
  
  // Conversão através do dólar como moeda intermediária
  final inUsd = source == 'USD' ? amount : amount / rates[source]!;
  return target == 'USD' ? inUsd : inUsd * rates[target]!;
}

int _showMenu(String title, bool includeExit) {
  while (true) {
    print(title);
    print('1. Real Brasileiro (BRL)');
    print('2. Dólar Americano (USD)');
    print('3. Euro (EUR)');
    if (includeExit) print('0. Sair');

    final input = stdin.readLineSync()?.trim();
    final option = int.tryParse(input ?? '');

    if (option != null && (includeExit ? option >= 0 && option <= 3 : option >= 1 && option <= 3)) {
      return option;
    }
    print('\nOpção inválida! Tente novamente.\n');
  }
}

double _getAmount() {
  while (true) {
    stdout.write('Digite o valor a ser convertido: ');
    final input = stdin.readLineSync()?.trim();
    final amount = double.tryParse(input ?? '');

    if (amount != null && amount > 0) {
      return amount;
    }
    print('\nValor inválido! Digite um número positivo.\n');
  }
}

String _currencyCode(int option) {
  switch (option) {
    case 1: return 'BRL';
    case 2: return 'USD';
    case 3: return 'EUR';
    default: throw ArgumentError('Opção inválida');
  }
}