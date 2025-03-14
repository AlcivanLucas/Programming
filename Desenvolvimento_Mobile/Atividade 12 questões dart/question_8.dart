import 'dart:io';


class ContaBancaria {
 double saldo;


 ContaBancaria(this.saldo);


 void deposito(double valor) {
   if (valor > 0) {
     saldo += valor;
     print("Depósito de R\$ $valor realizado com sucesso.");
   } else {
     print("Valor de depósito inválido.");
   }
 }


 void saque(double valor) {
   if (valor > 0 && valor <= saldo) {
     saldo -= valor;
     print("Saque de R\$ $valor realizado com sucesso.");
   } else {
     print("Saldo insuficiente ou valor inválido.");
   }
 }


 void consultaSaldo() {
   print("Saldo atual: R\$ $saldo");
 }
}


void main() {
 ContaBancaria conta = ContaBancaria(0.0);
 while (true) {
   print("\nEscolha uma operação:");
   print("1. Depósito");
  print("2. Saque");
   print("3. Consultar saldo");
   print("4. Sair");
   String? escolha = stdin.readLineSync();


   switch (escolha) {
     case '1':
       print("Digite o valor do depósito:");
       double deposito = double.parse(stdin.readLineSync()!);
       conta.deposito(deposito);
       break;
     case '2':
       print("Digite o valor do saque:");
       double saque = double.parse(stdin.readLineSync()!);
       conta.saque(saque);
       break;
     case '3':
       conta.consultaSaldo();
       break;
     case '4':
       print("Saindo...");
       return;
     default:
       print("Opção inválida.");
   }
 }
}




