#include <iostream>
#include <iomanip>
using namespace std;

int main (void){
    // char nome [50];
    // printf("Digite seu nome: \n");
    // cin >> nome;
    // cout << "seu nome é :" << nome << endl;

    for (int i= 1; i <= 5; i++){
        cout << ""
            << setw(i) << setfill('*')
            << "" <<  endl;        
    }
}

// tipos de dados em C++
// int 
// float
// double
// char
// bool

