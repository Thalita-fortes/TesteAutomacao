# Importando a biblioteca necessária
from robot.api.deco import keyword
from robot.libraries.BuiltIn import BuiltIn

@keyword('Validar Mensagem Popover')
def validar_mensagem_popover(texto_parcial):
    # Obtendo a instância atual do BuiltIn do Robot Framework
    builtin_lib = BuiltIn()

    # Obtendo o texto do pop-over (substitua 'seletor_popover' pelo seletor real)
    texto_popover = builtin_lib.run_keyword("Capture Page Screenshot")
    # Suponha que o texto do pop-over esteja armazenado em 'texto_popover'

    # Validando se o texto parcial está presente no pop-over
    if texto_parcial in texto_popover:
        print(f"A mensagem '{texto_parcial}' foi encontrada no pop-over.")
        return True
    else:
        print(f"A mensagem '{texto_parcial}' não foi encontrada no pop-over.")
        return False
