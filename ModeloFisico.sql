/* Lógico_1: */

CREATE TABLE Vaga (
    Id INT PRIMARY KEY,
    Titulo Varchar (45),
    Descricao varchar(1000),
    Alocado Boolean,
    ComoCandidatar Varchar(1000),
    Salario Float,
    FK_Contratante_Id INT,
    FK_TipoSalario_Id INT,
    FK_FormaContrato_Id INT,
    FK_NivelProfissional_Id INT,
    FK_EstadoVaga_Id INT
);

CREATE TABLE Contratante (
    Id INT PRIMARY KEY,
    Cnpj Varchar(14),
    Descricao 100,
    FK_Pessoa_Id INT,
    FK_Endereco_Id INT
);

CREATE TABLE Desenvolvedor (
    Local Varchar (45),
    GitHub Varchar (45),
    Id INT PRIMARY KEY,
    FK_Pessoa_Id INT
);

CREATE TABLE Repositorio (
    Id INT PRIMARY KEY,
    Nome Varchar (45)
);

CREATE TABLE Contratado (
    Id INT PRIMARY KEY,
    FK_Vaga_Id INT,
    FK_Desenvolvedor_Id INT,
    FK_Contratante_Id INT
);

CREATE TABLE TipoContato (
    Id INT PRIMARY KEY,
    Tipo Varchar(30)
);

CREATE TABLE Favorito (
    Id INT PRIMARY KEY,
    FK_Desenvolvedor_Id INT,
    FK_Vaga_Id INT
);

CREATE TABLE Pessoa (
    Id INT PRIMARY KEY,
    Nome Varchar (45)
);

CREATE TABLE Contato (
    Id INT PRIMARY KEY,
    Contato Varchar (45),
    FK_Pessoa_Id INT,
    FK_TipoContato_Id INT
);

CREATE TABLE Issue (
    Id INT PRIMARY KEY,
    Numero INT,
    FK_Vaga_Id INT,
    FK_Repositorio_Id INT
);

CREATE TABLE Endereco (
    Id INT PRIMARY KEY,
    Cep Varchar(8),
    Complemento Varchar(30),
    Numero INT
);

CREATE TABLE Resposta (
    Id INT PRIMARY KEY,
    Conteudo Varchar(150),
    FK_Desenvolvedor_Id INT,
    FK_Vaga_Id INT
);

CREATE TABLE Requisito (
    Id INT PRIMARY KEY,
    Descricao Varchar (45),
    FK_Vaga_Id INT,
    FK_TipoRequisito_Id INT
);

CREATE TABLE Beneficio (
    Id INT PRIMARY KEY,
    Valor Float,
    Descricao Varchar (45),
    FK_Vaga_Id INT,
    FK_TipoBeneficio_Id INT
);

CREATE TABLE TipoSalario (
    Id INT PRIMARY KEY,
    Tipo varchar(1000)
);

CREATE TABLE TipoRequisito (
    Id INT PRIMARY KEY,
    Tipo Varchar (45)
);

CREATE TABLE TipoBeneficio (
    Id INT PRIMARY KEY,
    Tipo Varchar (45)
);

CREATE TABLE FormaContrato (
    Id INT PRIMARY KEY,
    Tipo Varchar (45)
);

CREATE TABLE NivelProfissional (
    Id INT PRIMARY KEY,
    Nivel Varchar (45)
);

CREATE TABLE EstadoVaga (
    Id INT PRIMARY KEY,
    Estado Boolean
);
 
ALTER TABLE Vaga ADD CONSTRAINT FK_Vaga_1
    FOREIGN KEY (FK_Contratante_Id)
    REFERENCES Contratante (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Vaga ADD CONSTRAINT FK_Vaga_2
    FOREIGN KEY (FK_TipoSalario_Id)
    REFERENCES TipoSalario (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Vaga ADD CONSTRAINT FK_Vaga_3
    FOREIGN KEY (FK_FormaContrato_Id)
    REFERENCES FormaContrato (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Vaga ADD CONSTRAINT FK_Vaga_4
    FOREIGN KEY (FK_NivelProfissional_Id)
    REFERENCES NivelProfissional (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Vaga ADD CONSTRAINT FK_Vaga_5
    FOREIGN KEY (FK_EstadoVaga_Id)
    REFERENCES EstadoVaga (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Contratante ADD CONSTRAINT FK_Contratante_1
    FOREIGN KEY (FK_Pessoa_Id)
    REFERENCES Pessoa (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Contratante ADD CONSTRAINT FK_Contratante_2
    FOREIGN KEY (FK_Endereco_Id)
    REFERENCES Endereco (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Desenvolvedor ADD CONSTRAINT FK_Desenvolvedor_1
    FOREIGN KEY (FK_Pessoa_Id)
    REFERENCES Pessoa (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Contratado ADD CONSTRAINT FK_Contratado_1
    FOREIGN KEY (FK_Vaga_Id)
    REFERENCES Vaga (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Contratado ADD CONSTRAINT FK_Contratado_2
    FOREIGN KEY (FK_Desenvolvedor_Id)
    REFERENCES Desenvolvedor (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Contratado ADD CONSTRAINT FK_Contratado_3
    FOREIGN KEY (FK_Contratante_Id)
    REFERENCES Contratante (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Favorito ADD CONSTRAINT FK_Favorito_1
    FOREIGN KEY (FK_Desenvolvedor_Id)
    REFERENCES Desenvolvedor (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Favorito ADD CONSTRAINT FK_Favorito_2
    FOREIGN KEY (FK_Vaga_Id)
    REFERENCES Vaga (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Contato ADD CONSTRAINT FK_Contato_1
    FOREIGN KEY (FK_Pessoa_Id)
    REFERENCES Pessoa (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Contato ADD CONSTRAINT FK_Contato_2
    FOREIGN KEY (FK_TipoContato_Id)
    REFERENCES TipoContato (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Issue ADD CONSTRAINT FK_Issue_1
    FOREIGN KEY (FK_Vaga_Id)
    REFERENCES Vaga (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Issue ADD CONSTRAINT FK_Issue_2
    FOREIGN KEY (FK_Repositorio_Id)
    REFERENCES Repositorio (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Resposta ADD CONSTRAINT FK_Resposta_1
    FOREIGN KEY (FK_Desenvolvedor_Id)
    REFERENCES Desenvolvedor (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Resposta ADD CONSTRAINT FK_Resposta_2
    FOREIGN KEY (FK_Vaga_Id)
    REFERENCES Vaga (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Requisito ADD CONSTRAINT FK_Requisito_1
    FOREIGN KEY (FK_Vaga_Id)
    REFERENCES Vaga (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Requisito ADD CONSTRAINT FK_Requisito_2
    FOREIGN KEY (FK_TipoRequisito_Id)
    REFERENCES TipoRequisito (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Beneficio ADD CONSTRAINT FK_Beneficio_1
    FOREIGN KEY (FK_Vaga_Id)
    REFERENCES Vaga (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;
 
ALTER TABLE Beneficio ADD CONSTRAINT FK_Beneficio_2
    FOREIGN KEY (FK_TipoBeneficio_Id)
    REFERENCES TipoBeneficio (Id)
    ON DELETE RESTRICT ON UPDATE RESTRICT;