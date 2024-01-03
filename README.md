# Configurando o Postman para Executar Testes do Desafio

Este guia fornece instruções passo a passo para configurar o Postman, baixar arquivos do GitHub e preparar seu ambiente para executar testes usando as Collections e Environments fornecidos no Desafio.

## Passo 1: Baixar e Instalar o Postman

1. Acesse o site oficial do Postman em [https://www.postman.com/](https://www.postman.com/).
2. Clique no botão "Download" para obter a versão mais recente do Postman.
3. Siga as instruções de instalação para o seu sistema operacional (Windows, macOS, Linux).

## Passo 2: Baixar os Arquivos do GitHub

1. Acesse o repositório GitHub onde os arquivos estão localizados.
2. Localize o botão "Code" e clique nele.
3. Escolha a opção "Download ZIP" para baixar todos os arquivos em um arquivo compactado.
4. Extraia o conteúdo do arquivo ZIP para uma pasta de sua escolha.

## Passo 3: Importar a Collection no Postman

1. Abra o Postman após a instalação.
2. Na interface do Postman, clique no botão "Import" no canto superior esquerdo.
3. Selecione a opção "Import File" e navegue até a pasta onde você extraiu os arquivos do GitHub.
4. Selecione o arquivo "Desafio.postman_collection.json" e clique em "Open" para importar a Collection.

Agora, seu ambiente está configurado para executar os testes. Certifique-se de ter as configurações adequadas antes de iniciar os testes. Agora você pode explorar as Collections importadas e executar os testes conforme necessário.

## Passo 4: Execução dos Testes

Para executar as automações da API corretamente, siga a sequência abaixo.

Na parte superior do Postman tem uma aba chamada "Tests". Acesse ela para obter mais orientações sobre a execução dos testes.


1. Execute o teste GET do arquivo "listClientsOK":</br>
	Clique no arquivo "listClientsOK" e em seguida, no botão "Send".</br>
	Verifique as abas Body e Test Results para analisar o resultado do teste.

2. Execute o teste POST do arquivo "addClienteOK":</br>
	Clique no arquivo "addClienteOK" e em seguida, no botão "Send".</br>
	Verifique as abas Body e Test Results para analisar o resultado do teste.

3. Execute o teste PUT do arquivo "updateClientOK":</br>
	Clique no arquivo "updateClientOK" e em seguida, no botão "Send".</br>
	Verifique as abas Body e Test Results para analisar o resultado do teste.

4. Execute o teste DELL do arquivo "deleteClientOK":</br>
	Clique no arquivo "deleteClientOK" e em seguida, no botão "Send".</br>
	Verifique as abas Body e Test Results para analisar o resultado do teste.

Essa é apenas uma orientação de como executar os testes de forma sequencial. Você pode executá-los em qualquer ordem, porém, nos que precisam de ID do Cliente, é necessário informá-lo na url do teste.
