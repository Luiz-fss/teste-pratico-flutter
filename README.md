Este projeto utiliza o padrão de Clean Architecture, separando as resposabilidades.

Organização da pasta: data / domain / presenter / routes

Data: Responsavél por implementar as fontes de dados que são externas e mapear os dados.

data/models: Representação dos dados que chegam da api.

data/repositories: Fazem a comunicação com a api.

Domain: Lógica de negócio

domain/entities: Objetos que serão utilizados pela aplicação.

domain/repositorie: Interfaces que vão definir o que o repositório precisará fazer.

domain/usercases: Ações executadas pelo aplicativo, como no exemplo do projeto, buscar uma lista
de usuários.

Presenter: Camada responsável por mostrar informações ao usuário.

presenter/components: Partes componentizadas para serem reutilizadas .

presenter/pages: São as telas do aplicativo.

Routes: Rotas do aplicativo, os caminhos para navegação entre as páginas

routes/app_routes.dart: Arquivo responsável por centralizar as rotas do aplicativo

routes/user_routes: Define rotas relacionadas ao usuário

Foi implementado esse modelo, visando organização do código e facilitação de manutenções. O uso do
GetX foi implementado como um meio de gerenciar as rotas de forma eficiente.

