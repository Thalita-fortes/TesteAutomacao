*** Settings ***
Resource    ../main.robot
Library     FakerLibrary
Documentation        Nessa tela são adicionadas as variáveis comuns entre os testes

*** Variables ***
#Variável do tipo lista, usada para fazer o login no sistema para os demais testes
&{registro}
...     email=teste@teste11.com     #sempre que for executar a suite de testes, deve atualizar esse e-mail   
...     senha=pwd123                   
...     senha_incorreta=ABC123

#Variáveis que podem ser modificadas se desejado
${nome}                   Zezão QA 003
${nome_editado}           Zezão QA 004

*** Keywords ***
