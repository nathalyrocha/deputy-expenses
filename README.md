# Deputy Expenses

No Deputy Expenses é possível visualizar todos os gastos dos deputados do estado do Rio de Janeiro no ano de 2020. Para isso, basta entrar na aplicação (https://deputy-expenses.herokuapp.com/deputies) fazer o upload do arquivo CSV(https://dadosabertos.camara.leg.br/swagger/api.html#staticfile) do ano de 2020 e assim terá a listagem de todos os deputados, podendo pesquisar por nome, partido ou utilizando a paginação da tabela.
Clicando em um deputado, você terá a lista detalhada de todas as suas despesas do ano, com o nome do fornecedor, descrição da despesa, valor líquido e a data de emissão da mesma, e nessa tela terá também gráficos para melhor visualização desses gastos.

# Tecnologias usadas:

* Ruby 2.7.2
* Rails 6.0.3
* Webpacker 4.0
* Redis
* Chartkick
* Groupdate
* Sidekiq
* AWS SDK
* Friendlyid
* Kaminari
* Jquery
* Bootstrap
* RSpec
