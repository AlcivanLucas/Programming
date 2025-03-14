import 'dart:math';
import 'dart:io';


void main(){
 void sortearNome(nomes){
   int tamanho = nomes.length;
   Random random = Random();
   int indiceAleatorio = random.nextInt(tamanho);


   print('O nome sorteado foi: ' + nomes[indiceAleatorio]);
 }


 var continuar = '';
 var nomes = [];


 do {
   stdout.write('Digite um nome: ');
   String? nome = stdin.readLineSync();
   if(nome != null){
     nomes.add(nome);


     stdout.write('Deseja continuar? s/n ');
     String? condicao = stdin.readLineSync();


     if(condicao != null){
       continuar = condicao;
     } else{
       print('Não foi possível continuar.');
     }
   } else{
     print('Não foi possível adicionar o nome.');
   }
 }
 while(continuar != 'n');
  sortearNome(nomes);
}
