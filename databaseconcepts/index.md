# Database Concepts

## The world of data
Data is generated every second, all over the world.
+ The Web: homepages, Facebook Twitter,
+ Mobiles and Sensors,
+ Scientific and medical data: satellites,
+ Enterprise information systems.

## Data management
+ Management of data, of different types, is behind almost everything you do on the Web.
	+ Google: Web pages, images, maps
	+ Amazon: books and other products
	+ Facebook: homepage, images, friendship, posts
	+ RMIT: library, student administration, course management, timetable.
	+ Digital libraries: Lynda.com

## The database system
A database system is for efficiently and effectively managing and using data.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615347266/DatabaseConcepts/DatabaseSystem_eoklds.png)

## Database system dimensions Overview
+ Users, roles and security
+ Databases
+ A database programming language
+ Transactions and concurrency control

### Users
There are multiple users for a database and they have different roles and privileges:
+ **Database Administrator (DBA)**: full control of the database --- create and define database schemas, grant privileges to other users.
+ **Database developers**: manage/control his/her own database.
+ **End users/data operators**: only retrieve or update information in some parts of the database.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615357252/DatabaseConcepts/user_dhh3xq.png)

### Databases
A database is a collection of data (facts) that describe something of interest managed by a Database Management System (DBMS). More strictly speaking, a database is more than a collection --- it is a collection of data management of a DBMS.

+ Schema + Data files.

#### Databases: data models
A data model is a description of data so that the data can be more easily understood.

+ A data model is a language for describing data or information. The description generally consists of three parts:

	+ Structure of the data, or data structure.
	+ Operations on the data.
	+ Constraints on the data

+ Popular data models:
	+ The relational model for structured data, including object-relational extensions.
	+ The semi-structured data model, including XML and related standards.

** NOTE: ** I will talk about the relational model details after.
#### Databases: Schema - The defaintion of data in the database
+ A description of data in the database. The description can use data models at different levels.
	+ The Entity Relationship (ER) model.
	+ The Relational model.
+ Constraints for data integrity.

** NOTE: ** Data constraints are restrictions on facts so that only sensible facts are kept in the database. Constraints should be derived from the real-world.

##### The Schema -- example
Real world:
+ Information: Student records should have student ID, name, contact phone number, and address.
+ Constraints:
	+ Each student should be identified by Student No – Each student record must have the student No information.
	+ No two students can have the same student ID --- Each student should have a unique student ID.
+ ER model:
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615405209/DatabaseConcepts/SchemaERmodel_c5moju.png)
+ Relation schema:
Student(\underline{studentNo}, name, phone, address)

**NOTE:** underline mean primary key.

#### Databases: data
+ Data files on hard disks of computers.
	+ The files are managed by a DBMS (on top of some file system).
+ How to access the data?
	+ Via the programming language (SQL) provided by the DBMS.
	+ Data (and the meta-data) can be read, retrieved and updated.

** NOTE: ** : data is information or facts about things (entities) in the real-world.

#### Databases: Metadata
+ Metadata (sometimes called data dictionary) is data describing the database, which may include:
	+ Schema definition
	+ Index – to speed up query processing
	+ Data types
	+ Constraints on data
	+ User information and privileges

#### Database programming Language --- SQL
SQL -- Structured Query Language --- is not only a query language:
+ Data Definition Language (DDL)
	+ Define database schema
+ Data Query Language (DQL)
	+ Query the database to extract information
+ Data Manipulation Language (DML)
	+ Update the database – insertion/deletion/update.

** NOTE: ** A query is a form of inquiry of the data in the database. A query is usually a program written in the query language (SQL) provided by a DBMS.

#### SQL characteristic
+ Database programming language SQL is declarative --- you tell the system what problem to solve.
	+ Short programs.
	+ System optimization.
+ Most other programming languages are procedural --- you tell the system how to solve the problem.
	+ Long programs.
	+ User optimization.

