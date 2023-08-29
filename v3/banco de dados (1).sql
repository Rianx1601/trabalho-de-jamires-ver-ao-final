


CREATE TABLE Aluno (
    ID_Aluno INT PRIMARY KEY,
    Nome VARCHAR(255),
    Data_Nascimento DATE,
    Endereco VARCHAR(255),
    Telefone VARCHAR(20),
    ID_Turma INT,
    ID_Responsavel INT,
    CONSTRAINT fk_turma FOREIGN KEY (ID_Turma) REFERENCES Turma(ID_Turma),
    CONSTRAINT fk_responsavel FOREIGN KEY (ID_Responsavel) REFERENCES Responsavel(ID_Responsavel)
);

CREATE TABLE Professor (
    ID_Professor INT PRIMARY KEY,
    Nome VARCHAR(255),
    Data_Nascimento DATE,
    Materia VARCHAR(100),
    Salario DECIMAL(10, 2)
);

CREATE TABLE Aluno_Disciplina (
    ID_Aluno INT,
    ID_Disciplina INT,
    PRIMARY KEY (ID_Aluno, ID_Disciplina),
    FOREIGN KEY (ID_Aluno) REFERENCES Aluno(ID_Aluno),
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplina(ID_Disciplina)
);

CREATE TABLE Turma (
    ID_Turma INT PRIMARY KEY,
    Nome_Turma VARCHAR(100),
    Ano_Letivo INT,
    ID_Professor_Responavel INT,
    ID_Sala INT,
    FOREIGN KEY (ID_Professor_Responavel) REFERENCES Professor(ID_Professor),
    FOREIGN KEY (ID_Sala) REFERENCES Sala(ID_Sala)
);

CREATE TABLE Nota (
    ID_Nota INT PRIMARY KEY,
    ID_Aluno INT,
    ID_Disciplina INT,
    Valor_Nota DECIMAL(5, 2),
    FOREIGN KEY (ID_Aluno) REFERENCES Aluno(ID_Aluno),
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplina(ID_Disciplina)
);

CREATE TABLE Funcionario (
    ID_Funcionario INT PRIMARY KEY,
    Nome VARCHAR(255),
    Cargo VARCHAR(100),
    Salario DECIMAL(10, 2)
);

CREATE TABLE Sala (
    ID_Sala INT PRIMARY KEY,
    Numero_Sala VARCHAR(10),
    Capacidade_Alunos INT,
    Bloco_Predio VARCHAR(50),
    ID_Funcionario INT,
    FOREIGN KEY (ID_Funcionario) REFERENCES Funcionario(ID_Funcionario)
);

CREATE TABLE Responsavel (
    ID_Responsavel INT PRIMARY KEY,
    Nome VARCHAR(255),
    Parentesco VARCHAR(100),
    Endereco VARCHAR(255),
    Telefone VARCHAR(20)
);

CREATE TABLE Disciplina (
    ID_Disciplina INT PRIMARY KEY,
    Nome_Disciplina VARCHAR(100),
    Carga_Horaria INT,
    ID_Turma INT,
    FOREIGN KEY (ID_Turma) REFERENCES Turma(ID_Turma)
);

INSERT INTO Responsavel (ID_Responsavel, Nome, Parentesco, Endereco, Telefone)
VALUES
    (201, 'Maria Oliveira', 'Mãe', 'Rua X, 789', '(555) 987-6543'),
    (202, 'José Santos', 'Pai', 'Av. Y, 456', '(123) 456-7890'),
    (203, 'Ana Almeida', 'Tia', 'Praça Z, 123', '(777) 888-9999');

INSERT INTO Funcionario (ID_Funcionario, Nome, Cargo, Salario)
VALUES
    (401, 'Rafaela Souza', 'Zelador', 3000.00),
    (402, 'Fernando Rodrigues', 'Porteiro', 2800.00);


INSERT INTO Professor (ID_Professor, Nome, Data_Nascimento, Materia, Salario)
VALUES
    (101, 'Ana Oliveira', '1980-05-10', 'Matemática', 5000.00),
    (102, 'Carlos Santos', '1975-12-15', 'História', 5500.00);

INSERT INTO Sala (ID_Sala, Numero_Sala, Capacidade_Alunos, Bloco_Predio, ID_Funcionario)
VALUES
    (301, 'S01', 30, 'Bloco A', 401),
    (302, 'S02', 25, 'Bloco B', 402);

INSERT INTO Turma (ID_Turma, Nome_Turma, Ano_Letivo, ID_Professor_Responavel, ID_Sala)
VALUES
    (201, '9A', 2023, 101, 301),
    (202, '10B', 2023, 102, 302);

INSERT INTO Aluno (ID_Aluno, Nome, Data_Nascimento, Endereco, Telefone, ID_Turma, ID_Responsavel)
VALUES
    (1, 'João Silva', '2005-03-15', 'Rua A, 123', '(123) 456-7890', 201, 201),
    (2, 'Maria Santos', '2006-07-20', 'Av. B, 456', '(987) 654-3210', 202, 202),
    (3, 'Pedro Almeida', '2005-11-02', 'Praça C, 789', '(555) 123-4567', 201, 203);

INSERT INTO Disciplina (ID_Disciplina, Nome_Disciplina, Carga_Horaria, ID_Turma)
VALUES
    (1, 'Matemática', 60, 201),
    (2, 'História', 45, 202);

INSERT INTO Nota (ID_Nota, ID_Aluno, ID_Disciplina, Valor_Nota)
VALUES
    (1, 1, 1, 8.5),
    (2, 1, 2, 7.2),
    (3, 2, 1, 9.0),
    (4, 2, 2, 8.8),
    (5, 3, 1, 7.8),
    (6, 3, 2, 6.5);