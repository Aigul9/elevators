# elevators

## Background

One of our office buildings has an unusual elevator infrastructure: a double-car elevator system in a single shaft. There are 3 shafts in total located in a shape of a triangle, e.g.:

![image](https://github.com/user-attachments/assets/fd49ba16-1f2a-48e8-89f4-fbc340b04739)

## Notation

Each node represents a floor number.

Each edge represents a relation between two floors with a 'hallway' attribute.

So, in the notation:

- L (Left) = Б1 (B1)
- R (Right) = Б2 (B2)
- C (Centre) = Б3 (B3)

Neo4j does not support bidirectional relations, so each directed edge is considered to be bidirectional.

There are 2 caveats:
1. Two relations between the same floors refer to the 2 existent ways of reaching the locations.
2. 'LR' as a hallway attribute means that going up is possible using the left shaft and going down - right shaft.

## Usage

Playground is available here: https://browser.neo4j.io/
Credentials are stored in access.properties

## Example

Full graph:

![image](https://github.com/user-attachments/assets/dfacbac5-9454-44cb-ac8a-e149b632df48)

Shortest paths:

![image](https://github.com/user-attachments/assets/ceb5e527-241f-4617-b9a5-97b3add9c225)
