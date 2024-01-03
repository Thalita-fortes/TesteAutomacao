*** Settings ***
Library     SeleniumLibrary
Documentation        Nessa tela são adicionadas todas as comunicações do projeto, ela possui acesso a todas as camadas.
# Ela é importante para não precisar das suites ficar importando as pages e resources

### Data ###
Resource    data/geral.robot
Resource    data/registro.robot

### Pages ###
Resource    pages/login_page.robot
Resource    pages/recuperar_senha_page.robot
Resource    pages/home_page.robot
Resource    pages/cadastro_page.robot
Resource    pages/gestao_clientes_page.robot
Resource    pages/editar_cliente_page.robot
Resource    pages/informacoes_candidato_page.robot