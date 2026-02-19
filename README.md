# Streaming Service Graph Database – Neo4j Project

## Overview

This project demonstrates the design and implementation of a graph database for a movie and series streaming service using Neo4j.

The main goal is to model entities and relationships to support connected data analysis and simulate how streaming platforms organize and explore relationships between users and content.

Graph databases are particularly effective for this type of application because they prioritize relationships.

---

## Objectives

* Model a streaming service using graph data modeling
* Create nodes and relationships using Cypher query language
* Implement constraints to ensure data integrity
* Simulate user viewing behavior with ratings
* Perform basic graph queries

---

## Technologies Used

* Neo4j AuraDB (Cloud)
* Cypher Query Language
* Graph Data Modeling
* Excalidraw (Graph Schema Diagram)

---

## Graph Data Model

### Nodes

The graph includes the following node types:

* User
* Movie
* Series
* Actor
* Director
* Genre

### Relationships

The graph includes the following relationships:

* WATCHED (includes rating property)
* ACTED_IN
* DIRECTED
* IN_GENRE

---

## Graph Schema

See the file:

graph_model.png

---

## Database Constraints

Constraints were created to ensure unique identifiers.

Example:

```
CREATE CONSTRAINT user_id IF NOT EXISTS
FOR (u:User)
REQUIRE u.userId IS UNIQUE;
```

---

## Sample Queries

### Query 1 – Content watched by users

This query shows which content each user watched and the rating given.

```
MATCH (u:User)-[w:WATCHED]->(c)
RETURN u.name AS user,
c.title AS content,
w.rating AS rating
ORDER BY user
```

---

### Query 2 – Actors and their content

This query shows which actors participated in movies or series.

```
MATCH (a:Actor)-[:ACTED_IN]->(c)
RETURN a.name AS actor,
c.title AS content
ORDER BY actor
```

---

## Project Files

graph_model.png → Graph schema diagram

streaming_graph.cql → Database creation script

visualization.png → image of nodes and relationships

README.md → Project documentation

---

## Skills Demonstrated

Graph Data Modeling

Cypher Query Language

Neo4j Graph Database

Cloud Database Usage

Data Relationship Analysis

---

## Conclusion

This project demonstrates how graph databases can be used to model and explore relationships in a streaming service scenario.

Using Neo4j and Cypher, it is possible to represent connected data in a natural and efficient way.

This type of structure is especially useful for platforms that rely on relationships between users and content.

---

## Author

Karin Araujo

Data Analytics Student

2026
