LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/aigul9/elevators/master/data/nodes.csv" AS csvLine
CREATE (f:Floor {floor: csvLine.floor})

MATCH (n)
RETURN n

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/aigul9/elevators/master/data/edges_up.csv" AS csvLine
MERGE (start:Player {floor: csvLine.start_floor})
MERGE (end:Player {floor: csvLine.end_floor})
MERGE (start)-[:UP {hall: csvLine.hall}]-(end)

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/aigul9/elevators/master/data/edges_down.csv" AS csvLine
MERGE (start:Player {floor: csvLine.start_floor})
MERGE (end:Player {floor: csvLine.end_floor})
MERGE (start)-[:DOWN {hall: csvLine.hall}]-(end)

MATCH (n)-[r:REL]->()
DELETE r