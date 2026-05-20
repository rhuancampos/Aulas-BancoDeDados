-- Remover tabelas se já existirem (ordem inversa para evitar erro de chave estrangeira)
DROP TABLE IF EXISTS Matricula_Turma;
DROP TABLE IF EXISTS Turma;
DROP TABLE IF EXISTS Disciplina;
DROP TABLE IF EXISTS Aluno;
DROP TABLE IF EXISTS Curso;
DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Departamento;

/* CREATE DATABASE IF NOT EXISTS faculdade;

USE faculdade;
 */
-- ==============================================================================
-- Script de Criação do Banco de Dados - Sistema Acadêmico (Faculdade)
-- ==============================================================================

-- 1. Tabela de Departamento (Ex: Departamento de Ciências Exatas)
CREATE TABLE IF NOT EXISTS departamento (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sigla CHAR(3) UNIQUE NOT NULL
);

-- 2. Tabela de Professor
CREATE TABLE IF NOT EXISTS professor (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_departamento INT,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    titulacao VARCHAR(50), -- Ex: Mestre, Doutor
    email VARCHAR(100) UNIQUE,

    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

-- 3. Tabela Curso
CREATE TABLE IF NOT EXISTS curso (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_departamento INT,
    nome VARCHAR(100) NOT NULL,
    duracao_semestres INT NOT NULL,
    
    FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

-- 4. Aluno
CREATE TABLE IF NOT EXISTS aluno (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_curso INT,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE,
    email VARCHAR(50) UNIQUE,

    FOREIGN KEY (id_curso) REFERENCES curso(id)
);

-- 5. Disciplinas
CREATE TABLE IF NOT EXISTS disciplina (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_curso INT,
    nome VARCHAR(100) NOT NULL,
    carga_horaria INT NOT NULL,

    FOREIGN KEY (id_curso) REFERENCES curso(id)
);

-- 6. Turma
CREATE TABLE IF NOT EXISTS turma (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    id_disciplina INT,
    id_professor INT, 
    ano INT NOT NULL,
    semestre INT NOT NULL,

    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id),
    FOREIGN KEY (id_professor) REFERENCES professor(id)
);

-- 7. Tabela de Matricula
CREATE TABLE IF NOT EXISTS matricula_turma (
    id_aluno INT,
    id_turma INT,
    nota_final DECIMAL(5, 2),
    situacao VARCHAR(20) DEFAULT 'Matriculado',
    
    PRIMARY KEY (id_aluno, id_turma),
    FOREIGN KEY (id_aluno) REFERENCES aluno(id),
    FOREIGN KEY (id_turma) REFERENCES turma(id)
);