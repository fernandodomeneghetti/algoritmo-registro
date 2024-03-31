#include <iostream>
#include <string>
using namespace std;

struct Livro {
    int codigo;
    string titulo;
    string autor;
    int quantidade;
};

Livro biblioteca[100];
int totalLivros = 0;

void CadastrarLivro(Livro& livro) {
    cout << "Digite o código do livro: ";
    cin >> livro.codigo;
    cout << "Digite o título do livro: ";
    cin.ignore();
    getline(cin, livro.titulo);
    cout << "Digite o nome do autor: ";
    getline(cin, livro.autor);
    cout << "Digite a quantidade de exemplares: ";
    cin >> livro.quantidade;
    totalLivros++;
}

void RetirarLivro(Livro& livro) {
    cout << "Digite o código do livro que deseja retirar: ";
    cin >> livro.codigo;

    for (int i = 0; i < totalLivros; i++) {
        if (biblioteca[i].codigo == livro.codigo) {
            if (biblioteca[i].quantidade > 0) {
                biblioteca[i].quantidade--;
                cout << "Livro retirado com sucesso!\n";
            } else {
                cout << "Não possui o livro em estoque para retirada.\n";
            }
            return;
        }
    }
    cout << "Livro não encontrado.\n";
}

void DevolverLivro(Livro& livro) {
    cout << "Digite o código do livro que deseja devolver: ";
    cin >> livro.codigo;

    for (int i = 0; i < totalLivros; i++) {
        if (biblioteca[i].codigo == livro.codigo) {
            biblioteca[i].quantidade++;
            cout << "Livro devolvido com sucesso!\n";
            return;
        }
    }
    cout << "Livro não encontrado.\n";
}

void MenuPrincipal() {
    int opcao;
    Livro novoLivro;

    do {
        cout << "------ Menu Principal ------\n";
        cout << "1 - Cadastrar novo livro\n";
        cout << "2 - Retirar livro\n";
        cout << "3 - Devolver livro\n";
        cout << "4 - Sair\n";
        cout << "Escolha uma opção: ";
        cin >> opcao;

        switch (opcao) {
            case 1:
                CadastrarLivro(novoLivro);
                break;
            case 2:
                RetirarLivro(novoLivro);
                break;
            case 3:
                DevolverLivro(novoLivro);
                break;
            case 4:
                cout << "Saindo do sistema.\n";
                break;
            default:
                cout << "Opção inválida. Tente novamente.\n";
                break;
        }
    } while (opcao != 4);
}

int main() {
    MenuPrincipal();
    return 0;
}
