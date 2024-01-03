*** Settings ***
Resource    ../main.robot
Resource    gestao_clientes_page.robot
Library     OperatingSystem
Documentation        Nesse arquivo são adicionados todas as keywords e locatos da página de edição de clientes

*** Variables ***
# Elementos da página
&{editar_cliente}
...     campo_nome_alterado=xpath=//input[contains(@value,'${nome}')]
...     botao_salvar_edicao=xpath=//button[@type='button'][contains(.,'Salvar')]


*** Keywords ***
E alterar o campo nome
    # ${novo_nome}    Set Variable         Zezão QA 003
    # alterando o nome para atualizar o cadastro
    Wait Until Element Is Visible        ${editar_cliente.campo_nome_alterado}
    Clear Element Text                   ${editar_cliente.campo_nome_alterado}
    Input Text                           ${editar_cliente.campo_nome_alterado}        ${nome_editado}
    Sleep    3

E clicar no botao Salvar do registro atualizado
    Wait Until Element Is Visible        ${editar_cliente.botao_salvar_edicao}
    Click Element                        ${editar_cliente.botao_salvar_edicao}
    Sleep    8