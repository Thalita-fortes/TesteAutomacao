*** Settings ***
Resource    ../main.robot
Library    OperatingSystem
Documentation        Nesse arquivo são adicionados todas as keywords e locatos da página gestão de clientes, onde pode adicionar, pesquisar, editar e excluir um cliente.

*** Variables ***
# Elementos da página
&{gestao_clientes}
...     aba_cadastrar_cliente=xpath=//a[@class='nav-link '][contains(.,'Cadastrar Cliente')]
...     campo_nome=css=.col-md-9 input
...     campo_imagem=xpath=//input[contains(@type,'file')]
...     campo_telefone=css=input[type='tel']
...     campo_email=css=input[type='email']
...     campo_cep=css= input[pattern='[0-9]{5}-[0-9]{3}']
...     campo_numero=xpath=(//input[@pattern='[0-9]+'])[2]
...     campo_endereco=xpath=(//input[@type='text'])[5]
...     campo_complemento=xpath=(//input[@type='text'])[6]
...     campo_pais=xpath=//select[@class='form-control']
...     opcao_brasil=xpath=//option[@value='br'][contains(.,'Brasil')]
...     campo_pesquisar=xpath=//input[@class='form-control inputSearch']
...     nome_imagem=qa
...     checkbox_genero=xpath=//input[@value='masculino']
...     checkbox_ferramentas=xpath=//input[@value='robot']
...     botao_pesquisar=xpath=//button[contains(.,'Pesquisar')]
...     botao_salvar=xpath=//button[@type='submit'][contains(.,'Salvar')]
...     botao_finalizar=xpath=//a[contains(.,'Finalizar')]
...     botao_logout=xpath=//button[contains(.,'Logout')]
...     botao_editar=xpath=//tr[contains(.,'${nome}')]//a[contains(@href, '/app/editarcliente/')]
...     botao_excluir=xpath=//tr[contains(.,'${nome_editado}')]//a[contains(@href, '/app/home')]
...     botao_sim=xpath=//a[contains(.,'Sim')]
...     cabecalho_modal=css=.titleModal
...     cabecalho_editar=xpath=//h1[contains(.,'Editar Cliente')]
...     botao_enviar=xpath=//button[@type='button'][contains(.,'Enviar')]
...     mensagem_erro=Cliente não encontrado.


*** Keywords ***
Fechar o navegador
    Close Browser

E clique na aba Cadastrar Cliente
    Wait Until Element Is Visible        ${gestao_clientes.aba_cadastrar_cliente}
    Click Element                        ${gestao_clientes.aba_cadastrar_cliente}

E em seguida clicar no botao Logout
    Wait Until Element Is Visible        ${gestao_clientes.botao_logout}
    Click Element                        ${gestao_clientes.botao_logout}

QUANDO o usuario preencher todos os campos corretamente
    ${telefone}        Set Variable          88999999998
    ${email}           FakerLibrary.Email
    ${cep}             Set Variable          62940-000
    ${numero}          Set Variable          123
    ${endereco}        FakerLibrary.Street Address
    ${complemento}     FakerLibrary.Secondary Address

    # Preenchendo todos os campos do formulário
    Wait Until Element Is Visible        ${gestao_clientes.campo_nome}            
    Input Text                           ${gestao_clientes.campo_nome}            ${nome}
    
    Wait Until Element Is Visible        ${gestao_clientes.campo_telefone}            
    Input Text                           ${gestao_clientes.campo_telefone}        ${telefone}
    
    Scroll Element Into View             ${gestao_clientes.campo_email}
    Wait Until Element Is Visible        ${gestao_clientes.campo_email}
    Input Text                           ${gestao_clientes.campo_email}            ${email}
    
    Scroll Element Into View             ${gestao_clientes.campo_cep}
    Wait Until Element Is Visible        ${gestao_clientes.campo_cep}
    Input Text                           ${gestao_clientes.campo_cep}              ${cep}
    
    Scroll Element Into View             ${gestao_clientes.campo_numero}
    Wait Until Element Is Visible        ${gestao_clientes.campo_numero}
    Input Text                           ${gestao_clientes.campo_numero}           ${numero}
    
    Scroll Element Into View             ${gestao_clientes.campo_endereco}
    Wait Until Element Is Visible        ${gestao_clientes.campo_endereco}
    Input Text                           ${gestao_clientes.campo_endereco}         ${endereco}
    
    Scroll Element Into View             ${gestao_clientes.campo_complemento}
    Wait Until Element Is Visible        ${gestao_clientes.campo_complemento}
    Input Text                           ${gestao_clientes.campo_complemento}      ${complemento}
    
    Scroll Element Into View             ${gestao_clientes.checkbox_genero}
    Wait Until Element Is Visible        ${gestao_clientes.checkbox_genero}
    Click Element                        ${gestao_clientes.checkbox_genero}
    
    Scroll Element Into View             ${gestao_clientes.checkbox_ferramentas}
    Wait Until Element Is Visible        ${gestao_clientes.checkbox_ferramentas}
    Click Element                        ${gestao_clientes.checkbox_ferramentas}
  
    ########## BUSCANDO E ANEXANDO A IMAGEM ATRAVÉS DO DIRETÓRIO ##############
    Choose File                          ${gestao_clientes.campo_imagem}                  ${CURDIR}/qa.png
    
    Scroll Element Into View             ${gestao_clientes.campo_pais}
    Wait Until Element Is Visible        ${gestao_clientes.campo_pais}
    Click Element                        ${gestao_clientes.opcao_brasil}
    
    Sleep    10
    
QUANDO o usuario pesquisar por um cliente cadastrado
    Wait Until Element Is Visible        ${gestao_clientes.campo_pesquisar}
    Input Text                           ${gestao_clientes.campo_pesquisar}           ${nome}
    Sleep                                2
    Wait Until Element Is Visible        ${gestao_clientes.botao_pesquisar}
    Click Element                        ${gestao_clientes.botao_pesquisar}

QUANDO o usuario pesquisar por um cliente editado
    Wait Until Element Is Visible        ${gestao_clientes.campo_pesquisar}
    Input Text                           ${gestao_clientes.campo_pesquisar}           ${nome_editado}
    Sleep                                2
    Wait Until Element Is Visible        ${gestao_clientes.botao_pesquisar}
    Click Element                        ${gestao_clientes.botao_pesquisar}

# Botão EDITAR da Tabela
QUANDO o usuario clicar no botao Editar do cliente desejado
    Scroll Element Into View             ${gestao_clientes.botao_editar}
    Wait Until Element Is Visible        ${gestao_clientes.botao_editar}
    Click Element                        ${gestao_clientes.botao_editar}
    # verificando se o elemento identificado da página de edição está presente
    Page Should Contain Element          ${gestao_clientes.cabecalho_editar}

# Botão EXCLUIR da Tabela
QUANDO o usuario clicar no botao Excluir do cliente desejado
    Scroll Element Into View             ${gestao_clientes.botao_excluir}
    Wait Until Element Is Visible        ${gestao_clientes.botao_excluir}
    Click Element                        ${gestao_clientes.botao_excluir}
    

QUANDO o usuario clicar no botao Finalizar
    Wait Until Element Is Visible        ${gestao_clientes.botao_finalizar}
    Click Element                        ${gestao_clientes.botao_finalizar}

# Pop-up do cliente consultado
ENTÃO o usuario deve ver os dados do cliente consultado
    Page Should Contain                  Dados do Cliente
    Sleep                                2        
    Capture Page Screenshot              cliente_encontrado.png


ENTÃO o usuario deve ver os dados do cliente atualizado
    Wait Until Element Is Visible        ${gestao_clientes.campo_pesquisar}
    Input Text                           ${gestao_clientes.campo_pesquisar}           ${nome_editado}
    Sleep                                2
    Wait Until Element Is Visible        ${gestao_clientes.botao_pesquisar}
    Click Element                        ${gestao_clientes.botao_pesquisar}
    Page Should Contain                  Dados do Cliente
    Sleep                                2        
    Capture Page Screenshot              cliente_encontrado.png

QUANDO o usuario preencher todos os campos deixando o campo e-mail invalido
    ${telefone}        Set Variable      88999999998
    ${email}           Set Variable      meu_email
    ${cep}             Set Variable      60823-140
    ${numero}          FakerLibrary.Random Number
    ${endereco}        FakerLibrary.Street Address
    ${complemento}     FakerLibrary.Secondary Address

    # Preenchendo todos os campos do formulário
    Scroll Element Into View             ${gestao_clientes.campo_nome}
    Wait Until Element Is Visible        ${gestao_clientes.campo_nome}            
    Input Text                           ${gestao_clientes.campo_nome}                ${nome}
    
    Scroll Element Into View             ${gestao_clientes.campo_telefone}
    Wait Until Element Is Visible        ${gestao_clientes.campo_telefone}            
    Input Text                           ${gestao_clientes.campo_telefone}            ${telefone}
    
    Scroll Element Into View             ${gestao_clientes.campo_email}
    Wait Until Element Is Visible        ${gestao_clientes.campo_email}
    Input Text                           ${gestao_clientes.campo_email}                ${email}
    
    Scroll Element Into View             ${gestao_clientes.campo_cep}
    Wait Until Element Is Visible        ${gestao_clientes.campo_cep}
    Input Text                           ${gestao_clientes.campo_cep}                  ${cep}
    
    Scroll Element Into View             ${gestao_clientes.campo_numero}
    Wait Until Element Is Visible        ${gestao_clientes.campo_numero}
    Input Text                           ${gestao_clientes.campo_numero}                ${numero}
    
    Scroll Element Into View             ${gestao_clientes.campo_endereco}
    Wait Until Element Is Visible        ${gestao_clientes.campo_endereco}
    Input Text                           ${gestao_clientes.campo_endereco}              ${endereco}
    
    Scroll Element Into View             ${gestao_clientes.campo_complemento}
    Wait Until Element Is Visible        ${gestao_clientes.campo_complemento}
    Input Text                           ${gestao_clientes.campo_complemento}          ${complemento}
    
    Scroll Element Into View             ${gestao_clientes.checkbox_genero}
    Wait Until Element Is Visible        ${gestao_clientes.checkbox_genero}
    Click Element                        ${gestao_clientes.checkbox_genero}
    
    Scroll Element Into View             ${gestao_clientes.checkbox_ferramentas}
    Wait Until Element Is Visible        ${gestao_clientes.checkbox_ferramentas}
    Click Element                        ${gestao_clientes.checkbox_ferramentas}

    Choose File                          ${gestao_clientes.campo_imagem}                  ${CURDIR}/qa.png
    
    Scroll Element Into View             ${gestao_clientes.campo_pais}
    Wait Until Element Is Visible        ${gestao_clientes.campo_pais}
    Click Element                        ${gestao_clientes.opcao_brasil}

E confirmar a exclusao
    Wait Until Element Is Visible        ${gestao_clientes.botao_sim}
    Click Element                        ${gestao_clientes.botao_sim}

E clicar no botao Salvar
    Scroll Element Into View             ${gestao_clientes.botao_salvar}
    Wait Until Element Is Visible        ${gestao_clientes.botao_salvar}
    Click Element                        ${gestao_clientes.botao_salvar}
    Sleep    10

E clicar no botao Enviar do pop-up
    Wait Until Element Is Visible        ${gestao_clientes.botao_enviar}
    Click Element                        ${gestao_clientes.botao_enviar}
    Sleep    5

ENTAO ao pesquisar pelo cliente, o sistema deve informar que não foi encontrado
    QUANDO o usuario pesquisar por um cliente cadastrado
    Page Should Contain                  ${gestao_clientes.mensagem_erro}

ENTAO o usuario deve ver um modal validando o e-mail
    # Wait Until Page Contains            Inclua um "@" no endereço
    # Page Should Contain                 Regular Expression:.*Inclua um "@" no endereço de e-mail*
    
    # Execute JavaScript                             document.evaluate("//*[contains(text(), 'Inclua um "@" no endereço de e-mail')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.style.display = 'block'
    # ${element}=      Get Element Attribute         xpath=//*[contains(text(), 'Inclua um "@" no endereço de e-mail')]
    # Element Should Be Visible                      ${element}

    # ${texto_parcial}    Set Variable                    Inclua um "@" no endereço de e-mail
    # ${resultado}        Validar Mensagem Popover        ${texto_parcial}
    # Should Be True      ${resultado}
    ${alert_text}=     Handle Alert
    Should Be Equal As Strings    ${alert_text}       Insira uma parte depois de "@". "meu_email" está incompleto. 
    Log To Console                ${alert_text}
    