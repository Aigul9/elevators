# elevators

This is a small pet-project for the shortest elevator path analysis and subsequent usage in everyday life.

Further ideas include creating a mobile app which would take the start and end points as an input and return the most convenient ways to reach the target place.

## Background

One of our office buildings has an unusual elevator infrastructure: a double-car elevator system in a single shaft. There are 3 hallways in total with multiple shafts located in a shape of a triangle, e.g.:

![image](https://github.com/user-attachments/assets/fd49ba16-1f2a-48e8-89f4-fbc340b04739)

## Notation

The source data is located in data/

Each node represents a floor number.

Each edge represents a relation between two floors with a 'hallway' attribute.

So, in the notation:

- L (Left) = Б1 (B1)
- R (Right) = Б2 (B2)
- C (Centre) = Б3 (B3)

Neo4j does not support bidirectional relations, so each directed edge is considered to be bidirectional.

There are 2 caveats:
1. Two relations between the same floors refer to the 2 existent ways of reaching the locations.
2. 'LR' as a hallway attribute means that going up is possible using the left hall and going down - right hall.

## Usage

Playground is available here: https://browser.neo4j.io/

Credentials are stored in access.properties

Sample queries are listed in queries.sql

Raise an issue if the database is unavailable

## Example

Full graph:

![image](https://github.com/user-attachments/assets/dfacbac5-9454-44cb-ac8a-e149b632df48)

Shortest paths:

![image](https://github.com/user-attachments/assets/ceb5e527-241f-4617-b9a5-97b3add9c225)
