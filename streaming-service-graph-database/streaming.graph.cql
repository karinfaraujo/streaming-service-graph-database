// Create Constraints
CREATE CONSTRAINT user_id IF NOT EXISTS
FOR (u:User)
REQUIRE u.userId IS UNIQUE;

CREATE CONSTRAINT movie_id IF NOT EXISTS
FOR (m:Movie)
REQUIRE m.movieId IS UNIQUE;

CREATE CONSTRAINT series_id IF NOT EXISTS
FOR (s:Series)
REQUIRE s.seriesId IS UNIQUE;

CREATE CONSTRAINT actor_id IF NOT EXISTS
FOR (a:Actor)
REQUIRE a.actorId IS UNIQUE;

CREATE CONSTRAINT director_id IF NOT EXISTS
FOR (d:Director)
REQUIRE d.directorId IS UNIQUE;

CREATE CONSTRAINT genre_name IF NOT EXISTS
FOR (g:Genre)
REQUIRE g.name IS UNIQUE;

// Create Genres
CREATE (:Genre {name:'Action'}),
       (:Genre {name:'Drama'}),
       (:Genre {name:'Comedy'}),
       (:Genre {name:'Sci-Fi'}),
       (:Genre {name:'Thriller'});

// Create Users
CREATE
(:User {userId:1, name:'Alice'}),
(:User {userId:2, name:'Bob'}),
(:User {userId:3, name:'Carlos'}),
(:User {userId:4, name:'Diana'}),
(:User {userId:5, name:'Eva'}),
(:User {userId:6, name:'Frank'}),
(:User {userId:7, name:'Grace'}),
(:User {userId:8, name:'Henry'}),
(:User {userId:9, name:'Isabel'}),
(:User {userId:10, name:'Jack'});

// Create Movies
CREATE
(:Movie {movieId:1, title:'The Matrix', year:1999}),
(:Movie {movieId:2, title:'Inception', year:2010}),
(:Movie {movieId:3, title:'Interstellar', year:2014}),
(:Movie {movieId:4, title:'John Wick', year:2014}),
(:Movie {movieId:5, title:'The Dark Knight', year:2008});

// Create Series 
CREATE
(:Series {seriesId:1, title:'Breaking Bad'}),
(:Series {seriesId:2, title:'Stranger Things'}),
(:Series {seriesId:3, title:'Game of Thrones'}),
(:Series {seriesId:4, title:'The Office'}),
(:Series {seriesId:5, title:'The Boys'});

// Create Actors 
CREATE
(:Actor {actorId:1, name:'Keanu Reeves'}),
(:Actor {actorId:2, name:'Leonardo DiCaprio'}),
(:Actor {actorId:3, name:'Matthew McConaughey'}),
(:Actor {actorId:4, name:'Bryan Cranston'}),
(:Actor {actorId:5, name:'Millie Bobby Brown'});

// Create Directors
CREATE
(:Director {directorId:1, name:'Wachowski Sisters'}),
(:Director {directorId:2, name:'Christopher Nolan'}),
(:Director {directorId:3, name:'Chad Stahelski'});

// Relationships ACTED_IN
MATCH (a:Actor {name:'Keanu Reeves'}),(m:Movie {title:'The Matrix'})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:'Leonardo DiCaprio'}),(m:Movie {title:'Inception'})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:'Matthew McConaughey'}),(m:Movie {title:'Interstellar'})
CREATE (a)-[:ACTED_IN]->(m);

MATCH (a:Actor {name:'Bryan Cranston'}),(s:Series {title:'Breaking Bad'})
CREATE (a)-[:ACTED_IN]->(s);

MATCH (a:Actor {name:'Millie Bobby Brown'}),(s:Series {title:'Stranger Things'})
CREATE (a)-[:ACTED_IN]->(s);

// Directed
MATCH (d:Director {name:'Wachowski Sisters'}),(m:Movie {title:'The Matrix'})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:'Christopher Nolan'}),(m:Movie {title:'Inception'})
CREATE (d)-[:DIRECTED]->(m);

MATCH (d:Director {name:'Christopher Nolan'}),(m:Movie {title:'Interstellar'})
CREATE (d)-[:DIRECTED]->(m);

// Watched with rating
MATCH (u:User {userId:1}),(m:Movie {title:'The Matrix'})
CREATE (u)-[:WATCHED {rating:5}]->(m);

MATCH (u:User {userId:2}),(m:Movie {title:'Inception'})
CREATE (u)-[:WATCHED {rating:4}]->(m);

MATCH (u:User {userId:3}),(s:Series {title:'Breaking Bad'})
CREATE (u)-[:WATCHED {rating:5}]->(s);

// Conected Movie with Genres
MATCH (u:User {userId:4}),(s:Series {title:'Stranger Things'})
CREATE (u)-[:WATCHED {rating:4}]->(s);

MATCH (m:Movie {title:'The Matrix'}),(g:Genre {name:'Sci-Fi'})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (m:Movie {title:'Inception'}),(g:Genre {name:'Sci-Fi'})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (m:Movie {title:'Interstellar'}),(g:Genre {name:'Sci-Fi'})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (m:Movie {title:'John Wick'}),(g:Genre {name:'Action'})
CREATE (m)-[:IN_GENRE]->(g);

MATCH (m:Movie {title:'The Dark Knight'}),(g:Genre {name:'Action'})
CREATE (m)-[:IN_GENRE]->(g);

// Conected with Users
MATCH (u:User {userId:5}),(m:Movie {title:'John Wick'})
CREATE (u)-[:WATCHED {rating:5}]->(m);

MATCH (u:User {userId:6}),(m:Movie {title:'Interstellar'})
CREATE (u)-[:WATCHED {rating:4}]->(m);

MATCH (u:User {userId:7}),(m:Movie {title:'The Dark Knight'})
CREATE (u)-[:WATCHED {rating:5}]->(m);

MATCH (u:User {userId:8}),(s:Series {title:'The Boys'})
CREATE (u)-[:WATCHED {rating:4}]->(s);

MATCH (u:User {userId:9}),(s:Series {title:'Game of Thrones'})
CREATE (u)-[:WATCHED {rating:5}]->(s);

MATCH (u:User {userId:10}),(s:Series {title:'The Office'})
CREATE (u)-[:WATCHED {rating:4}]->(s);
