import 'dart:io';


void main() {
 print("Digite uma frase:");
 String frase = stdin.readLineSync()!;
 List<String> palavras = frase.split(' ');
 String acronimo = '';
  for (var palavra in palavras) {
   acronimo += palavra[0].toUpperCase();
 }
  print("Acrônimo: $acronimo");
}
