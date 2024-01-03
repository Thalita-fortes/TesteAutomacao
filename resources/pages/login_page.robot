*** Settings ***
Resource    ../main.robot
Resource    cadastro_page.robot
Documentation        Nesse arquivo são adicionadas todas as keywords e locatos da página de login.
*** Variables ***
&{login}
...     campo_email=css=input[type='email']
...     campo_senha=css=input[type='password']
...     botao_acessar=css=button[type="button"]
...     mensagem_alerta=css=div[role="alert"]
...     botao_esqueci_senha=xpath=//a[contains(.,'Esqueci minha senha')]
...     logo_prime=xpath=//img[contains(@class,'mb-4 imglogo')]

*** Keywords ***
QUANDO o usuario preencher os campos do login com dados corretos
    Wait Until Element Is Visible         ${login.campo_email}
    Input Text                            ${login.campo_email}           ${registro.email}
    Wait Until Element Is Visible         ${login.campo_senha}
    Input Text                            ${login.campo_senha}          ${registro.senha}

QUANDO o usuario preencher o campo senha com uma senha incorreta
    Wait Until Element Is Visible         ${login.campo_senha}
    Input Text                            ${login.campo_senha}          ${registro.senha_incorreta} 

E clicar no botao Acessar
    Wait Until Element Is Visible         ${login.botao_acessar}
    Click Element                         ${login.botao_acessar}
    Sleep    3

E clicar no botao Esqueci minha senha
    Wait Until Element Is Visible         ${login.botao_esqueci_senha}
    Click Element                         ${login.botao_esqueci_senha}


ENTÃO o usuario deve ser redirecionado para a tela de Gestão de clientes
    Page Should Contain                        Gestão de Clientes
    Capture Page Screenshot                    login_successo.png

ENTÃO o usuario deve ver a mensagem de alerta "${mensagem}"
    Wait Until Element Is Visible             ${login.mensagem_alerta}                
    Page Should Contain                       ${mensagem}
    Capture Page Screenshot                   cadastro_usuario_success.png

ENTÃO o usuario deve ser redirecionado para a tela de login
    Page Should Contain                        Login
    Wait Until Element Is Visible              ${login.logo_prime}
    Capture Page Screenshot                    cadastro_usuario_success.png

#Outras keywords para não repetir teste de login
DADO QUE o usuario efetue login com sucesso
     DADO QUE o usuario acesse o site da prime control
     E clicar no botao Fazer Login
     QUANDO o usuario preencher os campos do formulario de login
     E clicar no botao Acessar
     ENTÃO o usuario deve ser redirecionado para a tela de Gestão de clientes