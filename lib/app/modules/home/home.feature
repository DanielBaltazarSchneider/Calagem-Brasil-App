Feature: Login
  Como um cliente
  Quero poder acessar minha conta e me manter logado
  Para visualizar as informações do portal de forma rápida

  Cenário: Credenciais válidas
    Dado que o cliente informou credenciais válidas
    Quando solicitar para fazer login
    Então o sistena deve enviar o usuário para a tela inicial
    E manter o usuário conectado

  Scenario: Credenciais inválidas
    Dado que o cliente informou credenciais inválidas
    Quando solicitar para fazer o login
    Então o sistema deve retorna uma mensagem de erro