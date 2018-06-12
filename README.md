# TRABALHO 01 : Vagas Dev-ES
Trabalho desenvolvido durante a disciplina de BD

    O referido projeto poderá ser:
        a) Um novo sistema/projeto 
        b) Uma expansão de sistema/projeto previamente desenvolvido em disciplinas anteriores 
        (ex: Expansão dos módulos do sistema desenvolvidos em BD1 - incremento mínimo de 50% nos 
        requisitos/complexidade)
        c) Nas avaliações parciais do professor, o grupo deverá anotar todas as observaçoes que forem feitas pelo professor 
        e pelo proprio grupo, enviar uma cópia das atividades por e-mail para o grupo e postar imediatamente estas observaçõe
        como tarefas a serem realizadas como tarefas por meio do gerenciador de projetos do git.
        d) Todas as tarefas devem ser realizadas e deve-se atentar para distribuição igualitária de atividades levando-se 
        em consideração o peso destas.
        e) Os tópicos numerados para cada atividade no devem ser removidos do trabalho. Entretanto, os conteúdos de exemplo 
        em cada tópico devem ser substituídos pelo conteúdo do trabalho em desenvolvimento.
        f) sprints de entrega serão quinzenais ou mensais definidos em aula juntamente com o professor
    
    OBS Importantes: 
        a) Os projetos/sistemas propostos serão validados pelo professor e pela turma
        b) Se possível é interessante que os novos sistemas estejam correlacionados com alguma área 
        previamente estudada pelo aluno
        c) Caso dependa de alguma instituição/parceiro externo, a base de dados e informações pertinentes 
        a esta devem ser obtidas no prazo de até 15 dias apos aprovação da proposta do trabalho 
        (caso contrário, nova proposta deverá ser apresentada a turma implicando logicamente em um prazo 
        mais curto para realização das atividades e conclusão do trabalho)
    
DICA: 
    O kickstart normalmente lança inovaçôes em termos de Sofwares e Apps, portanto pode ser interessante 
    olhar os lançamentos recentes para incrementar as possibilidades e aguçar a criatividade, o que pode 
    auxiliar o grupo com novas ideias na solução proposta. Acesse os links abaixo do para explorar sobre apps e softwares no Kickstarter.
    <br>
    https://www.kickstarter.com/discover/categories/technology/software
    <br>
    https://www.kickstarter.com/discover/categories/technology/apps
# Sumário

### 1	COMPONENTES<br>
Gary Moura Silva e José Guilherme Silva de Lima<br>

### 2	INTRODUÇÃO E MOTIVAÇAO<br>
Este documento contém a especificação do projeto do banco de dados Vagas Dev-ES. 
A motivação para o desenvolvimento desse projeto veio através do desejo de possuir um projeto "real", com um cliente "real", saindo um pouco do ambiente acadêmico em que nos encontramos. Através da plataforma "Slack" entramos em contato com a comunidade de desenvolvedores do espiríto santo (Dev-Es), e pedimos que nos fornecessem alguma demanda. A escolhida foi a de Vagas, descrita no minimundo abaixo.

<br>
      
### 3	MINI-MUNDO<br>
A comunidade de desenvolvedores do Espírito Santo, assim como outras comunidades pelo Brasil, utiliza um repositório no GitHub para divulgação de vagas de emprego e prestação de serviços de desenvolvimento de software. Devido à baixa adesão de empregadores, principalmente no Espírito Santo, é necessário um sistema que sirva de interface entre o(s) repositório(s) e os empregadores, permitindo a criação e controle de vagas e a interação com os desenvolvedores, bem como uma ferramenta de busca avançada, que usará a base de informações oferecida pelo GitHub para encontrar desenvolvedores que sejam compatíveis com a vaga criada.
Os contratantes irão se cadastrar no sistema, fornecendo alguns de seus dados (email, nome fantasia e endereço), e terão acesso a um perfil pessoal, onde poderão gerenciar vagas ou buscar desenvolvedores nas suas listas de espera e de favoritos. Para criar uma nova vaga, bastará fornecer algumas informações para a sua descrição, sendo elas Título, Benefícios, Descrição, Requisitos, Diferenciais, Local e Como se Candidatar, e escolher em que repositórios desejam que essa vaga apareça. Após criar uma vaga, o contratante terá acesso a todas as respostas de desenvolvedores interessados e a um pequeno relatório sobre cada um deles. Poderão também acessar os seus perfis no GitHub, adicioná-los à lista de favoritos ou a lista de espera (para essa respectiva vaga) e contratá-los.
Os desenvolvedores não precisarão fazer um cadastro no sistema, só será necessário ter uma conta no GitHub. Através do GitHub, ou da home page do Vagas, poderão abrir repositórios que estão cadastrados no sistema e procurar vagas que os interessem. Para se candidatar a uma das vagas, basta responder a sua Issue, de acordo com o que é pedido na descrição da mesma.
 <br>

