# REPOSITORY
É o responsável por seperar suas entidades , basicamente, entidades são todas as "tabelas" da sua 
base de dados que irão interagir com seu ou seus providers.

O repository tem o objetivo de abstrair e separar, sua fonte de dados do seus controladores, tendo 
assim, um ponto único de falha, ou seja, se um dia você vier a trocar a api ou base de dados do seu 
projeto, basta alterar seus arquivos providers, não sendo necessário nenhuma alteração no repository, 
pois ele só é responsável por chamar a função do provider, não havendo lógica nenhuma ali.

ex Imagine que você possua um aplicativo de venda de produtos, que possua apenas os clientes e os 
produtos de um estabelecimento.

Podemos identificar facilmente nossas entidades nos fazendo uma pergunta.
Irei receber e/ou enviar dados dessa entidade? Se a resposta for sim, então ela precisa de um 
repository.

No nosso exemplo teríamos três repositories, UserRepository, ProdutoRepository, 
EstabelecimentoRepository.

Algumas vezes, podemos tirar essas entidades nos baseando em nossas classes, mas muitas vezes 
existem classes auxiliares que não estão necessariamente na sua base de dados ou api, portanto 
preferimos nos basear no que realmente interage com sua base de dados.