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
MERGE (start)-[:REL {hall: csvLine.hall}]-(end)

--тестовые версии
LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/aigul9/elevators/master/data/edges_up.csv" AS csvLine
MERGE (start:Floor {id: toInteger(csvLine.start_floor)})
MERGE (end:Floor {id: toInteger(csvLine.end_floor)})
MERGE (start)-[:UP {hall: csvLine.hall}]-(end);

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/aigul9/elevators/master/data/edges_down.csv" AS csvLine
MERGE (start:Floor {id: toInteger(csvLine.start_floor)})
MERGE (end:Floor {id: toInteger(csvLine.end_floor)})
MERGE (start)-[:DOWN {hall: csvLine.hall}]-(end)

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/aigul9/elevators/master/data/test.csv" AS csvLine
MERGE (start:Floor {id: toInteger(csvLine.start_floor)})
MERGE (end:Floor {id: toInteger(csvLine.end_floor)})
MERGE (start)-[:REL {hall: csvLine.hall, way: csvLine.way}]-(end)


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

MATCH (from: Floor), (to: Floor),
p = shortestPath((from)-[*..150]-(to)) 
WHERE from.id = 1 AND to.id = 39
RETURN p

MATCH (from: Floor), (to: Floor),
p = shortestPath((from)-[*..150]-(to)) 
WHERE from.id = 26 AND to.id = 25
RETURN p

--выбрать вершину со всеми связями
MATCH (n WHERE n.id = 27)-[r]-(m)
RETURN n, r, m
