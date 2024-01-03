*** Settings ***
Resource    ../main.robot
Resource    cadastro_page.robot
Documentation        Nesse arquivo são adicionadas todas as keywords e locatos da página de recuperação de senha.

*** Variables ***
&{recuperar_senha}
...     campo_email=css=input[type='email']
...     botao_enviar=css=button[type="button"]
...     mensagem_alerta=css=div[role="alert"]

*** Keywords ***
QUANDO o usuario informar seu email
    Wait Until Element Is Visible         ${recuperar_senha.campo_email}
    Input Text                            ${recuperar_senha.campo_email}           ${registro.email}

E clicar no botao Enviar
    Wait Until Element Is Visible        ${recuperar_senha.botao_enviar}
    Click Element                        ${recuperar_senha.botao_enviar}
    Sleep    3        
ENTÃO o usuario devera ver a mensagem "${mensagem_sucesso}"
    Wait Until Element Is Visible        ${recuperar_senha.mensagem_alerta}
    Page Should Contain                  ${mensagem_sucesso}