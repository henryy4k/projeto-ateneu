require 'set'

def cria_campo
  Array.new(6) { Array.new(6, '[ ]') }
end

def sortear_bombas
  bombas = Set.new
  while bombas.size < 3
    x = rand(6)
    y = rand(6)
    bombas.add([x, y])
  end
  bombas
end

def coordenada_valida?(jogada)
  letras = ('A'..'F').to_a
  numeros = ('1'..'6').to_a

  return false if jogada.length != 2

  letra, numero = jogada.chars
  letras.include?(letra.upcase) && numeros.include?(numero)
end

def traduzir_jogada(jogada)
  letra, numero = jogada.upcase.chars
  coluna = letra.ord - 'A'.ord
  linha = numero.to_i - 1
  [linha, coluna]
end

def imprime_campo(campo)
  letras = ['A', 'B', 'C', 'D', 'E', 'F']
  puts '   ' + letras.map { |l| " #{l} " }.join
  campo.each_with_index do |linha, i|
    puts "#{i + 1}  " + linha.join(' ')
  end
end

def jogar_campo_minado
  campo = cria_campo
  bombas = sortear_bombas
  jogadas_restantes = 5
  jogadas_realizadas = Set.new

  puts "Vamos jogar!"
  imprime_campo(campo)

  while jogadas_restantes > 0
    puts "Você tem #{jogadas_restantes} jogada(s) restante(s)."
    print "Escolha uma posição (ex: A1, B3, etc): "
    jogada = gets.chomp

    unless coordenada_valida?(jogada)
      puts "Jogada inválida. Tente novamente!"
      next
    end

    linha, coluna = traduzir_jogada(jogada)

    if jogadas_realizadas.include?([linha, coluna])
      puts "Você já escolheu essa posição. Tente outra!"
      next
    end

    jogadas_realizadas.add([linha, coluna])

    if bombas.include?([linha, coluna])
      campo[linha][coluna] = '[X]'
      imprime_campo(campo)
      puts "Você pisou em uma mina! Fim de jogo."
      return
    else
      campo[linha][coluna] = '[O]'
      imprime_campo(campo)
    end

    jogadas_restantes -= 1
  end

  puts "Parabéns! Você venceu o jogo!"
end

jogar_campo_minado

