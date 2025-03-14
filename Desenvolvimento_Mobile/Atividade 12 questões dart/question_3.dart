import 'dart:math';
import 'dart:io';


void main(){


 String gerarSenha(int tamanho) {
   const String charset = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_+';


   Random random = Random();
   String senha = '';


   for(int i = 0; i < tamanho; i++){
     int indiceAleatorio = random.nextInt(charset.length);
     senha += charset[indiceAleatorio];
   }


   return senha;
 }
  stdout.write('Digite o tamanho da senha: ');
 String? tamanho = stdin.readLineSync();
 if(tamanho != null){
   var password = gerarSenha(int.parse(tamanho));
   print(password);
 } else{
   print('Não foi possível criar a senha. ');
 }
}