For Example:
Given a list of records for students (student ID, name, address...) enrolled in ISYS1055/1057, calculate how many students are there in total?

+ In SQL:
	+ select count(studentID) from Student;
+ In C: read files, data structure, loop structure, output.
	+ [](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615406896/DatabaseConcepts/SQLexample_wmhsbg.png)

### Transactions and Concurrency Control
Many users operate the same database concurrently:
+ Many students are booking tute classes on a timetable database.
+ Many people book flight tickets online.

#### Transactions
+ Operations on databases (DDL/DML/DQL) are organized into transactions – an atomic unit that must finish in whole or nothing happens at all. No partial effect on the database.
	+ A transaction comprises several operations of READ and WRITE on databases.
+ The execution of transactions should be durable --- the effect of any completed transaction is permanent, even if system failure happens.
	+ By way of logging.

##### The ACID properties of transactions
+ **Atomicity** – the all-or-nothing execution of transactions
+ **Consistency** – a transaction brings a database from one consistent state to another. In other words, meeting consistency constraints like balance can not be negative after a transaction.
+ **Isolation** -- each transaction must appear to execute as if no other transactions are executing at the same time.
+ **Durability** – effect of a transaction is must never be lost, once transaction complete.

##### Transaction processing
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615407865/DatabaseConcepts/TransactionProcessing_hsig3t.png)

#### Concurrency control
+ Concurrency control allows multiple users
	+ transactions from each user are executed in “isolation”.

##### Transactions: Commit and Rollback
+ The “Commit” and “Rollback” command in SQL.
+ Example:

```SQL
select * from movies; // show content of the Movie table.
delete from movies where mvID =2; // updates to the Movie table.
select * from movies; // show content of the Movie table.
rollback; // rollback the changes.
```

+ Starting the SQL Developer application starts a new session. When the application is killed (not when you close a connection), if there are updates to the database, you are asked whether to “commit the changes” or “rollback changes”.

## The DBMS
A database management system (DBMS) is a software for managing data. It provides mechanism for defining/describing data, querying the data and maintain the integrity and correctness of data (transactions and concurrency). Oracle is a DBMS.

A DBMS typically has three parts:
- Storage management: how secondary storage (hard disks) is used effectively to store and access data.
- Query processing: how to execute (SQL) queries
- Transaction management: how to support transactions with the ACID properties.

## The relation model
The relational model is based on a single structure to represent data, a two-dimensional table called a relation.

+ Example -- the “movie” relation.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615411348/DatabaseConcepts/movieRelation_rpd7ie.png)

### Basics of the relational model
+ **Attributes** are the names for the columns of a relation. Each attribute has a domain --- the set of all possible values allowed for the attribute, in another word it is type.
+ **Tuples** are the rows of data in a relation comprising components that are atomic --- a component cannot be broken into smaller components. Each component of a tuple is a value from the corresponding attribute domain.
+ **Schema** of a relation is the name of a relation and its attributes. The schema for a relation is written as relation name followed by a list of is attributes in a pair of brackets.
+ A **relation instance** is a set of tuples, or the data, for a given relation.
	– It is common to update the content of a relation and have a new relation instance.
	– It is less common to update the schema.

+ Typically, a database system only keeps the ”current” relation instance – the data “now” kept in relations.
+ The term “relation” can refer to a relation schema or a relation instance, and usually can be determined from the context.

There is a example:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615411348/DatabaseConcepts/movieRelation_rpd7ie.png)

+ The **schema of the Movie relation** is Movie(mvID, Title, Rating, Rel_date, Length, Studio).
+ The **domain** of mvID is Integer (data type).
+ The current instance of Movie relation has 5 tuples. The first tuple of Movie relation has 6 components:
	- 1, ‘Angels & Demons’, M, 14-05-2009, 138, ‘Sony Pictures’.
**Note** that the date ’14-05-2009’ is an atomic value.

