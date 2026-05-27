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


-- 6. Consulta Complexa, qual a média de notas dos alunos por departamento,
-- considerando apenas os departamentos onde a média geral é maior que 7.0

SELECT dp.nome departamento, ROUND(AVG(mt.nota_final), 2) media_notas
FROM matricula_turma mt
JOIN turma t ON t.id = mt.id_turma
JOIN disciplina d ON d.id = t.id_disciplina
JOIN curso c ON c.id = d.id_curso
JOIN departamento dp ON dp.id = c.id_departamento
WHERE mt.nota_final IS NOT NULL
GROUP BY dp.nome
HAVING AVG(mt.nota_final) > 7.0


-- 7. União entre tabelas sem repetições
SELECT id_departamento FROM curso
UNION
SELECT id_departamento FROM professor

-- 8. União entre tabelas com repetições
SELECT id_departamento FROM curso
UNION ALL
SELECT id_departamento FROM professor

-- 9. Subconsulta
SELECT nome, carga_horaria
FROM disciplina
WHERE carga_horaria > (
  SELECT AVG(carga_horaria) FROM disciplina
)

-- 10. Duas formas de fazer a mesma consulta

SELECT DISTINCT(a.nome), a.email
FROM aluno a
JOIN matricula_turma mt ON mt.id_aluno = a.id
JOIN turma t ON t.id = mt.id_turma
WHERE t.ano = 2023

SELECT nome, email
FROM aluno
WHERE id IN (
  SELECT id_aluno
  FROM matricula_turma mt
  JOIN turma t ON t.id = mt.id_turma
  WHERE t.ano = 2023
)