### 4	RASCUNHOS BÁSICOS DA INTERFACE (MOCKUPS)<br>
neste ponto a codificação não e necessária, somente as ideias de telas devem ser criadas, o princípio aqui é pensar na criação da interface para identificar possíveis informações a serem armazenadas ou descartadas <br>

Sugestão: https://balsamiq.com/products/mockups/<br>

![Alt text](https://github.com/discipbd2/topicos-trabalho/blob/master/balsamiq.png?raw=true "Title")


### 5	MODELO CONCEITUAL<br>
#### 5.1 NOTACAO ENTIDADE RELACIONAMENTO
![Alt text](https://github.com/joseslima/Topicos-Trabalho-BD2/blob/master/Imagens/VagasConceitual.png "Modelo Conceitual")

#### 5.2 NOTACAO UML
![Alt text](https://github.com/joseslima/Topicos-Trabalho-BD2/blob/master/Imagens/ClassesProjeto.png "Modelo UML")

#### 5.3 DECISÕES DE PROJETO
    [atributo]: [descrição da decisão]
    
    Campo Endereço:  Apesar de tanto Contratante quanto Desenvolvedor terem o campo "Endereço", eles não são obtidos por herança da tabela Pessoa pois são dados obtidos de formas diferentes e de estruturas diferentes. Os dados do Contratante serão obtidos através do sistema de cadastro, utilizando de CEP, Numero e Complemento. Já os dados do Desenvolvedor virão através da API do GitHub, onde o endereço não é obrigatório e se trata de uma String sem padrão, escrita pelo próprio usuário.
    
    Tabela de Pessoa: Decidimos criar uma tabela de Pessoa, que receberá apenas Nomes, tanto de Desenvolvedores quanto Contratantes.

#### 5.4 DESCRIÇÃO DOS DADOS 
    [objeto]: [descrição do objeto]
    
    Pessoa: Tabela que armazena nomes de contratante e de desenvolvedores
        Nome: Campo que armazena o nome da pessoa cadastrada.
        
    Contato: Tabela que armazena o contato de uma determinada pessoa o seu tipo
        Contato: Campo que armazena a String de contato.
        
    TipoContato: Tipos de Contato disponiveis.
        Nome: Campo que armazena o nome do tipo de contato (Email, Telefone).
        
    Contratante: Tabela que armazena contratantes cadastrados ao sistema.
        CNPJ: Campo que armazena o CNPJ da empresa contratante.
        Descricao: Campo que armazena uma breve descrição sobre o contratante.
        
    Endereço: Tabela que armazena o endereço do contratante.
        Cep: Campo que armazena o CEP do endereço.
        Número: Campo que armazena o número do endereço.
        Complemento: Campo que armazena o Complemento do endereço.
    
    Desenvolvedor: Tabela que armazena Desenvolvedores.
        Biografia: Campo que armazena uma pequena biografia sobre o desenvolvedor.
        Local: Campo que armazena o endereço do  Desenvolvedor.
        GitHub: Nome GitHub do desenvolvedor.
        
    Vaga: Tabela que armazena Vagas.
        Titulo: Titulo da vaga.
        Descrica: Breve descrição sobre a vaga.
        ComoCandidatar: Descrição breve do processo de candidatura para essa vaga.
        Alocado: Campo Booleano para definir se a vaga é alocada ou Home Ofice.
        Salário: Valor de salário.
        
    Issue: Tabela que armazena Issues criadas em repositórios.
        Numero: Numero dessa Issue na API GitHub.
    
    Repositório: Tabela que armazena repositórios.
        Nome: Nome do repositório na API do GitHub.
    
   

### 6	MODELO LÓGICO<br>
![Alt text](https://github.com/joseslima/Topicos-Trabalho-BD2/blob/master/Imagens/VagasL%C3%B3gico.png "Modelo Lógico")
### 7	MODELO FÍSICO<br>

https://github.com/joseslima/Topicos-Trabalho-BD2/blob/master/ModeloFisico.sql

### 8	INSERT APLICADO NAS TABELAS DO BANCO DE DADOS<br>
#### 8.1 DETALHAMENTO DAS INFORMAÇÕES
       Os dados inseridos na tabela foram gerados através do Sistema Datanamic Data Generator.
       Link: https://www.postgresql.org/about/news/1448/
        
#### 8.2 INCLUSÃO DO SCRIPT PARA CRIAÇÃO DE TABELAS E INSERÇÃO DOS DADOS (ARQUIVO ÚNICO COM):
   

### 9	TABELAS E PRINCIPAIS CONSULTAS<br>

Pessoa:

![Alt text](https://github.com/joseslima/Topicos-Trabalho-BD2/blob/master/Imagens/Selects/Pessoa.png  "Select Pessoa")

Contratante:

![Alt text](https://github.com/joseslima/Topicos-Trabalho-BD2/blob/master/Imagens/Selects/Contratante.png "Select Contratante")

Vaga:

![Alt text](https://github.com/joseslima/Topicos-Trabalho-BD2/blob/master/Imagens/Selects/Vaga.png "Select Vaga")


#### 9.1	GERACAO DE DADOS (MÍNIMO DE 10 REGISTROS PARA CADA TABELA NO BANCO DE DADOS)<br>

## Data de Entrega: (18/05/2018)

<br>
OBS: Incluir para os tópicos 9.2 e 9.3 as instruções SQL + imagens (print da tela) mostrando os resultados.<br>

#### 9.2	SELECT DAS TABELAS COM PRIMEIROS 10 REGISTROS INSERIDOS <br> 
    Data de Entrega: (Data a ser definida)
<br>

#### 9.3	SELECT DAS VISÕES COM PRIMEIROS 10 REGISTROS DA VIEW <br>
        a) Descrição da view sobre que grupos de usuários (operacional/estratégico) <br>
        e necessidade ela contempla.
        b) Descrição das permissões de acesso e usuários correlacionados (após definição <br>
        destas características)
    Data de Entrega: (Data a ser definida)
        c) as funcionalidades informadas no minimundo ou nos mockups(protótipos), que representarem 
        views do sistema (relatórios, informações disponíveis para os usuários, etc) devem estar 
        presentes aqui. 
<br>

#### 9.4	LISTA DE CODIGOS DAS FUNÇÕES, ASSERÇOES E TRIGGERS<br>
        Detalhamento sobre funcionalidade de cada código.
        a) Objetivo
        b) Código do objeto (função/trigger/asserção)
        c) exemplo de dados para aplicação
        d) resultados em forma de tabela/imagem
