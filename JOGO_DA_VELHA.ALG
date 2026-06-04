algoritmo "JOGO_DA_VELHA"
// Criadores originais: Felipe Fonseca Cardoso e Maria Paula Lopes Silva
var
   Tab: vetor [1..3, 1..3] de caractere
   L, C: inteiro
   Porvir1, Porvir2: real
   Jogadas, OP, IndJ, ContPart: inteiro
   VJ1, VJ2: inteiro
   Vazio: caractere
   Ind, Vit: logico

// Procedimento que limpa/inicia a matriz
procedimento IniciandoMatriz()
inicio
   Vit <- falso
   Jogadas <- 0
   para L de 1 ate 3 faca
      para C de 1 ate 3 faca
         Tab[L, C] <- "-"
      fimpara
   fimpara
fimprocedimento

// Exibe o tabuleiro na tela
procedimento Velha()
inicio
   limpatela()
   escreval("   JOGO DA VELHA   ")
   escreval("===================")
   escreval("+---+---+---+")
   para L de 1 ate 3 faca
      para C de 1 ate 3 faca
         escreva("| ", Tab[L, C], " ")
      fimpara
      escreva("|")
      escreval()
      escreval("+---+---+---+")
   fimpara
   escreval("===================")
fimprocedimento

// Valida e recebe a jogada
procedimento Jogada()
inicio
   escreva("POSICAO DA LINHA (1-3): ")
   leia(L)
   escreva("POSICAO DA COLUNA (1-3): ")
   leia(C)

   se (L < 1) ou (L > 3) ou (C < 1) ou (C > 3) entao
      escreval("POSICAO INVALIDA! TENTE NOVAMENTE.")
      Ind <- falso
   senao
      se (Tab[L, C] <> "-") entao
         escreval("JOGADA INVALIDA. POSICAO OCUPADA.")
         Ind <- falso
      senao
         Ind <- verdadeiro
      fimse
   fimse
fimprocedimento

// Verifica vitoria do Jogador 1 (X)
procedimento VencedorX()
inicio
   // Verificando Linha
   para L de 1 ate 3 faca
      se (Tab[L, 1] = "X") e (Tab[L, 2] = "X") e (Tab[L, 3] = "X") entao
         VJ1 <- VJ1 + 1
         Vit <- verdadeiro
         limpatela()
         Velha()
         escreval("JOGADOR 1 GANHOU!!")
         escreva("PRESSIONE [ENTER] PARA CONTINUAR.")
         leia(Vazio)
      fimse
   fimpara

   // Verificando Coluna
   para C de 1 ate 3 faca
      se (Tab[1, C] = "X") e (Tab[2, C] = "X") e (Tab[3, C] = "X") entao
         VJ1 <- VJ1 + 1
         Vit <- verdadeiro
         limpatela()
         Velha()
         escreval("JOGADOR 1 GANHOU!!")
         escreva("PRESSIONE [ENTER] PARA CONTINUAR.")
         leia(Vazio)
      fimse
   fimpara

   // Verificando Diagonais
   se (Tab[1, 1] = "X") e (Tab[2, 2] = "X") e (Tab[3, 3] = "X") entao
      VJ1 <- VJ1 + 1
      Vit <- verdadeiro
      limpatela()
      Velha()
      escreval("JOGADOR 1 GANHOU!!")
      escreva("PRESSIONE [ENTER] PARA CONTINUAR.")
      leia(Vazio)
   fimse

   se (Tab[1, 3] = "X") e (Tab[2, 2] = "X") e (Tab[3, 1] = "X") entao
      VJ1 <- VJ1 + 1
      Vit <- verdadeiro
      limpatela()
      Velha()
      escreval("JOGADOR 1 GANHOU!!")
      escreva("PRESSIONE [ENTER] PARA CONTINUAR.")
      leia(Vazio)
   fimse
fimprocedimento

