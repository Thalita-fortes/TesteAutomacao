*** Settings ***
Resource    ../main.robot
Library     Collections
Documentation        Nesse arquivo são adicionados todas as keywords e locatos da página cadastro de usuário
*** Variables ***
&{cadastro}
...     campo_email=css=input[type='email']
...     campo_senha=css=input[type='password']
...     botao_criar_conta=css=button[type="button"]
...     mensagem_alerta=css=div[role="alert"]

*** Keywords ***
QUANDO o usuario preencher os campos do cadastro
    ${email_aleatorio}                    FakerLibrary.Email
    Wait Until Element Is Visible         ${cadastro.campo_email}
    Input Text                            ${cadastro.campo_email}           ${email_aleatorio}
    Wait Until Element Is Visible         ${cadastro.campo_senha}
    Input Text                            ${cadastro.campo_senha}           ${registro.senha}

QUANDO o usuario preencher os campos do formulario de login
    Wait Until Element Is Visible         ${cadastro.campo_email}
    Input Text                            ${cadastro.campo_email}           ${registro.email}
    Wait Until Element Is Visible         ${cadastro.campo_senha}
    Input Text                            ${cadastro.campo_senha}           ${registro.senha}

QUANDO o usuario preencher os campos do cadastro com e-mail já cadastrado
    Wait Until Element Is Visible         ${cadastro.campo_email}
    Input Text                            ${cadastro.campo_email}           ${registro.email}
    Wait Until Element Is Visible         ${cadastro.campo_senha}
    Input Text                            ${cadastro.campo_senha}           ${registro.senha}

E clicar no botao Criar conta
    Wait Until Element Is Visible         ${cadastro.botao_criar_conta}
    Click Element                         ${cadastro.botao_criar_conta}
    Sleep    3

ENTÃO o usuario deve ver a mensagem "${mensagem}"
    Wait Until Element Is Visible             ${cadastro.mensagem_alerta}             
    Page Should Contain                       ${mensagem}
    Capture Page Screenshot                   cadastro_usuario_success.png

# QUANDO o usuario preencher os campos do cadastro padrao
#     Wait Until Element Is Visible         ${cadastro.campo_email}
#     Input Text                            ${cadastro.campo_email}           ${registro.email}
#     Wait Until Element Is Visible         ${cadastro.campo_senha}
#     Input Text                            ${cadastro.campo_senha}           ${registro.senha}
#     E clicar no botao Criar conta