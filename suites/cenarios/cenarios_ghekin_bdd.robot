*** Settings ***
Resource    ../../resources/main.robot
Test Teardown        Fechar o navegador

*** Test Cases ***
# Adicionei esse cenário para não precisar mudar o e-mail a ser cadastrado para utilizar nos demais testes
# CT000 – Criar conta padrao dos testes
#     [Tags]        criar_conta_padrao
#     DADO QUE o usuario acesse o site da prime control
#     E clicar no botao Criar uma conta
#     QUANDO o usuario preencher os campos do cadastro padrao
#     E clicar no botao Criar conta
#     ENTÃO o usuario deve ser redirecionado para a tela de login

CT001 – Criar uma nova Conta com sucesso
    [Tags]        criar_conta
    DADO QUE o usuario acesse o site da prime control
    E clicar no botao Criar uma conta
    QUANDO o usuario preencher os campos do cadastro
    E clicar no botao Criar conta
    ENTÃO o usuario deve ser redirecionado para a tela de login
    Sleep        5

CT002 – Validar criação de uma conta com Email já cadastrado
    [Tags]        email_invalido
    DADO QUE o usuario acesse o site da prime control
    E clicar no botao Criar uma conta
    QUANDO o usuario preencher os campos do cadastro com e-mail já cadastrado
    E clicar no botao Criar conta
    ENTÃO o usuario deve ver a mensagem "Esse email já está em uso por outra conta"

CT003 – Realizar Login com sucesso
    [Tags]        login_sucesso
    DADO QUE o usuario acesse o site da prime control
    E clicar no botao Fazer Login
    QUANDO o usuario preencher os campos do login com dados corretos
    E clicar no botao Acessar
    ENTÃO o usuario deve ser redirecionado para a tela de Gestão de clientes

CT004 – Validar Login com senha inválida
    [Tags]        senha_invalida
    DADO QUE o usuario acesse o site da prime control
    E clicar no botao Fazer Login
    QUANDO o usuario preencher o campo senha com uma senha incorreta
    E clicar no botao Acessar
    ENTÃO o usuario deve ver a mensagem de alerta "E-mail ou senha inválida"

CT005 – Realizar Cadastro de Clientes com sucesso na aba Perfil
    [Tags]        cadastrar_cliente
    DADO QUE o usuario efetue login com sucesso
    E clique na aba Cadastrar Cliente
    QUANDO o usuario preencher todos os campos corretamente
    E clicar no botao Salvar
    ENTÃO o usuario deve ser redirecionado para a tela de Gestão de clientes

CT006 – Validar Pesquisa de Cliente recém cadastrado e exibição dos dados em tela
    [Tags]        pesquisar_cliente
    DADO QUE o usuario efetue login com sucesso
    QUANDO o usuario pesquisar por um cliente cadastrado
    ENTÃO o usuario deve ver os dados do cliente consultado

CT007 – Editar Cliente através do botão na listagem de clientes
    [Tags]        editar_cliente
    DADO QUE o usuario efetue login com sucesso
    QUANDO o usuario clicar no botao Editar do cliente desejado
    E alterar o campo nome
    E clicar no botao Salvar do registro atualizado
    ENTÃO o usuario deve ver os dados do cliente atualizado

#  CT008 – Validar Cadastro de Clientes com Email inválido na aba Perfil
#      [Tags]        cadastrar_email_invalido
#      DADO QUE o usuario efetue login com sucesso
#      E clique na aba Cadastrar Cliente
#      QUANDO o usuario preencher todos os campos deixando o campo e-mail invalido
#      E clicar no botao Salvar
#      ENTAO o usuario deve ver um modal validando o e-mail

CT010 – Realizar Logout com sucesso ao clicar em “Finalizar”
     [Tags]        efetuar_logout
     DADO QUE o usuario efetue login com sucesso
     QUANDO o usuario clicar no botao Finalizar
     E em seguida clicar no botao Logout
     ENTÃO o usuario deve ser redirecionado para a tela de login

CT011 – Recuperar senha de acesso
    [Tags]        recuperar_senha
    DADO QUE o usuario acesse o site da prime control
    E clicar no botao Fazer Login
    E clicar no botao Esqueci minha senha
    QUANDO o usuario informar seu email
    E clicar no botao Enviar
    ENTÃO o usuario devera ver a mensagem "Email enviado com sucesso"

CT012 – Validar preenchimento “Informações do Candidato” ao clicar em “Finalizar e Enviar”
    [Tags]        validar_preenchimento
    DADO QUE o usuario efetue login com sucesso
    QUANDO o usuario clicar no botao Finalizar
    E clicar no botao Enviar do pop-up
    E preencher os campos com as informacoes do Candidato
    E clicar no botao Salvar do formulario
    ENTÃO o usuario deve ver a mensagem de sucesso "As informações foram registradas com sucesso!"
    
#Cenário Extra
CT013 – Excluir cliente apos enviar o teste
    [Tags]        excluir_cliente
    DADO QUE o usuario efetue login com sucesso
    QUANDO o usuario clicar no botao Excluir do cliente desejado
    E confirmar a exclusao
    ENTAO ao pesquisar pelo cliente, o sistema deve informar que não foi encontrado