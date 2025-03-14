import 'dart:io';
import 'dart:math';


void main() {
  Random random = Random();
 int numeroSecreto = random.nextInt(100) + 1;
 int tentativa;
 int tentativas = 0;
 print("Tente adivinhar o número entre 1 e 100.");


 do {
   stdout.write("Digite seu palpite: ");
   tentativa = int.tryParse(stdin.readLineSync()!) ?? 0;
   tentativas++;


   if (tentativa < numeroSecreto) {
     print("O número secreto é maior!");
   } else if (tentativa > numeroSecreto) {
     print("O número secreto é menor!");
   } else {
     print("Parabéns! Você acertou o número $numeroSecreto em $tentativas tentativas.");
   }
 } while (tentativa != numeroSecreto);
}
