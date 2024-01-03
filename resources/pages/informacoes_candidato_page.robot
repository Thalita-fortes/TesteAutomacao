*** Settings ***
Resource    ../main.robot
Resource    gestao_clientes_page.robot
Library     OperatingSystem
Documentation        Nesse arquivo são adicionados todas as keywords e locatos da página informações do candidato, responsável por enviar o projeto de teste.

*** Variables ***
# Elementos da página
&{informacoes_candidato}
...     campo_nome=xpath=//input[@id='nome']
...     campo_telefone=xpath=//input[@id='telefone']
...     campo_email=xpath=//input[@id='email']
...     campo_github=xpath=//input[@id='githubLink']
...     campo_nome_recrutador=xpath=//input[@id='nomeRecrutador']
...     botao_salvar_informacoes=xpath=//button[@type='button'][contains(.,'Salvar')]
...     mensagem_sucesso=xpath=//div[@class='alert alert-success text-center mt-3'][contains(.,'As informações foram registradas com sucesso!')]



*** Keywords ***
E preencher os campos com as informacoes do Candidato
    ${nome}                Set Variable      João dos testes
    ${telefone}            Set Variable      88999999998
    ${email}               Set Variable      jose@teste.com
    ${github}              Set Variable      https://github.com/josedostestes
    ${nome_recrutador}     Set Variable      João Recrutador

    Scroll Element Into View              ${informacoes_candidato.campo_nome}
    Wait Until Element Is Visible         ${informacoes_candidato.campo_nome}
    Input Text                            ${informacoes_candidato.campo_nome}                    ${nome}
    
    Scroll Element Into View              ${informacoes_candidato.campo_telefone}
    Wait Until Element Is Visible         ${informacoes_candidato.campo_telefone}
    Input Text                            ${informacoes_candidato.campo_telefone}                ${telefone}

    Scroll Element Into View              ${informacoes_candidato.campo_email}
    Wait Until Element Is Visible         ${informacoes_candidato.campo_email}
    Input Text                            ${informacoes_candidato.campo_email}                    ${email}

    Scroll Element Into View              ${informacoes_candidato.campo_github}
    Wait Until Element Is Visible         ${informacoes_candidato.campo_github}
    Input Text                            ${informacoes_candidato.campo_github}                  ${github}

    Scroll Element Into View              ${informacoes_candidato.campo_nome_recrutador}
    Wait Until Element Is Visible         ${informacoes_candidato.campo_nome_recrutador}
    Input Text                            ${informacoes_candidato.campo_nome_recrutador}         ${nome_recrutador}

E clicar no botao Salvar do formulario
    Wait Until Element Is Visible        ${informacoes_candidato.botao_salvar_informacoes}
    Click Element                        ${informacoes_candidato.botao_salvar_informacoes}

ENTÃO o usuario deve ver a mensagem de sucesso "${mensagem_sucesso}"
    Wait Until Element Is Visible             ${informacoes_candidato.mensagem_sucesso}             
    Page Should Contain                       ${mensagem_sucesso}
    Capture Page Screenshot                   informacoes_candidato_success.png
    
    