<br>

#### 9.5	Administração do banco de dados<br>
        Descrição detalhada sobre como serão executadas no banco de dados as <br>
        seguintes atividades.
        a) Segurança e autorização de acesso: especificação básica de configurações de acesso remoto
        b) Estimativas de aquisição de recursos para armazenamento e processamento da informação
        c) Planejamento de rotinas de manutenção e monitoramento do banco
        d) Plano com frequencia de análises visando otimização de performance
<br>

#### 9.6	GERACAO DE DADOS (MÍNIMO DE 1,5 MILHÃO DE REGISTROS PARA PRINCIPAL RELAÇAO)<br>
        a) principal tabela do sistema deve ter no mínimo 1,5 milhão de registros
        b) tabelas diretamente relacionadas a tabela principal 100 mil registros
        c) tabelas auxiliares de relacao multivalorada mínimo de 10 registros
        d) registrar o tempo de inserção em cada uma das tabelas do banco de dados
        e) especificar a quantidade de registros inseridos em cada tabela
        Para melhor compreensão verifiquem o exemplo na base de testes:<br>
        https://github.com/discipbd2/base-de-testes-locadora
        
## Data de Entrega: (12/06/2018)

#### 9.7	Backup do Banco de Dados<br>
        Detalhamento do backup.
        a) Tempo
        b) Tamanho
        c) Teste de restauração (backup)
        d) Tempo para restauração
        e) Teste de restauração (script sql)
        f) Tempo para restauração (script sql)
