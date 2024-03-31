program SistemaBiblioteca;

type
  Livro = record
    codigo: integer;
    titulo: string[100];
    autor: string[50];
    quantidade: integer;
  end;

var
  biblioteca: array[1..100] of Livro;
  totalLivros: integer;

procedure CadastrarLivro(var livro: Livro);
begin
  writeln('Digite o código do livro:');
  readln(livro.codigo);
  writeln('Digite o título do livro:');
  readln(livro.titulo);
  writeln('Digite o nome do autor:');
  readln(livro.autor);
  writeln('Digite a quantidade de exemplares:');
  readln(livro.quantidade);
  totalLivros := totalLivros + 1;
end;

procedure RetirarLivro(var livro: Livro);
begin
  writeln('Digite o código do livro que deseja retirar:');
  readln(livro.codigo);
  
  // Busca pelo livro no estoque
  for i := 1 to totalLivros do
  begin
    if biblioteca[i].codigo = livro.codigo then
    begin
      if biblioteca[i].quantidade > 0 then
      begin
        biblioteca[i].quantidade := biblioteca[i].quantidade - 1;
        writeln('Livro retirado com sucesso!');
      end
      else
      begin
        writeln('Não possui o livro em estoque para retirada.');
      end;
      exit;
    end;
  end;
  writeln('Livro não encontrado.');
end;

procedure DevolverLivro(var livro: Livro);
begin
  writeln('Digite o código do livro que deseja devolver:');
  readln(livro.codigo);
  
  // Busca pelo livro no estoque
  for i := 1 to totalLivros do
  begin
    if biblioteca[i].codigo = livro.codigo then
    begin
      biblioteca[i].quantidade := biblioteca[i].quantidade + 1;
      writeln('Livro devolvido com sucesso!');
      exit;
    end;
  end;
  writeln('Livro não encontrado.');
end;

procedure MenuPrincipal();
var
  opcao: integer;
  novoLivro: Livro;
begin
  repeat
    writeln('------ Menu Principal ------');
    writeln('1 - Cadastrar novo livro');
    writeln('2 - Retirar livro');
    writeln('3 - Devolver livro');
    writeln('4 - Sair');
    writeln('Escolha uma opção:');
    readln(opcao);
    
    case opcao of
      1: CadastrarLivro(novoLivro);
      2: RetirarLivro(novoLivro);
      3: DevolverLivro(novoLivro);
      4: writeln('Saindo do sistema.');
      else writeln('Opção inválida. Tente novamente.');
    end;
  until opcao = 4;
end;

begin
  totalLivros := 0;
  MenuPrincipal();
end.