*** Settings ***
Resource    ../main.robot
Library     ../libs/arquivo.py 


Documentation        Nessa tela é adicionada a url do site e qual navegador vou usar nos testes
*** Variables ***
&{geral}
...     url=https://challenge.primecontrol.com.br/
...     browser=chrome

*** Keywords ***