#### Data integrity constraints – Key and Primary Key
+ An attribute or list of attributes are a **Key** of a relation if no two tuples/rows of the relation may agree in all the attribute(s) on the list. If there are several candidate keys, one is specified as the Primary Key.
	– No two movies can have the same value for mvID. mvID is the artificial key of Movie.
	– A movie (represented by mvID) can be linked to multiple genres, and a genre can link to multiple movies. So the mvID and genre together – {mvID, Genre} -- are the only key for Classification.
+ Primary key attributes are underlined in relation schemas.
+ Note that the key constraint is a natural property of real-world data and part of a relation schema. Key definition can only be derived from the real-world. Although sample data in a relation can help disapprove a possible key definition, they cannot be used to prove a key definition.

+ Example: For the Movie relation, even though the current content of the Movie relation may suggest that each movie has a distinct title, title is not a key for the relation. “No two movies can have the same title” is not a property that is always true for all movies to keep in a database.

#### Data Integrity Constraints -- Foreign Keys
+ The **foreign key** constraint declares that an attribute or attributes of a relation references the
primary key or key of a second relation.
	+ Values for the foreign key in the first relation must appear in the referenced attributes of the second relation.
	+ A child-parent relationship -- the first and second relations can be seen as “child” and “parent” relations.
+ Foreign keys in a relation schema are usually denoted by an asterisk (\*).
+  A foreign-key constraint on a relation prevents introducing nonsensical data into the relation.
	+ No insertion or update to the child relation introduces values not found in the parent
relation.
	+ No deletion or update to the child relation causes some tuples of the parent relation to “dangle.”

#### Relation schemas with data integrity constraints
+ Primary key attributes are underlined.
	+ The primary key of a relation may comprise more than one attribute.
+ Foreign key attributes are annotated with the asterisk.
+ A primary key attribute can also be a foreign key.

There is a Examples:
Movie(mvID, Title, Rating, Rel_date, Length, Studio) - parent
Classification(mvID\*, genre) - child

#### Relational databases
+ A relational database schema is the set of all relation schemas in the database.
+ A relational database instance comprises a set of relation instances. Or informally, a relational database comprises a set of relations, or tables.

There is a example:
##### A (small) Movies database
Data to keep in the database:
+ Movie: mvID, title, rating, release date, length (in minutes), producer studio. mvID is an artificial
attribute (not natural information).
+ Classification: a movie may be associated with several genres (comedy, action, violence, adventure, drama).
+ Cast: A movie has many actors, and an actor can perform in many movies.
+ Direct: A movie can have several directors (usually less than three) and a director can direct many movies.

##### The Movies database schema
Movie(mvID, Title, Rating, Rel_date,
Length, Studio )
Classification(mvID\*, Genre)
Cast(mvID\*, Actor)
Direct(mvID\*, Director)

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615414823/DatabaseConcepts/exampleDatabase_zlxtw9.png)

##### Define relation schemas in SQL
+ SQL is a data definition language for defining database schemas and constraints.
	+ The CREATE TABLE statement defines and creates an empty table.

```SQL
CREATE TABLE Movie(
    mvID     INTEGER,
    title    VARCHAR(40),
    rating   CHAR(2),
    rel_date DATE,
    length   INTEGER,
    studio   VARCHAR(20),
);
```
This will create a empty table.

###### Elements of Table Definition
+ Most basic element: an attribute and its type.
+ The most common types are:
	+ INT or INTEGER (synonyms).
	+ REAL or FLOAT (synonyms).
	+ CHAR(n) = fixed-length string of n characters.
	+ VARCHAR(n ) = variable-length string of up to n characters.

##### SQL Values
+ Strings require single quotes.
	+ E.g., ‘Tom Hanks’, and ‘The Proposal’.
	+ Two single quotes = real quote, e.g., ’Mary’’s little lamb’.
+ Any value can be NULL.
	+ NULL can have several semantics: Value unknown, inapplicable, or withheld.
