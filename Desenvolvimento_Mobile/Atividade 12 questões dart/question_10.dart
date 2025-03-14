import 'dart:io';
import 'dart:math';


void main() {
 var opcoes = ['pedra', 'papel', 'tesoura'];
 var random = Random();


 while (true) {
   print("Escolha uma opção: pedra, papel ou tesoura");
   String? usuarioEscolha = stdin.readLineSync()?.toLowerCase();


   if (usuarioEscolha == null || !opcoes.contains(usuarioEscolha)) {
     print("Opção inválida! Tente novamente.");
     continue;
   }


   String computadorEscolha = opcoes[random.nextInt(3)];
   print("O computador escolheu: $computadorEscolha");


   if (usuarioEscolha == computadorEscolha) {
     print("Empate!");
   } else if ((usuarioEscolha == 'pedra' && computadorEscolha == 'tesoura') ||
              (usuarioEscolha == 'papel' && computadorEscolha == 'pedra') ||
              (usuarioEscolha == 'tesoura' && computadorEscolha == 'papel')) {
     print("Você venceu!");
   } else {
     print("O computador venceu!");
   }


   print("Deseja jogar novamente? (s/n)");
   String? resposta = stdin.readLineSync()?.toLowerCase();
   if (resposta != 's') {
     print("Obrigado por jogar!");
     break;
   }
 }
}