// Verifica vitoria do Jogador 2 (O)
procedimento VencedorO()
inicio
   // Verificando Linha
   para L de 1 ate 3 faca
      se (Tab[L, 1] = "O") e (Tab[L, 2] = "O") e (Tab[L, 3] = "O") entao
         VJ2 <- VJ2 + 1
         Vit <- verdadeiro
         limpatela()
         Velha()
         escreval("JOGADOR 2 GANHOU!!")
         escreva("PRESSIONE [ENTER] PARA CONTINUAR.")
         leia(Vazio)
      fimse
   fimpara

   // Verificando Coluna
   para C de 1 ate 3 faca
      se (Tab[1, C] = "O") e (Tab[2, C] = "O") e (Tab[3, C] = "O") entao
         VJ2 <- VJ2 + 1
         Vit <- verdadeiro
         limpatela()
         Velha()
         escreval("JOGADOR 2 GANHOU!!")
         escreva("PRESSIONE [ENTER] PARA CONTINUAR.")
         leia(Vazio)
      fimse
   fimpara

   // Verificando Diagonais
   se (Tab[1, 1] = "O") e (Tab[2, 2] = "O") e (Tab[3, 3] = "O") entao
      VJ2 <- VJ2 + 1
      Vit <- verdadeiro
      limpatela()
      Velha()
      escreval("JOGADOR 2 GANHOU!!")
      escreva("PRESSIONE [ENTER] PARA CONTINUAR.")
      leia(Vazio)
   fimse

   se (Tab[1, 3] = "O") e (Tab[2, 2] = "O") e (Tab[3, 1] = "O") entao
      VJ2 <- VJ2 + 1
      Vit <- verdadeiro
      limpatela()
      Velha()
      escreval("JOGADOR 2 GANHOU!!")
      escreva("PRESSIONE [ENTER] PARA CONTINUAR.")
      leia(Vazio)
   fimse
fimprocedimento

// Verifica empate
procedimento Empate()
inicio
   se (Vit = falso) e (Jogadas >= 9) entao
      limpatela()
      Velha()
      escreval("DEU VELHA!!")
      escreva("PRESSIONE [ENTER] PARA CONTINUAR.")
      leia(Vazio)
      Vit <- verdadeiro // Finaliza o loop da rodada
   fimse
fimprocedimento

// Alterna o turno do jogador indicador
procedimento AlternarJogador()
inicio
   se (IndJ = 1) entao
      IndJ <- 2
   senao
      IndJ <- 1
   fimse
fimprocedimento

// Aplica o caractere no tabuleiro baseado no jogador atual
procedimento X_O()
inicio
   se (IndJ = 1) entao
      Tab[L, C] <- "X"
   fimse
   se (IndJ = 2) entao
      Tab[L, C] <- "O"
   fimse
fimprocedimento

// Inicio do Programa Principal
inicio
   OP <- 0
   VJ1 <- 0
   VJ2 <- 0
   ContPart <- 0

   enquanto (OP <> 2) faca
      limpatela()
      IndJ <- 2 // Começa em 2 porque a rotina interna vai alternar para o Jogador 1 no inicio

      escreval("CRIADORES DO JOGO:")
      escreval("FELIPE FONSECA CARDOSO - 9519")
      escreval("MARIA PAULA LOPES SILVA - 9284")
      escreval()
      escreval("OLA JOGADORES!")
      escreval("SEJAM BEM-VINDOS AO JOGO DA VELHA!")
      escreval()
      escreva("DESEJA JOGAR O JOGO DA VELHA? (1.SIM / 2. NAO): ")
      leia(OP)

      se (OP = 1) entao
         IniciandoMatriz()
         repita
            Jogadas <- Jogadas + 1
            Velha()
            AlternarJogador()
            escreval("JOGADOR ", IndJ, ":")

            repita
               Jogada()
            ate (Ind = verdadeiro)

            X_O()
            VencedorX()
            VencedorO()
            Empate()
         ate (Vit = verdadeiro) ou (Jogadas >= 9)
      fimse
   fimenquanto

   // Quando sai do menu (OP = 2) exibe as estatísticas
   limpatela()
   ContPart <- (VJ1 + VJ2)

   escreval("--- ESTATISTICAS DO JOGO ---")
   escreval()
   escreval("NÚMERO DE VITÓRIAS DO JOGADOR [1]: ", VJ1)
   escreval("NÚMERO DE VITÓRIAS DO JOGADOR [2]: ", VJ2)
   escreval()

   se (ContPart > 0) entao
      Porvir1 <- (VJ1 / ContPart) * 100
      Porvir2 <- (VJ2 / ContPart) * 100
      escreval("--- PORCENTAGEM DE VITÓRIAS ---")
      escreval("PORCENTAGEM DE VITÓRIAS DO JOGADOR [1]: ", Porvir1:3:1, "%")
      escreval("PORCENTAGEM DE VITÓRIAS DO JOGADOR [2]: ", Porvir2:3:1, "%")
   senao
      escreval("Nenhuma partida completa foi pontuada.")
   fimse
   escreval()
   escreval("Obrigado por jogar!")
fimalgoritmo