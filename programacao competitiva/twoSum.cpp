#include <iostream>
#include <vector>
using namespace std;

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        // Percorre todos os pares de elementos do vetor
                for (int i = 0; i < (int)nums.size(); i++) {
                    int resto = target - nums[i];
                    for (int j = i + 1; j < (int)nums.size(); j++) {
                        // Se achar o valor que completa o target, retorne os índices
                        if (nums[j] == resto) {
                            return { i, j };
                        }
                    }
                }
                // Caso não encontre nenhum par, retorne um vetor vazio
                return {};
    }
};

int main (){
    // Criação de um vetor de exemplo
    vector<int> nums = {1, 2, 3, 4, 5};
    int target = 7;

    // Instanciação do objeto Solution
    Solution sol;

    // Chamando a função twoSum
    vector<int> result = sol.twoSum(nums, target);

    cout << result[0] << result[1] << endl;

}