+ DATE and TIME are types in SQL and so there are DATE and TIME values.
	+ The default form of a date value is ’DD-MON-YYYY’ (e.g. ‘25-JUL-2010’).
	+ The form of a time value is: ’hh:mm:ss’, with an optional decimal point and fractions of a second following.
	+ TIME ’15:30:02.5’ = two and a half seconds after 3:30PM.

There is a example:
+ The SQL code below creates an empty table.

```SQL
create table movie (
	mvid integer,
	title varchar(40),
	rating char(2),
	rel_date date,
	length integer,
	studio varchar(20));
```

+ The code below insert data values into the table.

```SQL
insert into movie values(1, ‘Mary’’s little lamb’, ‘G’, ’14-MAY-2001’, 80, ‘Farmer’);
```

##### Defining Primary Keys in SQL
+ A primary key definition PRIMARY KEY (...) is another element in the list of elements of a CREATE TABLE statement.
	+ Movie(\underline{mvID}, title, rating, length, studio)

```SQL
CREATE TABLE Movie(
    mvID     INTEGER,
    title    VARCHAR(40),
    rating   CHAR(2),
    rel_date DATE,
    length   INTEGER,
    studio   VARCHAR(20),
    PRIMARY KEY (mvID)
);
```
+ Several attributes together make up a key.
	+ Classification (mvID, Genre)

```SQL
CREATE TABLE Classification(
    mvID     INTEGER,
    genre    CHAR(10),
    PRIMARY KEY (mvID, genre),
);
```

##### Ensuring Data Integrity: primary key unique constraints
+ The unique constraint: tuples can not have the same value for all PK attributes.
+ With the given Movie relation schema:
	Create table Movie (.. Primary key (mvID));

***Underline indicates primary key!***

Movie(\underline{mvID}, Title, Rating, Rel_date, Length, Studio)
+ mvID is the primary key for the Movie relation.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615431584/DatabaseConcepts/canNotHaveSameValueForPK_p7fvlp.png)

+ The entity integrity constraint: Null is not allowed for PK attributes.
```SQL
insert into movie values (NULL, 'My Life in Ruins', 'PG', '16-JUL-2009', 95, '29th Centrury Fox');
```
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615431719/DatabaseConcepts/NullisNotAllowedForPK_gwfj1w.png)

##### Defining Foreign Keys
+ A foreign key definition
```SQL
FOREIGN KEY (....) REFERENCES relation(attributes)
```

Can be added as an element in the CREATE TABLE statement.

```SQL
CREATE TABLE Classification(
    mvID     INTEGER,
    genre    CHAR(10),
    PRIMARY KEY (mvID, genre),
    FOREIGN KEY (mvID) REFERENCES Movie(mvID)
);

CREATE TABLE Cast(
    mvID     INTEGER,
    actor    VARCHAR(20),
    PRIMARY KEY (mvID, actor),
    FOREIGN KEY (mvID) REFERENCES Movie(mvID)
);

CREATE TABLE Direct(
    mvID     INTEGER,
    director VARCHAR(20),
    PRIMARY KEY (mvID, director),
    FOREIGN KEY (mvID) REFERENCES Movie(mvID)
);
```

##### The Movies DB – Primary and Foreign Keys
+ A movieID that does not appear in the Movie relation cannot be added into the Classification, Cast or Direct relations.
+ A tuple (describing a movie) can only be deleted from the Movie relation if its mvID does not appear in Classification, Cast or Direct. In other words, dangling mvID values in Classifiction, Cast or Direct are not allowed.

##### Ensuring Data Integrity – foreign keys
+ The foreign key referential integrity constraint ensures sensible insertion.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615432787/DatabaseConcepts/ReferentialIntegrityConstraintViolated_kbfufo.png)

+ The foreign key referential integrity constraint ensures sensible deletion. A movie is deleted only when it is not referenced by any other relations.
+ Example: To delete the movie “Happy Potter” from the database.

```SQL
delete from movie where mvid=3;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1615432927/DatabaseConcepts/ReferentialIntegrityConstraintViolated2_iahyjs.png)





