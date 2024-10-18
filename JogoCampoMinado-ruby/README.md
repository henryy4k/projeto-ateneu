- Como rodar o jogo:
Instale Ruby no seu computador.
Copie o código em um arquivo .rb
Execute o arquivo usando o comando ruby campo_minado.rb no terminal.

- Explicação do Código:
Função cria_campo: Cria uma matriz 6x6 onde cada célula é representada por '[ ]', indicando que ainda não foi revelada.

Função sortear_bombas: Sorteia 3 posições aleatórias na matriz (representadas por coordenadas [x, y]), onde serão colocadas as bombas. Usamos um Set para garantir que não haja posições repetidas.

Função coordenada_valida?: Verifica se a jogada do usuário é válida. Ela checa se a entrada tem dois caracteres, onde o primeiro deve ser uma letra entre 'A' e 'F' e o segundo um número entre '1' e '6'.

Função traduzir_jogada: Traduz a jogada do formato para índices da matriz, convertendo a letra em coluna e o número em linha.

Função imprime_campo: Imprime o campo minado atual, com letras representando as colunas e números representando as linhas. As células ainda não jogadas aparecem como [ ], enquanto acertos de posições sem mina são mostrados como [O], e minas descobertas como [X].

Função jogar_campo_minado: A função principal que controla o fluxo do jogo. Ela começa criando o campo e sorteando as bombas. O usuário faz até 5 jogadas, com o jogo terminando se ele pisar em uma mina (mostra um '[X]' na posição), ou vencendo se não pisar em nenhuma bomba ao final das jogadas.

Fluxo do Jogo:
O usuário tem até 5 chances para jogar, escolhendo as posições do campo onde acredita não haver bombas.
Se acertar uma mina, o jogo termina imediatamente com uma derrota.
Se passar pelas 5 jogadas sem encontrar bombas, ele vence.


- Sintaxe da linguagem Ruby

Declaração de Variáveis: Em Ruby, você não precisa especificar o tipo das variáveis. Você cria uma variável e atribui um valor a ela:

ex: 
nome = "Jhon"  # Variável do tipo string
idade = 25       # Variável do tipo número

Métodos (Funções): Em Ruby, você define métodos com a palavra-chave def, e eles não precisam de parênteses se não tiver parâmetros. O que é retornado é a última coisa avaliada na função:

ex:
def saudacao(nome)
  "Olá, #{nome}!"  # #{nome} faz interpolação de variáveis em strings
end
Para chamar a função:

ex:
puts saudacao("Jhon")  # Resultado: "Olá, Jhon!"
Estruturas de Controle: Condicionais em Ruby são bem simples e claras:

ex:
if idade >= 18
  puts "Você é maior de idade."
else
  puts "Você é menor de idade."
end
Também tem um operador legal chamado "ternário", que é uma forma compacta:

ex:
puts idade >= 18 ? "Maior de idade" : "Menor de idade"