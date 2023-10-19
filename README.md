# README

## Versão Ruby:
- Ruby 3.2.2
- Disponível em: [Ruby Downloads](https://www.ruby-lang.org/en/downloads/)

## Versão Rails:
- Rails 7.0.8

## Dependências do sistema:
- NodeJS
- Yarn

## Database utilizada:
- SQLite 3

## Instruções para inicialização:

1. Clone o repositório em sua máquina.
2. Execute o comando `bundle install` para instalar as dependências Ruby.
3. Execute `yarn install` para instalar as dependências JavaScript.
4. Execute `rails s` para iniciar o servidor Rails.
5. Acesse a aplicação em [http://localhost:3000].

## Instruções relacionadas à importação de arquivos:

- A aba "Importação de arquivos" contempla o campo para seleção de arquivos, que podem ser tanto ".txt" como ".csv".
- Para a importação ocorrer corretamente, o arquivo deve conter a separação por TAB e conter o cabeçalho.

* Exemplo de formato válido:

purchaser name	item description	item price	purchase count	merchant address	merchant name
João Silva	R$10 off R$20 of food	10.0	2	987 Fake St	Bob's Pizza

- É possível listar tudo o que foi importado na aba "Lista de Compradores".
- É possível adicionar um novo cadastro manualmente.
- Existe a possibilidade de editar um cadastro salvo ou também deletá-lo.
- Contempla o cálculo de "Total Bruto" (em R$).

## Usuários de VSCode:

- Foram utilizadas as seguintes extensões: 

Ruby [https://marketplace.visualstudio.com/items?itemName=rebornix.Ruby];
Ruby on Rails [https://marketplace.visualstudio.com/items?itemName=hridoy.rails-snippets];
Ruby LSP [https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-lsp];
Bootstrap 4, Font awesome 4, Font Awesome 5 Free & Pro snippets [https://marketplace.visualstudio.com/items?itemName=thekalinga.bootstrap4-vscode];
ERB Formatter/Beautify [https://marketplace.visualstudio.com/items?itemName=aliariff.vscode-erb-beautify];
ruby-rubocop [https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop];
Tailwind CSS IntelliSense [https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss]


## Erros identificados e como foram corrigidos:

- **Problema**: Ao tentar instalar as gems, ocorria um erro ao tentar acessar o endereço: "https://rubygems.org".

  **Solução**: Resolvido rodando os seguintes comandos:

  gem source -a http://rubygems.org
  gem update --system


- **Problema**: Ao tentar iniciar o servidor Rails, ocorria um erro na gem "nokogiri".

  **Solução**: Resolvido rodando os seguintes comandos:

  gem uninstall nokogiri
  gem install nokogiri

- **Problema**: Ao tentar iniciar o servidor Rails, ocorria um erro na gem "nokogiri".

  **Solução**: Resolvido rodando os seguintes comandos:

  gem uninstall nokogiri
  gem install nokogiri

- **Problema**: Não estava sendo possível rodar o debugger corretamente no VSCode.

  **Solução**: Resolvido da seguinte forma:

  1- Crie uma pasta chamada ".vscode" dentro do root_path.
  2- Crie o arquivo "launch.json" e insira os seguintes dados:

  {
    "configurations": [
        {
            "name": "Listen for rdebug-ide",
            "type": "Ruby",
            "request": "attach",
            "remoteHost": "127.0.0.1",
            "remotePort": "3001",
            "remoteWorkspaceRoot": "${workspaceRoot}"
        }
    ]
}
  3- Rode o comando:

  rdebug-ide --host 0.0.0.0 --port 3001 --dispatcher-port 3001 -- bin/rails s

  4- Execute o debugger no VSCode "Listen for rdebug-ide"





