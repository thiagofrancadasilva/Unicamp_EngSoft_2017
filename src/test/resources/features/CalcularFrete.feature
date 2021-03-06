# language: pt
Funcionalidade: Calcular Frete
  Como sistema Bookstore
  Desejo fornecer o peso, largura, altura e comprimento do PRODUTO, o tipo de serviço e endereço do PEDIDO
  Para que os correios calcule o valor do frete e tempo de entrega do pedido

  Cenario: Consultar calculo do frete e tempo de entrega PAC
    Dado um CEP valido e dado do produto e tipo de entrega valido:
      | cep | 13083970 |
      | peso | 5 |
      | largura  | 0.5 |
      | altura | 2 |
      | comprimento | 2 |
      | entrega | PACVAREJO |
    Quando eu informo o CEP no calculo de frete
    Entao O resultado deve ser o valor do frete e tempo de entrega:
      | Valor do Frete       | Tempo   |
      | R$ 10,00 | 7 |
      
  Cenario: Consultar calculo do frete e tempo de entrega SEDEX
    Dado um CEP valido e dado do produto e tipo de entrega valido:
      | cep | 13083970 |
      | peso | 5 |
      | largura  | 0.5 |
      | altura | 2 |
      | comprimento | 2 |
      | entrega | SEDEXVAREJO |
    Quando eu informo o CEP no calculo de frete
    Entao O resultado deve ser o valor do frete e tempo de entrega:
      | Valor do Frete       | Tempo   |
      | R$ 20,00 | 5 |
      
  Cenario: Consultar calculo do frete e tempo de entrega SEDEX 10
    Dado um CEP valido e dado do produto e tipo de entrega valido:
      | cep | 13083970 |
      | peso | 5 |
      | largura  | 0.5 |
      | altura | 2 |
      | comprimento | 2 |
      | entrega | SEDEX10VAREJO |
    Quando eu informo o CEP no calculo de frete
    Entao O resultado deve ser o valor do frete e tempo de entrega:
      | Valor do Frete       | Tempo   |
      | R$ 30,00 | 1 |

  Cenario: Consultar calculo do frete e tempo de entrega com CEP invalido.
    Dado um CEP invalido e dado do produto e tipo de entrega valido:
      | cep | 1234567890 |
      | peso | 5 |
      | largura  | 0.5 |
      | altura | 2 |
      | comprimento | 2 |
      | entrega | PACVAREJO |
    Quando eu informo o CEP no calculo de frete
    Entao Uma excecao deve ser lancada com a mensagem de erro:
    """
    O CEP informado é invalido
    """

   Cenario: Consultar calculo do frete e tempo de entrega com dados do produto invalido
    Dado um CEP valido e dado do produto e tipo de entrega invalido:
      | cep | 13083970 |
      | peso | 0 |
      | largura  | 0 |
      | altura | 0 |
      | comprimento | 0 |
      | entrega | XXX |
    Quando eu informo o CEP no calculo de frete
    Entao Uma excecao deve ser lancada com a mensagem de erro:
    """
    Os dados do produto informado são invalidos
    """

  Cenario: Servico dos Correios nao responde
    Dado um CEP valido e dado do produto e tipo de entrega valido:
      | cep | 13083970 |
      | peso | 5 |
      | largura  | 0.5 |
      | altura | 2 |
      | comprimento | 2 |
      | entrega | PACVAREJO |
    E O servico dos Correios nao esta respondendo
    Quando eu informo o CEP no calculo de frete
    Entao Uma excecao deve ser lancada com a mensagem de erro:
    """
    Serviço indisponivel
    """
    