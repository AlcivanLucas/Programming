#include <iostream>
#include <vector>
using namespace std;
void contador (int num, int cont);
 
int main (int argc, char *argv[] ){
    // cout << argv[0] << endl;
    int numero = 10;
    int vetor [10];
    vetor[0] = 1; 
    contador(10,1);
}

void contador (int num, int cont){
    for (int i =0; i <= num; i++){
        cout << i << endl;
    }
}

//  sizeoff retorna o tamnho do tipo de dado

// int 10
// char B posso colocar ate 20 caracteres char[20]
// double 2,5 
// float 2,5 precisão menor que double
// bool true or false
// string Adryel 