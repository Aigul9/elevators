--можно даже не загружать, иначе продублируются
--LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/aigul9/elevators/master/data/nodes.csv" AS csvLine
--CREATE (f:Floor {floor: csvLine.floor})

--выбрать все
MATCH (n)
RETURN n

--загрузить связи из csv
--актуальная версия
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/aigul9/elevators/master/data/edges_bidirectional.csv" AS csvLine
MERGE (start:Floor {id: toInteger(csvLine.start_floor)})
MERGE (end:Floor {id: toInteger(csvLine.end_floor)})
MERGE (start)-[:REL {hallway: csvLine.hallway, diff: abs(start.id - end.id)}]-(end)

--тестовые версии
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/aigul9/elevators/master/data/edges_up.csv" AS csvLine
MERGE (start:Floor {id: toInteger(csvLine.start_floor)})
MERGE (end:Floor {id: toInteger(csvLine.end_floor)})
MERGE (start)-[:UP {hallway: csvLine.hallway}]-(end);

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/aigul9/elevators/master/data/edges_down.csv" AS csvLine
MERGE (start:Floor {id: toInteger(csvLine.start_floor)})
MERGE (end:Floor {id: toInteger(csvLine.end_floor)})
MERGE (start)-[:DOWN {hallway: csvLine.hallway}]-(end)

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/aigul9/elevators/master/data/test.csv" AS csvLine
MERGE (start:Floor {id: toInteger(csvLine.start_floor)})
MERGE (end:Floor {id: toInteger(csvLine.end_floor)})
MERGE (start)-[:REL {hallway: csvLine.hallway, direction: csvLine.direction}]-(end)


--удалить связи
MATCH (n)-[r:REL]->()
DELETE r

--удалить все
MATCH (n)
DETACH DELETE n

--кратчайшие пути
MATCH p = SHORTEST 2 (from: Floor)-[*]-(to: Floor)
WHERE from.id = 1 AND to.id = 39
RETURN p, length(p) AS result

--с глубиной
MATCH (from: Floor), (to: Floor),
p = shortestPath((from)-[*..150]-(to)) 
WHERE from.id = 1 AND to.id = 39
RETURN p

--с минимальным количеством пересадок, сложностью пересадок и разницей в количестве этажей
MATCH p = SHORTEST 3 (from: Floor)-[r*]-(to: Floor)
WHERE from.id = 36 AND to.id = 24
WITH
    p,
    length(p) AS result,
    reduce(total = 0, r IN relationships(p) | total + r.diff) AS total_floors_diff,
    reduce(total = [], r IN relationships(p) | total + r.hallway) AS hallways
RETURN
    p,
    result,
    hallways,
    reduce(
        changes = 0,
        i IN range(1, size(hallways) - 1) |
        changes + CASE
            WHEN hallways[i] <> hallways[i-1] THEN 1
            ELSE 0
        END
    ) AS num_changes,
    reduce(
        changes = 0,
        i IN range(1, size(hallways) - 1) |
        changes + CASE
            WHEN hallways[i] = 'C' and hallways[i-1] <> 'C' THEN 1
            WHEN hallways[i] <> 'C' and hallways[i-1] = 'C' THEN 1
            WHEN hallways[i] <> hallways[i-1] THEN 0.5
            ELSE 0
        END
    ) AS changes_difficulty,
    total_floors_diff
ORDER BY num_changes, changes_difficulty, total_floors_diff

--выбрать вершину со всеми связями
MATCH (n WHERE n.id = 27)-[r]-(m)
RETURN n, r, m