<br>

Data de Entrega: (Data a ser definida)
<br>

#### 9.8	APLICAÇAO DE ÍNDICES E TESTES DE PERFORMANCE<br>
    a) Lista de índices, tipos de índices com explicação de porque foram implementados nas consultas 
    b) Performance esperada VS Resultados obtidos
    c) Tabela de resultados comparando velocidades antes e depois da aplicação dos índices (constando velocidade esperada com planejamento, sem indice e com índice Vs velocidade de execucao real com índice e sem índice).
    d) Escolher as consultas mais complexas para serem analisadas (consultas com menos de 2 joins não serão aceitas)
    e) As imagens do Explain devem ser inclusas no trabalho, bem como explicações sobre os resultados obtidos.
    f) Inclusão de tabela mostrando as 10 execuções, excluindo-se o maior e menor tempos para cada consulta e 
    obtendo-se a media dos outros valores como resultado médio final.
<br>
## Data de Entrega: (29/06/2018)
<br>   

#### 9.9	ANÁLISE DOS DADOS COM ORANGE<br>    
        a) captura das informaçõs
        b) integração com banco de dados em desenvolvimento
        c) aplicação de algoritmos e interpretação dos resultados
        c) atualização da documentação do trabalho incluindo a mineração de dados
<br>
    Data de Entrega: (Data a ser definida)
<br>

### 10	ATUALIZAÇÃO DA DOCUMENTAÇÃO/ SLIDES E ENTREGA FINAL<br>
<br>
    Data de Entrega: (Data a ser definida)
<br>

### 11	DIFICULDADES ENCONTRADAS PELO GRUPO<br>  

       
### 12  FORMATACAO NO GIT: https://help.github.com/articles/basic-writing-and-formatting-syntax/
<comentario no git>
    
##### About Formatting
    https://help.github.com/articles/about-writing-and-formatting-on-github/
    
##### Basic Formatting in Git
    
    https://help.github.com/articles/basic-writing-and-formatting-syntax/#referencing-issues-and-pull-requests
    
    
##### Working with advanced formatting
    https://help.github.com/articles/working-with-advanced-formatting/
#### Mastering Markdown
    https://guides.github.com/features/mastering-markdown/

### OBSERVAÇÕES IMPORTANTES

#### Todos os arquivos que fazem parte do projeto (Imagens, pdfs, arquivos fonte, etc..), devem estar presentes no GIT. Os arquivos do projeto vigente não devem ser armazenados em quaisquer outras plataformas.
1. Caso existam arquivos com conteúdos sigilosos, comunicar o professor que definirá em conjunto com o grupo a melhor forma de armazenamento do arquivo.

#### Todos os grupos deverão fazer Fork deste repositório e dar permissões administrativas ao usuário deste GIT, para acompanhamento do trabalho.

#### Os usuários criados no GIT devem possuir o nome de identificação do aluno (não serão aceitos nomes como Eu123, meuprojeto, pro456, etc). Em caso de dúvida comunicar o professor.


Link para BrModelo:<br>
http://sis4.com/brModelo/brModelo/download.html
<br>


Link para curso de GIT<br>
![https://www.youtube.com/curso_git](https://www.youtube.com/playlist?list=PLo7sFyCeiGUdIyEmHdfbuD2eR4XPDqnN2?raw=true "Title")



