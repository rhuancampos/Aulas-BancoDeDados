-- 1. Inserindo na tabela departamento
INSERT INTO departamento 
(nome, sigla) VALUES
('Ciências Exatas',   'CE'),   -- ESSE SERÁ O ID 1
('Ciências Humanas',  'CH'),   -- ESSE SERÁ O ID 2
('Ciências da Saúde', 'CS');   -- ESSE SERÁ O ID 3

-- 2. Inserindo informações na tabela professor
INSERT INTO professor 
(id_departamento, nome, cpf, titulacao, email) VALUES 
(1, 'Alan Turing',      '111.111.111-11', 'Doutor',       'alan.turing@faculdade.edu'), 
(1, 'Ada Lovelace',     '222.222.222-22', 'Mestre',       'ada.lovelace@faculdade.edu'), 
(2, 'Paulo Freire',     '333.333.333-33', 'Doutor',       'paulo.freire@faculdade.edu'), 
(3, 'Nise da Silveira', '444.444.444-44', 'ESpecialista', 'nise.silveira@faculdade.edu'); 

-- 3. Cursos
INSERT INTO curso 
(id_departamento, nome, duracao_semestres) VALUES 
(1, 'Ciência da Computação', 8), 
(1, 'Engenharia de Software', 8), 
(2, 'Pedagogia', 8), 
(3, 'Enfermagem', 10);

-- 4. Inserindo Alunos
INSERT INTO aluno (id_curso, nome, cpf, data_nascimento, email) VALUES
(1, 'João Silva', '555.555.555-55', '2000-05-15', 'joao.silva@email.com'),
(1, 'Maria Oliveira', '666.666.666-66', '1999-10-20', 'maria.o@email.com'),
(2, 'Pedro Santos', '777.777.777-77', '2001-02-28', 'pedro.s@email.com'),
(3, 'Ana Costa', '888.888.888-88', '1998-12-05', 'ana.costa@email.com'),
(4, 'Lucas Pereira', '999.999.999-99', '2002-07-11', 'lucas.p@email.com');

-- 5. Inserindo Disciplinas
INSERT INTO disciplina (id_curso, nome, carga_horaria) VALUES
(1, 'Algoritmos e Estrutura de Dados', 90),
(1, 'Banco de Dados', 60),
(2, 'Arquitetura de Software', 60),
(3, 'Didática Geral', 60),
(4, 'Anatomia Humana', 90);

-- 6. Inserindo Turmas (A oferta da disciplina)
INSERT INTO turma (id_disciplina, id_professor, ano, semestre) VALUES
(1, 2, 2023, 1), -- Algoritmos com Ada Lovelace
(2, 1, 2023, 2), -- Banco de Dados com Alan Turing
(3, 1, 2024, 1), -- Arq. Software com Alan Turing (um prof. dando aula pra outro curso do mesmo depto)
(4, 3, 2024, 1), -- Didática com Paulo Freire
(5, 4, 2024, 1); -- Anatomia com Nise da Silveira

-- 7. Inserindo Matrículas
INSERT INTO matricula_turma (id_aluno, id_turma, nota_final, situacao) VALUES
(1, 1, 8.5, 'Aprovado'),    -- João passou em Algoritmos
(2, 1, 4.0, 'Reprovado'),   -- Maria reprovou em Algoritmos
(1, 2, 9.0, 'Aprovado'),    -- João passou em Banco de Dados
(3, 3, NULL, 'Matriculado'),-- Pedro está cursando Arq. de Software
(4, 4, 7.5, 'Aprovado'),    -- Ana passou em Didática
(5, 5, NULL, 'Matriculado');-- Lucas está cursando Anatomia