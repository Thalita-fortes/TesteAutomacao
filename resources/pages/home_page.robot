*** Settings ***
Resource    ../main.robot
Documentation        Nesse arquivo são adicionados todas as keywords e locatos da página home.

*** Variables ***
&{home}
...     botao_criar_uma_conta=css=a[href="/app/novaconta"]
...     botao_fazer_login=css=a[href="/app"]
...     logo_prime_control=xpath=//img[contains(@height,'28')]

*** Keywords ***
 DADO QUE o usuario acesse o site da prime control
    Open Browser    ${geral.url}       ${geral.browser}        options=add_argument("--start-maximized");add_argument("--disable-popup-blocking")
    
E clicar no botao Criar uma conta
    Click Element    ${home.botao_criar_uma_conta}
    
E clicar no botao Fazer Login
    Click Element    ${home.botao_fazer_login}