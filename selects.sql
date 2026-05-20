-- 1. SELECT SIMPLES COM TODAS AS COLUNAS
SELECT * 
FROM aluno;

-- 2. SELECT SIMPLES COM COLUNAS ESPECIFICAS
SELECT nome, data_nascimento, email 
FROM aluno;

-- 3. SELECT SIMPLES COM COLUNAS ESPECIFICAS E COM FILTRO
SELECT nome, data_nascimento, email 
FROM aluno 
WHERE data_nascimento >= '2000-01-01';

-- 4. SELECT SIMPLES COM COLUNAS ESPECIFICAS, COM FILTRO E COM ORDENAÇÃO
SELECT nome, data_nascimento, email
FROM aluno 
WHERE data_nascimento >= '2000-01-01' 
ORDER BY data_nascimento ;

-- 5. SELECT MÉDIO JUNTANDO TABELAS DIFERENTES
SELECT a.nome AS aluno, t.ano, t.semestre, mt.nota_final, mt.situacao
FROM matricula_turma mt
JOIN aluno a ON a.id = mt.id_aluno 
JOIN turma t ON t.id = mt.id_turma
JOIN disciplina d ON d.id = t.id_disciplina
WHERE d.nome = 'Algoritmos e Estrutura de Dados'

