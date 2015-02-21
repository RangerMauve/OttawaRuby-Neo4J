title: Graph Databases And Ruby
output: presentation.html
controls: true
theme: sudodoki/reveal-cleaver-theme
author:
  name: Georgiy S.
  twitter: LoneMauve

--

# Graph Databases And Ruby
## Using Neo4J to make applications based around graphs

--

### What is a Graph?

* A series of vertecies conneted by edges

* Each vertex represents an entity in the graph

* Each edge is a relationship between two entities

* Can be directed or undirected

* Edges and Vertecies can have properties

![A directed graph](images/directed_graph.png)

--

### What can they model?

* Anything that has relationships between things

* A social network

* Item catalogues

* Movie listings with actors/directors/genres

--

### Why use them?

* Easier to model data and relationships

* Easier to do complex traversals between

* Traversal is more efficient because vertecies are linked directly

--

### Quick view

Make some stuff

```
CREATE (a:Person {name:'A'} )
CREATE (b:Person {name:'B'} )
CREATE (c:Person {name:'C'} )
CREATE (d:Person {name:'D'} )
CREATE (a) -[:Friend]-> (b)
CREATE (a) -[:Friend]-> (c)
CREATE (a) -[:Friend]-> (d)
CREATE (b) -[:Friend]-> (d)
CREATE (c) -[:Friend]-> (d)
```

Search some stuff

```
MATCH (me:Person)-->(friend:Person)-->(friend_of_friend:Person)
WHERE me.name = 'A'
RETURN count(DISTINCT friend_of_friend), count(friend_of_friend)
```

--

### With code!

``` ruby
query = "CREATE (n { nodes })\nRETURN n"

nodes = {
  :nodes => [{
    :name => "Foo"
  }, {
    :name => "Bar"
  }, {
    :name => "Baz"
  }]
}

@neo.execute_query(query, nodes)
```
