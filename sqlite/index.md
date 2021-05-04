# Getting started SQLite

## Introduction
In this tutorial, you will learn SQLite step by step through extensive hands-on practices.
This SQLite tutorial is designed for developers who want to use SQLite as the back-end database or to use SQLite to manage structured data in applications including desktop, web, and mobile apps.
SQLite is an open-source, zero-configuration, self-contained, stand-alone, transaction relational database engine designed to be embedded into an application.

## Getting started with SQLite
You should go through this section if this is the first time you have worked with SQLite. Follow these 4-easy steps to get started with SQLite fast.

### First, help you answer the first and important question: what is SQLite? You will have a brief overview of SQLite.
#### What is SQLite
SQLite is a software library that provides a relational database management system. The lite in SQLite means lightweight in terms of setup, database administration, and required resources.

SQLite has the following noticeable features: self-contained, serverless, zero-configuration, transactional.

#### Serverless
Normally, an RDBMS such as MySQL, PostgreSQL, etc., requires a separate server process to operate. The applications that want to access the database server use TCP/IP protocol to send and receive requests. This is called client/server architecture.

The following diagram illustrates the RDBMS client/server architecture:
![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/12/RDBMS-Client-Server-Architecture.jpg)

SQLite does NOT work this way.

SQLite does NOT require a server to run.

SQLite database is integrated with the application that accesses the database. The applications interact with the SQLite database read and write directly from the database files stored on disk.

The following diagram illustrates the SQLite server-less architecture:
![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/12/What-is-SQLite.jpg)

#### Self-Contained
SQLite is self-contained means it requires minimal support from the operating system or external library. This makes SQLite usable in any environment especially in embedded devices like iPhones, Android phones, game consoles, handheld media players, etc.

SQLite is developed using ANSI-C. The source code is available as a big sqlite3.c and its header file sqlite3.h. If you want to develop an application that uses SQLite, you just need to drop these files into your project and compile it with your code.

#### Zero-configuration
Because of the serverless architecture, you don’t need to “install” SQLite before using it. There is no server process that needs to be configured, started, and stopped.

In addition, SQLite does not use any configuration files.

#### Transactional
All transactions in SQLite are fully ACID-compliant. It means all queries and changes are Atomic, Consistent, Isolated, and Durable.

In other words, all changes within a transaction take place completely or not at all even when an unexpected situation like application crash, power failure, or operating system crash occurs.

sqlite> .mode column
sqlite> .header on
sqlite> .read ./commands.txt
AlbumId  Title                                                                  
-------  -----------------------------------------------------------------------
156      ...And Justice For All                                                 
257      20th Century Masters - The Millennium Collection: The Best of Scorpions
296      A Copland Celebration, Vol. I                                          
94       A Matter of Life and Death                                             
95       A Real Dead One                                                        
96       A Real Live One                                                        
285      A Soprano Inspired                                                     
139      A TempestadeTempestade Ou O Livro Dos Dias                             
203      A-Sides                                                                
160      Ace Of Spades                                                          
sqlite> 
#### SQLite distinctive features
SQLite uses dynamic types for tables. It means you can store any value in any column, regardless of the data type.

SQLite allows a single database connection to access multiple database files simultaneously. This brings many nice features like joining tables in different databases or copying data between databases in a single command.

SQLite is capable of creating in-memory databases that are very fast to work with.

### Second, show you step by step how to download and install the SQLite tools on your computer
#### Download SQLite tools
To download SQLite, you open the download page of the SQlite official website.

First, go to the https://www.sqlite.org website.
Second, open the download page https://www.sqlite.org/download.html
SQLite provides various tools for working across platforms e.g., Windows, Linux, and Mac. You need to select an appropriate version to download.

#### Run SQLite tools
Installing SQLite is simple and straightforward.
1. open the Ternal.

```console
[yanboyang713@boyang ~]$ sqlite3
SQLite version 3.35.1 2021-03-15 16:53:57
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite> 
```

2. You can type the .help command from the sqlite> prompt to see all available commands in sqlite3.2. you can type the .help command from the sqlite> prompt to see all available commands in sqlite3.

```console
sqlite> .help
.archive ...             Manage SQL archives
.auth ON|OFF             Show authorizer callbacks
.backup ?DB? FILE        Backup DB (default "main") to FILE
.bail on|off             Stop after hitting an error.  Default OFF
.binary on|off           Turn binary output on or off.  Default OFF
```

3. To quit the sqlite>, you use .quit command as follows:
```console
sqlite> .quit
[yanboyang713@boyang ~]$ 
```

#### Install SQLite GUI tool
The sqlite3 shell is excellent…

However, sometimes, you may want to work with the SQLite databases using an intuitive GUI tool.

There are many GUI tools for managing SQLite databases available ranging from freeware to commercial licenses.

##### SQLiteStudio
The SQLiteStudio tool is a free GUI tool for managing SQLite databases. It is free, portable, intuitive, and cross-platform. SQLite tool also provides some of the most important features to work with SQLite databases such as importing, exporting data in various formats including CSV, XML, and JSON.

### Third, introduce you to an SQLite sample database and walk you through the steps of using the sample database for practicing.

#### Introduction to chinook SQLite sample database
We provide you with the SQLite sample database named chinook. The chinook sample database is a good database for practicing with SQL, especially SQLite.

The following database diagram illustrates the chinook database tables and their relationships.

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/11/sqlite-sample-database-color.jpg)

#### Chinook sample database tables
There are 11 tables in the chinook sample database.

+ **employees** table stores employees data such as employee id, last name, first name, etc. It also has a field named ReportsTo to specify who reports to whom.
+ **customers** table stores customers data.
+ **invoices & invoice_items** tables: these two tables store invoice data. The invoices table stores invoice header data and the invoice_items table stores the invoice line items data.
+ **artists** table stores artists data. It is a simple table that contains only the artist id and name.
+ **albums** table stores data about a list of tracks. Each album belongs to one artist. However, one artist may have multiple albums.
+ **media_types** table stores media types such as MPEG audio and AAC audio files.
+ **genres** table stores music types such as rock, jazz, metal, etc.
+ **tracks** table stores the data of songs. Each track belongs to one album.
+ **playlists & playlist_track** tables: playlists table store data about playlists. Each playlist contains a list of tracks. Each track may belong to multiple playlists. The relationship between the playlists table and tracks table is many-to-many. The playlist_track table is used to reflect this relationship.

#### Download SQLite sample database
You can download the SQLite sample database [here](https://cdn.sqlitetutorial.net/wp-content/uploads/2018/03/chinook.zip).

In case you want to have the database diagram for reference, you can download both black&white and color versions in PDF format.
![Download SQLite sample database diagram](https://cdn.sqlitetutorial.net/wp-content/uploads/2018/03/sqlite-sample-database-diagram.pdf)

![Download SQLite sample database diagram with color](https://cdn.sqlitetutorial.net/wp-content/uploads/2018/03/sqlite-sample-database-diagram-color.pdf)

#### How to connect to SQLite sample database
The sample database file is ZIP format, therefore, you need to extract it to a folder **chinook.db**

Using the following command to connect to the chinook sample database location.

```console
[yanboyang713@boyang chinook]$ pwd
/home/yanboyang713/Documents/study/ISYS1055-DatabaseConcepts/chinook
[yanboyang713@boyang chinook]$ sqlite3 ./chinook.db 
SQLite version 3.35.1 2021-03-15 16:53:57
Enter ".help" for usage hints.
sqlite> 
```

Trying a simple command e.g., .tables to view all the tables available in the sample database.

```console
sqlite> .tables
albums          employees       invoices        playlists     
artists         genres          media_types     tracks        
customers       invoice_items   playlist_track
```

### Finally, guide you on how to use the sqlite3 commands
#### Connect to an SQLite database
To start the sqlite3, you type the sqlite3 as follows:

```console
[yanboyang713@boyang chinook]$ sqlite3
SQLite version 3.35.1 2021-03-15 16:53:57
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite> 
```

By default, an SQLite session uses the in-memory database, therefore, all changes will be gone when the session ends.

To open a database file, you use the .open FILENAME command. The following statement opens the chinook.db database:

```console
sqlite> .open ./chinook.db
```

If you want to open a specific database file when you connect to the SQlite database, you use the following command:

```console
[yanboyang713@boyang chinook]$ sqlite3 ./chinook.db 
SQLite version 3.35.1 2021-03-15 16:53:57
Enter ".help" for usage hints.
sqlite> 
```

If you start a session with a database name that does not exist, the sqlite3 tool will create the database file.

For example, the following command creates a database named **boyang**

```console
[yanboyang713@boyang chinook]$ sqlite3 boyang.db
SQLite version 3.35.1 2021-03-15 16:53:57
Enter ".help" for usage hints.
```

#### Show all available commands and their purposes
To show all available commands and their purpose, you use the .help command as follows:

```bash
.help
```

#### Show databases in the current database connection
To show all databases in the current connection, you use the .databases command. The .databases command displays at least one database with the name: main.

For example, the following command shows all the databases of the current connection:
```bash
sqlite> .database
main: /home/yanboyang713/Documents/study/ISYS1055-DatabaseConcepts/chinook/boyang.db r/w
```

To add an additional database in the current connection, you use the statement ATTACH DATABASE. The following statement adds the chinook database to the current connection.

```bash
sqlite> ATTACH DATABASE "./chinook.db" AS chinook;
```

Now if you run the .database command again, the sqlite3 returns two databases: main and chinook.

```bash
sqlite> .database
main: /home/yanboyang713/Documents/study/ISYS1055-DatabaseConcepts/chinook/boyang.db r/w
chinook: /home/yanboyang713/Documents/study/ISYS1055-DatabaseConcepts/chinook/chinook.db r/w
```

#### Exit sqlite3 tool
To exit the sqlite3 program, you use the .exit command.

```bash
sqlite> .exit
```

#### Show tables in a database
To display all the tables in the current database, you use the .tables command. The following commands open a new database connection to the chinook database and display the tables in the database.

```console
[yanboyang713@boyang chinook]$ sqlite3 ./chinook.db 
SQLite version 3.35.1 2021-03-15 16:53:57
Enter ".help" for usage hints.
sqlite> .table
albums          employees       invoices        playlists     
artists         genres          media_types     tracks        
customers       invoice_items   playlist_track
sqlite> 
```

If you want to find tables based on a specific pattern, you use the .table pattern command. The sqlite3 uses the LIKE operator for pattern matching.

For example, the following statement returns the table that ends with the string es.

```bash
sqlite> .table '%es'
employees    genres       invoices     media_types
sqlite> 
```

#### Show the structure of a table
To display the structure of a table, you use the .schema TABLE command. The TABLE argument could be a pattern. If you omit it, the .schema command will show the structures of all the tables.

The following command shows the structure of the albums table.

```bash
sqlite> .schema albums
CREATE TABLE IF NOT EXISTS "albums"
(
    [AlbumId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Title] NVARCHAR(160)  NOT NULL,
    [ArtistId] INTEGER  NOT NULL,
    FOREIGN KEY ([ArtistId]) REFERENCES "artists" ([ArtistId]) 
		ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX [IFK_AlbumArtistId] ON "albums" ([ArtistId]);
sqlite> 
```

To show the full schema and the content, you use the .fullschema command.
```bash
sqlite>.fullschema
```

#### Show indexes
To show all indexes of the current database, you use the .indexes command as follows:

```bash
sqlite> .indexes
IFK_AlbumArtistId                  IFK_PlaylistTrackTrackId         
IFK_CustomerSupportRepId           IFK_TrackAlbumId                 
IFK_EmployeeReportsTo              IFK_TrackGenreId                 
IFK_InvoiceCustomerId              IFK_TrackMediaTypeId             
IFK_InvoiceLineInvoiceId           sqlite_autoindex_playlist_track_1
IFK_InvoiceLineTrackId           
sqlite> 
```

To show the indexes of a specific table, you use the .indexes TABLE command. For example, to show indexes of the albums table, you use the following command:

```bash
sqlite> .indexes albums
IFK_AlbumArtistId
```

To show indexes of the tables whose names end with es, you use a pattern of the LIKE operator.

```bash
sqlite> .indexes %es
IFK_EmployeeReportsTo  IFK_InvoiceCustomerId
```

#### Save the result of a query into a file
To save the result of a query into a file, you use the .output FILENAME command. Once you issue the .output command, all the results of the subsequent queries will be saved to the file that you specified in the FILENAME argument. If you want to save the result of the next single query only to the file, you issue the .once FILENAME command.

To display the result of the query to the standard output again, you issue the .output command without arguments.

The following commands select the title from the albums table and write the result to the albums.txt file.

#### Save the result of a query into a file
To save the result of a query into a file, you use the .output FILENAME command. Once you issue the .output command, all the results of the subsequent queries will be saved to the file that you specified in the FILENAME argument. If you want to save the result of the next single query only to the file, you issue the .once FILENAME command.

To display the result of the query to the standard output again, you issue the .output command without arguments.

The following commands select the title from the albums table and write the result to the albums.txt file.

```bash
sqlite> .output albums.txt
sqlite> SELECT title FROM albums;
sqlite> .output
sqlite> 
```

#### Execute SQL statements from a file
Suppose we have a file named commands.txt in the current folder with the following content:

```console
[yanboyang713@boyang chinook]$ pwd
/home/yanboyang713/Documents/study/ISYS1055-DatabaseConcepts/chinook
[yanboyang713@boyang chinook]$ cat commands.txt 
SELECT albumid, title
FROM albums
ORDER BY title
LIMIT 10;
```

To execute the SQL statements in the commands.txt file, you use the .read FILENAME command as follows:

```bash
sqlite> .mode column
sqlite> .header on
sqlite> .read ./commands.txt
AlbumId  Title                                                                  
-------  -----------------------------------------------------------------------
156      ...And Justice For All                                                 
257      20th Century Masters - The Millennium Collection: The Best of Scorpions
296      A Copland Celebration, Vol. I                                          
94       A Matter of Life and Death                                             
95       A Real Dead One                                                        
96       A Real Live One                                                        
285      A Soprano Inspired                                                     
139      A TempestadeTempestade Ou O Livro Dos Dias                             
203      A-Sides                                                                
160      Ace Of Spades                                                          
sqlite> 
```

## Basic SQLite tutorial
This section presents basic SQL statements that you can use with SQLite. You will first start querying data from the sample database. If you are already familiar with SQL, you will notice the differences between SQL standard and SQL dialect used in SQLite.

### Section 1. Simple query
Select – query data from a single table using SELECT statement.

The SELECT statement is one of the most commonly used statements in SQL. The SQLite SELECT statement provides all features of the SELECT statement in SQL standard.

#### Simple uses of SELECT statement

You can use the SELECT statement to perform a simple calculation as follows:

```console
sqlite> SELECT  1 + 1;
1 + 1
-----
2    
```

You can use multiple expressions in the SELECT statement as follows:

```console
sqlite> SELECT 
   10 / 5, 
   2 * 4 ;
10 / 5  2 * 4
------  -----
2       8    
sqlite> 
```

#### Querying data from a table using the SELECT statement
We often use the SELECT statement to query data from one or more table. The syntax of the SELECT statement is as follows:

```SQL
SELECT DISTINCT column_list
FROM table_list
  JOIN table ON join_condition
WHERE row_filter
ORDER BY column
LIMIT count OFFSET offset
GROUP BY column
HAVING group_filter;
```

The SELECT statement is the most complex statement in SQLite. To help easier to understand each part, we will break the SELECT statement into multiple section.

In this section, we are going to focus on the simplest form of the SELECT statement that allows you to query data from a single table.

```SQL
SELECT column_list
FROM table;
```

Even though the SELECT clause appears before the FROM clause, SQLite evaluates the FROM clause first and then the SELECT clause, therefore:

+ First, specify the table where you want to get data from in the FROM clause. Notice that you can have more than one table in the FROM clause. We will discuss it in the subsequent tutorial.

+ Second, specify a column or a list of comma-separated columns in the SELECT clause.

You use the semicolon (;) to terminate the statement.

#### SQLite SELECT examples
Let’s take a look at the tracks table in the sample database.

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2018/11/tracks.png)

The tracks table contains columns and rows. It looks like a spreadsheet.

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/11/Tracks-Table-data.jpg)

To get data from the tracks table such as trackid, track name, composer, and unit price, you use the following statement:

```SQL
SELECT
	trackid,
	name,
	composer,
	unitprice
FROM
	tracks;
```

You specify a list column names, which you want to get data, in the SELECT clause and the tracks table in the FROM clause. SQLite returns the following result:

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/11/Tracks-Table-partial-data.jpg)

To get data from all columns, you specify the columns of the tracks table in the SELECT clause as follows:

```SQL
SELECT
	trackid,
	name,
	albumid,
	mediatypeid,
	genreid,
	composer,
	milliseconds,
	bytes,
	unitprice
FROM
	tracks;
```

For a table with many columns, the query would be so long that time-consuming to type. To avoid this, you can use the asterisk (\*), which is the shorthand for all columns of the table as follows:

```SQL
SELECT * FROM tracks;
```

**NOTE:**
You should use the asterisk (\*) for the testing purpose only, not in the real application development.

When you develop an application, you should control what SQLite returns to your application. Suppose, a table has 3 columns, and you use the asterisk (\*) to retrieve the data from all three columns.

What if someone removes a column, your application would not be working properly, because it assumes that there are three columns returned and the logic to process those three columns would be broken.

If someone adds more columns, your application may work but it gets more data than needed, which creates more I/O overhead between the database and application.

So try to avoid using the asterisk (\*) as a good habit when you use the SELECT statement.


### Section 2. Sorting rows
Order By – sort the result set in ascending or descending order.

#### Introduction to SQLite ORDER BY clause
SQLite stores data in the tables in an unspecified order. It means that the rows in the table may or may not be in the order that they were inserted.

If you use the  SELECT statement to query data from a table, the order of rows in the result set is unspecified.

To sort the result set, you add the ORDER BY clause to the  SELECT statement as follows:

```SQL
SELECT
   select_list
FROM
   table
ORDER BY
    column_1 ASC,
    column_2 DESC;
```

The ORDER BY clause comes after the FROM clause. It allows you to sort the result set based on one or more columns in ascending or descending order.

In this syntax, you place the column name by which you want to sort after the ORDER BY clause followed by the ASC or DESC keyword.

+ The ASC keyword means ascending.
+ And the DESC keyword means descending.

**NOTE:**
If you don’t specify the ASC or DESC keyword, SQLite sorts the result set using the ASC option. In other words, it sorts the result set in the ascending order by default.

In case you want to sort the result set by multiple columns, you use a comma (,) to separate two columns. The ORDER BY clause sorts rows using columns or expressions from left to right. In other words, the ORDER BY clause sorts the rows using the first column in the list. Then, it sorts the sorted rows using the second column, and so on.

You can sort the result set using a column that does not appear in the select list of the SELECT clause.

#### SQLite ORDER BY clause example
Let’s take the tracks table in the sample database for the demonstration.

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2018/11/tracks.png)

Suppose, you want to get data from name, milliseconds, and album id columns, you use the following statement:

```SQL
SELECT
	name,
	milliseconds, 
        albumid
FROM
	tracks;
```

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/11/tracks-table-data-without-sorting.jpg)

The SELECT statement that does not use ORDER BY clause returns a result set that is not in any order.

Suppose you want to sort the result set based on AlbumId column in ascending order, you use the following statement:

```SQL
SELECT
	name,
	milliseconds, 
	albumid
FROM
	tracks
ORDER BY
	albumid ASC;
```

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/11/SQLite-ORDER-BY-example.jpg)

The result set now is sorted by the AlbumId column in ascending order as shown in the screenshot.

SQLite uses ASC by default so you can omit it in the above statement as follows:

```SQL
SELECT
	name,
	milliseconds, 
	albumid
FROM
	tracks
ORDER BY
	albumid;
```

Suppose you want to sort the sorted result (by AlbumId) above by the Milliseconds column in descending order. In this case, you need to add the Milliseconds column to the ORDER BY clause as follows:

```SQL
SELECT
	name,
	milliseconds, 
	albumid
FROM
	tracks
ORDER BY
	albumid ASC,
        milliseconds DESC;
```

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/11/SQLite-ORDER-BY-multiple-columns-example.jpg)

SQLite sorts rows by AlbumId column in ascending order first. Then, it sorts the sorted result set by the Milliseconds column in descending order.

If you look at the tracks of the album with AlbumId 1, you find that the order of tracks changes between the two statements.

#### SQLite ORDER BY with the column position
Instead of specifying the names of columns, you can use the column’s position in the ORDER BY clause.

For example, the following statement sorts the tracks by both albumid (3rd column) and milliseconds (2nd column) in ascending order.


```SQL
SELECT
	name,
	milliseconds, 
	albumid
FROM
	tracks
ORDER BY
	 3,2;
```

The number 3 and 2 refers to the AlbumId and Milliseconds in the column list that appears in the SELECT clause.

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/11/SQLite-ORDER-BY-multiple-columns-by-positions.jpg)

#### Sorting NULLs
In the database world, NULL is special. It denotes that the information missing or the data is not applicable.

Suppose you want to store the birthday of an artist in a table. At the time of saving the artist’s record, you don’t have the birthday information.

To represent the unknown birthday information in the database, you may use a special date like 01.01.1900 or an '' empty string. However, both of these values do not clearly show that the birthday is unknown.

NULL was invented to resolve this issue. Instead of using a special value to indicate that the information is missing, NULL is used.

NULL is special because you cannot compare it with another value. Simply put, if the two pieces of information are unknown, you cannot compare them.

NULL is even cannot be compared with itself; NULL is not equal to itself so NULL = NULL always results in false.

When it comes to sorting, SQLite considers NULL to be smaller than any other value.

It means that NULLs will appear at the beginning of the result set if you use ASC or at the end of the result set when you use DESC.

SQLite 3.30.0 added the NULLS FIRST and NULLS LAST options to the ORDER BY clause. The NULLS FIRST option specifies that the NULLs will appear at the beginning of the result set while the NULLS LAST option place NULLs at the end of the result set.

The following example uses the ORDER BY clause to sort tracks by composers:

```SQL
SELECT 
    TrackId, 
    Name, 
    Composer 
FROM 
   tracks
ORDER BY 
   Composer;
```

First, you see that NULLs appear at the beginning of the result set because SQLite treats them as the lowest values. When you scroll down the result, you will see other values:

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2020/03/SQLite-ORDER-BY-NULLS-FIRST.png)

The following example uses the NULLS LAST option to place NULLs after other values:

```SQL
SELECT 
    TrackId, 
    Name, 
    Composer 
FROM 
    tracks
ORDER BY 
    Composer NULLS LAST;
```

If you scroll down the output, you will see that NULLs are placed at the end of the result set:

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2020/03/SQLite-ORDER-BY-NULLS-LAST.png)

### Section 3. Filtering data
#### Select Distinct – query unique rows from a table using the DISTINCT clause.

##### Introduction to SQLite SELECT DISTINCT clause
The DISTINCT clause is an optional clause of the  SELECT statement. The DISTINCT clause allows you to remove the duplicate rows in the result set.

The following statement illustrates the syntax of the DISTINCT clause:

```SQL
SELECT DISTINCT	select_list
FROM table;
```

In this syntax:

+ First, the DISTINCT clause must appear immediately after the SELECT keyword.
+ Second, you place a column or a list of columns after the DISTINCT keyword. If you use one column, SQLite uses values in that column to evaluate the duplicate. In case you use multiple columns, SQLite uses the combination of values in these columns to evaluate the duplicate.

SQLite considers NULL values as duplicates. If you use theDISTINCT clause with a column that has NULL values, SQLite will keep one row of a NULL value.

In database theory, if a column contains NULL values, it means that we do not have the information about that column of particular records or the information is not applicable.

For example, if a customer has a phone number with a NULL value, it means we don’t have information about the phone number of the customer at the time of recording customer information or the customer may not have a phone number at all.

##### SQLite SELECT DISTINCT examples
We will use the customers table in the sample database for demonstration.

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2018/11/customers.png)

Suppose you want to know the cities where the customers locate, you can use the SELECT statement to get data from the city column of the customers table as follows:

```console
sqlite> SELECT city
FROM customers
ORDER BY city;
City               
-------------------
Amsterdam          
Bangalore          
Berlin             
Berlin             
Bordeaux           
Boston             
Brasília           
Brussels           
Budapest           
Buenos Aires       
Chicago            
Copenhagen         
Cupertino          
Delhi              
...
```

It returns 59 rows. There are few duplicate rows such as Berlin London, and Mountain View To remove these duplicate rows, you use the DISTINCT clause as follows:

```SQL
SELECT DISTINCT city
FROM customers
ORDER BY city;
```

It returns 53 rows because the DISTINCT clause has removed 6 duplicate rows.

##### SQLite SELECT DISTINCT on multiple columns
The following statement finds cities and countries of all customers.

```console
sqlite> SELECT
        city,
        country
FROM
        customers
ORDER BY
        country;
City                 Country       
-------------------  --------------
Buenos Aires         Argentina     
Sidney               Australia     
Vienne               Austria       
Brussels             Belgium       
São José dos Campos  Brazil        
São Paulo            Brazil        
São Paulo            Brazil        
Rio de Janeiro       Brazil        
...
```

The result set contains duplicate city and country e.g., Sao Paulo in Brazil as shown in the screenshot above.

To remove duplicate the city and country, you apply the DISTINCT clause to both city and country columns as shown in the following query:

```console
sqlite> SELECT  DISTINCT
        city,
        country
FROM
        customers
ORDER BY
        country;
City                 Country       
-------------------  --------------
Buenos Aires         Argentina     
Sidney               Australia     
Vienne               Austria       
Brussels             Belgium       
São José dos Campos  Brazil        
São Paulo            Brazil        
Rio de Janeiro       Brazil        
Brasília             Brazil        
Montréal             Canada        
...
```

As mentioned earlier, SQLite uses the combination of city and country to evaluate the duplicate.

##### SQLite SELECT DISTINCT with NULL example
This statement returns the names of companies of customers from the customers table.

```console
sqlite> SELECT company
FROM customers;
Company                                         
------------------------------------------------
Embraer - Empresa Brasileira de Aeronáutica S.A.
                                                
                                                
                                                
JetBrains s.r.o.                                
                                                
                                                
                                                
                                                
Woodstock Discos                                
Banco do Brasil S.A.                            
Riotur                                          
                                                
Telus                                           
Rogers Canada                                   
Google Inc.                                     
Microsoft Corporation                           
                                                
Apple Inc.                                      
...
```

It returns 59 rows with many NULL values.

Now, if you apply the DISTINCT clause to the statement, it will keep only one row with a NULL value.

See the following statement:

```console
sqlite> SELECT DISTINCT company
FROM customers;
Company                                         
------------------------------------------------
Embraer - Empresa Brasileira de Aeronáutica S.A.
                                                
JetBrains s.r.o.                                
Woodstock Discos                                
Banco do Brasil S.A.                            
Riotur                                          
Telus                                           
Rogers Canada                                   
Google Inc.                                     
Microsoft Corporation                           
Apple Inc.                                      
sqlite> 
```

The statement returns 11 rows with one NULL value.

Note that if you select a list of columns from a table and want to get a unique combination of some columns, you can use the GROUP BY clause.


#### Where  – filter rows of a result set using various conditions.
##### Introduction to SQLite WHERE clause
The WHERE clause is an optional clause of the SELECT statement. It appears after the FROM clause as the following statement:

```SQL
SELECT
	column_list
FROM
	table
WHERE
	search_condition;
```

In this example, you add a WHERE clause to the SELECT statement to filter rows returned by the query. When evaluating a SELECT statement with a WHERE clause, SQLite uses the following steps:

+ First, check the table in the FROM clause.
+ Second, evaluate the conditions in the WHERE clause to get the rows that met these conditions.
+ Third, make the final result set based on the rows in the previous step with columns in the SELECT clause.

The search condition in the WHERE has the following form:

```bash
left_expression COMPARISON_OPERATOR right_expression
```

For example, you can form a search condition as follows:

```SQL
WHERE column_1 = 100;

WHERE column_2 IN (1,2,3);

WHERE column_3 LIKE 'An%';

WHERE column_4 BETWEEN 10 AND 20;
```

Besides the SELECT statement, you can use the WHERE clause in the UPDATE and DELETE statements.

##### SQLite comparison operators
A comparison operator tests if two expressions are the same. The following table illustrates the comparison operators that you can use to construct expressions:

| Operator  |           Meaning           |
|-----------|-----------------------------|
|   =       |          Equal to           |
| <> or !=  |        Not equal to         |
|    <      |        Less than            |
|    >      |        Greater than         |
|   <=      |     Less than or equal to   |
|   >=      |   Greater than or equal to  |

##### SQLite logical operators
Logical operators allow you to test the truth of some expressions. A logical operator returns 1, 0, or a NULL value.

Notice that SQLite does not provide Boolean data type therefore 1 means TRUE, and 0 means FALSE.

The following table illustrates the SQLite logical operators:

|  Operator   |                                         Meaning                                       |
|-------------|---------------------------------------------------------------------------------------|
|    ALL      |  returns 1 if all expressions are 1.                                                  |
|    AND      |  returns 1 if both expressions are 1, and 0 if one of the expressions is 0.           |
|    ANY      |  returns 1 if any one of a set of comparisons is 1.                                   |
|   BETWEEN   |  returns 1 if a value is within a range.                                              |
|   EXISTS    |  returns 1 if a subquery contains any rows.                                           |
|   IN        |  returns 1 if a value is in a list of values.                                         |
|    LIKE     |  returns 1 if a value matches a pattern                                               |
|    NOT      |  reverses the value of other operators such as NOT EXISTS, NOT IN, NOT BETWEEN, etc.  |
|    OR       |  returns true if either expression is 1                                               |

##### SQLite WHERE clause examples
We will use the tracks table in the sample database to illustrate how to use the WHERE clause.

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2018/11/tracks.png)

The equality operator (=) is the most commonly used operator. For example, the following query uses the WHERE clause the equality operator to find all the tracks in the album id 1:

```console
sqlite> SELECT
   name,
   milliseconds,
   bytes,
   albumid
FROM
   tracks
WHERE
   albumid = 1;
Name                                     Milliseconds  Bytes     AlbumId
---------------------------------------  ------------  --------  -------
For Those About To Rock (We Salute You)  343719        11170334  1      
Put The Finger On You                    205662        6713451   1      
Let's Get It Up                          233926        7636561   1      
Inject The Venom                         210834        6852860   1      
Snowballed                               203102        6599424   1      
Evil Walks                               263497        8611245   1      
C.O.D.                                   199836        6566314   1      
Breaking The Rules                       263288        8596840   1      
Night Of The Long Knives                 205688        6706347   1      
Spellbound                               270863        8817038   1      
sqlite> 
```

SQLite compares the values stored in the AlbumId column with a literal value 1 to test if they are equal. Only the rows that satisfy the condition are returned.

When you compare two values, you must ensure that they are the same data type. You should compare numbers with numbers, string with strings, etc.

In case you compare values in different data types e.g., a string with a number, SQLite has to perform implicit data type conversions, but in general, you should avoid doing this.

You use the logical operator to combine expressions. For example, to get tracks of the album 1 that have the length greater than 200,000 milliseconds, you use the following statement:

```console
sqlite> SELECT            
        name,
        milliseconds,
        bytes,
        albumid
FROM
        tracks
WHERE
        albumid = 1
AND milliseconds > 250000;
Name                                     Milliseconds  Bytes     AlbumId
---------------------------------------  ------------  --------  -------
For Those About To Rock (We Salute You)  343719        11170334  1      
Evil Walks                               263497        8611245   1      
Breaking The Rules                       263288        8596840   1      
Spellbound                               270863        8817038   1      
sqlite> 
```

The statement used two expressions albumid = 1 and milliseconds > 250000. It uses the AND logical operator to combine these expressions.

##### SQLite WHERE clause with LIKE operator example
Sometimes, you may not remember exactly the data that you want to search. In this case, you perform an inexact search using the LIKE operator.

For example, to find which tracks composed by Smith, you use the LIKE operator as follows:

```SQL
SELECT
	name,
	albumid,
	composer
FROM
	tracks
WHERE
	composer LIKE '%Smith%'
ORDER BY
	albumid;
```

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/11/SQLite-WHERE-with-LIKE-operator.jpg)

You get tracks composed by R.A. Smith-Diesel, Adrian Smith, etc.

##### SQLite WHERE clause with the IN operator example
The IN operator allows you to check whether a value is in a list of a comma-separated list of values. For example, to find tracks that have media type id is 2 or 3, you use the IN operator as shown in the following statement:

```SQL
SELECT
	name,
	albumid,
	mediatypeid
FROM
	tracks
WHERE
	mediatypeid IN (2, 3);
```

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/11/SQLite-WHERE-with-IN-operator.jpg)

#### Limit – constrain the number of rows returned by a query and how to get only the necessary data from a table.
##### Introduction to SQLite LIMIT clause
The LIMIT clause is an optional part of the  SELECT statement. You use the LIMIT clause to constrain the number of rows returned by the query.

For example, a SELECT statement may return one million rows. However, if you just need the first 10 rows in the result set, you can add the LIMIT clause to the SELECT statement to retrieve 10 rows.

The following illustrates the syntax of the LIMIT clause.

```SQL
SELECT
	column_list
FROM
	table
LIMIT row_count;
```

The row_count is a positive integer that specifies the number of rows returned.

For example, to get the first 10 rows in the tracks table, you use the following statement:

```console
sqlite> SELECT
        trackId,
        name
FROM
        tracks
LIMIT 10;
TrackId  Name                                   
-------  ---------------------------------------
1        For Those About To Rock (We Salute You)
2        Balls to the Wall                      
3        Fast As a Shark                        
4        Restless and Wild                      
5        Princess of the Dawn                   
6        Put The Finger On You                  
7        Let's Get It Up                        
8        Inject The Venom                       
9        Snowballed                             
10       Evil Walks                             
sqlite> 
```

If you want to get the first 10 rows starting from the 10th row of the result set, you use OFFSET keyword as the following:

```SQL
SELECT
	column_list
FROM
	table
LIMIT row_count OFFSET offset;
```

Or you can use the following shorthand syntax of the LIMIT OFFSET clause:

```SQL
SELECT
	column_list
FROM
	table
LIMIT offset, row_count;
```

For example, to get 10 rows starting from the 11th row in the tracks table, you use the following statement:

```console
sqlite> SELECT     
        trackId,
        name
FROM
        tracks
LIMIT 10 OFFSET 10;
TrackId  Name                    
-------  ------------------------
11       C.O.D.                  
12       Breaking The Rules      
13       Night Of The Long Knives
14       Spellbound              
15       Go Down                 
16       Dog Eat Dog             
17       Let There Be Rock       
18       Bad Boy Boogie          
19       Problem Child           
20       Overdose                
sqlite> 
```

You often find the uses of OFFSET in web applications for paginating result sets.

##### SQLite LIMIT and ORDER BY clause
You should always use the LIMIT clause with the  ORDER BY clause. Because you want to get a number of rows in a specified order, not in an unspecified order.

The ORDER BY clause appears before the LIMIT clause in the SELECT statement. SQLite sorts the result set before getting the number of rows specified in the LIMIT clause.

```SQL
SELECT
   column_list
FROM
   table
ORDER BY column_1
LIMIT row_count;
```

For example, to get the top 10 biggest tracks by size, you use the following query:

```console
sqlite> SELECT
        trackid,
        name,
        bytes
FROM
        tracks
ORDER BY
        bytes DESC
LIMIT 10;
TrackId  Name                         Bytes     
-------  ---------------------------  ----------
3224     Through a Looking Glass      1059546140
2820     Occupation / Precipice       1054423946
3236     The Young Lords              587051735 
3242     The Man With Nine Lives      577829804 
2910     Dave                         574325829 
3235     The Magnificent Warriors     570152232 
3231     The Lost Warrior             558872190 
2902     Maternity Leave              555244214 
3228     Battlestar Galactica, Pt. 3  554509033 
2832     The Woman King               552893447 
sqlite> 
```

To get the 5 shortest tracks, you sort the tracks by the length specified by milliseconds column using ORDER BY clause and get the first 5 rows using LIMIT clause.

```console
sqlite> SELECT
        trackid,
        name,
        milliseconds
FROM
        tracks
ORDER BY
        milliseconds ASC
LIMIT 5;
TrackId  Name                      Milliseconds
-------  ------------------------  ------------
2461     É Uma Partida De Futebol  1071        
168      Now Sports                4884        
170      A Statistic               6373        
178      Oprah                     6635        
3304     Commercial 1              7941        
sqlite> 
```

##### Getting the nth highest and the lowest value
You can use the ORDER BY and LIMIT clauses to get the nth highest or lowest value rows. For example, you may want to know the second-longest track, the third smallest track, etc.

To do this, you use the following steps:

1. First, use ORDER BY to sort the result set in ascending order in case you want to get the nth lowest value, or descending order if you want to get the nth highest value.
2. Second, use the LIMIT OFFSET clause to get the nth highest or the nth lowest row.

The following statement returns the second-longest track in the tracks table.

```console
sqlite> SELECT
        trackid,
        name,
        milliseconds
FROM
        tracks
ORDER BY
        milliseconds DESC
LIMIT 1 OFFSET 1;
TrackId  Name                     Milliseconds
-------  -----------------------  ------------
3224     Through a Looking Glass  5088838     
sqlite> 
```

The following statement gets the third smallest track on the tracks table.

```console
sqlite> SELECT
        trackid,
        name,
        bytes
FROM
        tracks
ORDER BY
        bytes
LIMIT 1 OFFSET 2;
TrackId  Name         Bytes 
-------  -----------  ------
170      A Statistic  211997
sqlite> 
```

#### Between – test whether a value is in a range of values.
##### ntroduction to SQLite BETWEEN Operator
The BETWEEN operator is a logical operator that tests whether a value is in range of values. If the value is in the specified range, the BETWEEN operator returns true. The BETWEEN operator can be used in the WHERE clause of the SELECT, DELETE, UPDATE, and REPLACE statements.

The following illustrates the syntax of the SQLite BETWEEN operator:

```bash
test_expression BETWEEN low_expression AND high_expression
```

In this syntax:

+ test_expression is an expression to test for in the range defined by low_expression and high_expression.
+ low_expression and high_expression is any valid expression that specify the low and high values of the range. The low_expression should be less than or equal to high_expression, or the BETWEEN is always returns false.
+ The AND keyword is a placeholder which indicates the test_expression should be within the range specified by low_expression and high_expression.

**Note** that the BETWEEN operator is inclusive. It returns true when the test_expression is less than or equal to high_expression and greater than or equal to the value of low_expression:

```bash
test_expression >= low_expression AND test_expression <= high_expression
```

To specify an exclusive range, you use the greater than (>) and less than operators (<).

Note that if any input to the BETWEEN operator is NULL, the result is NULL, or unknown to be precise.

To negate the result of the BETWEEN operator, you use the NOT BETWEEN operator as follows:

```bash
test_expression NOT BETWEEN low_expression AND high_expression
```

The NOT BETWEEN returns true if the value of test_expression is less than the value of low_expression or greater than the value of high_expression:

```bash
test_expression < low_expression OR test_expression > high_expression
```

##### SQLite BETWEEN operator examples
We will use the invoices table from the sample database for the demonstration:

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2018/11/invoices.png)

###### SQLite BETWEEN numeric values example
The following statement finds invoices whose total is between 14.96 and 18.86:

```console
sqlite> SELECT
    InvoiceId,
    BillingAddress,
    Total
FROM
    invoices
WHERE
    Total BETWEEN 14.91 and 18.86    
ORDER BY
    Total;
InvoiceId  BillingAddress                        Total
---------  ------------------------------------  -----
193        Berger Straße 10                      14.91
103        162 E Superior Street                 15.86
208        Ullevålsveien 14                      15.86
306        Klanova 9/506                         16.86
313        68, Rue Jouvence                      16.86
88         Calle Lira, 198                       17.91
89         Rotenturmstraße 4, 1010 Innere Stadt  18.86
201        319 N. Frances Street                 18.86
sqlite> 
```

As you can see, the invoices whose total is 14.91 or 18.86 are included in the result set.

###### SQLite NOT BETWEEN numeric values example
To find the invoices whose total are not between 1 and 20, you use the NOT BETWEEN operator as shown in the following query:

```console
sqlite> SELECT
    InvoiceId,
    BillingAddress,
    Total
FROM
    invoices
WHERE
    Total NOT BETWEEN 1 and 20
ORDER BY
    Total;
InvoiceId  BillingAddress                            Total
---------  ----------------------------------------  -----
6          Berger Straße 10                          0.99 
13         1600 Amphitheatre Parkway                 0.99 
20         110 Raeburn Pl                            0.99 
27         5112 48 Street                            0.99 
34         Praça Pio X, 119                          0.99 
41         C/ San Bernardo 85                        0.99 
48         796 Dundas Street West                    0.99 
55         Grétrystraat 63                           0.99 
62         3 Chatham Street                          0.99 
69         319 N. Frances Street                     0.99 
76         Ullevålsveien 14                          0.99 
83         9, Place Louis Barthou                    0.99 
90         801 W 4th Street                          0.99 
104        Barbarossastraße 19                       0.99 
111        1 Microsoft Way                           0.99 
...
```

As clearly shown in the output, the result includes the invoices whose total is less than 1 and greater than 20.

###### SQLite BETWEEN dates example
The following example finds invoices whose invoice dates are from January 1 2010 and January 31 2010:

```console
sqlite> SELECT
    InvoiceId,
    BillingAddress,
    InvoiceDate,
    Total
FROM
    invoices
WHERE
    InvoiceDate BETWEEN '2010-01-01' AND '2010-01-31'
ORDER BY
    InvoiceDate;
InvoiceId  BillingAddress                        InvoiceDate          Total
---------  ------------------------------------  -------------------  -----
84         68, Rue Jouvence                      2010-01-08 00:00:00  1.98 
85         Erzsébet krt. 58.                     2010-01-08 00:00:00  1.98 
86         Via Degli Scipioni, 43                2010-01-09 00:00:00  3.96 
87         Celsiusg. 9                           2010-01-10 00:00:00  6.94 
88         Calle Lira, 198                       2010-01-13 00:00:00  17.91
89         Rotenturmstraße 4, 1010 Innere Stadt  2010-01-18 00:00:00  18.86
90         801 W 4th Street                      2010-01-26 00:00:00  0.99 
sqlite> 
```

###### SQLite NOT BETWEEN dates example
The following statement finds invoices whose dates are not between January 03, 2009, and December 01, 2013:

```console
sqlite> SELECT
    InvoiceId,
    BillingAddress,
    date(InvoiceDate) InvoiceDate,
    Total
FROM
    invoices
WHERE
    InvoiceDate NOT BETWEEN '2009-01-03' AND '2013-12-01'
ORDER BY
    InvoiceDate;
InvoiceId  BillingAddress                            InvoiceDate  Total
---------  ----------------------------------------  -----------  -----
1          Theodor-Heuss-Straße 34                   2009-01-01   1.98 
2          Ullevålsveien 14                          2009-01-02   3.96 
406        801 W 4th Street                          2013-12-04   1.98 
407        69 Salem Street                           2013-12-04   1.98 
408        319 N. Frances Street                     2013-12-05   3.96 
409        796 Dundas Street West                    2013-12-06   5.94 
410        Rua dos Campeões Europeus de Viena, 4350  2013-12-09   8.91 
411        Porthaninkatu 9                           2013-12-14   13.86
412        12,Community Centre                       2013-12-22   1.99 
sqlite> 
```

#### In – check if a value matches any value in a list of values or subquery.

##### Introduction to the SQLite IN operator
The SQLite IN operator determines whether a value matches any value in a list or a subquery. The syntax of the IN operator is as follows:

```bash
expression [NOT] IN (value_list|subquery);
```

The expression can be any valid expression or a column of a table.

A list of values is a fixed value list or a result set of a single column returned by a subquery. The returned type of expression and values in the list must be the same.

The IN operator returns true or false depending on whether the expression matches any value in a list of values or not. To negate the list of values, you use the NOT IN operator.

##### SQLite IN operator examples
We will use the Tracks table from the sample database for the demonstration.

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2018/11/tracks.png)

The following statement uses the IN operator to query the tracks whose media type id is 1 or 2.

```SQL
SELECT
	TrackId,
	Name,
	Mediatypeid
FROM
	Tracks
WHERE
	MediaTypeId IN (1, 2)
ORDER BY
	Name ASC;
```

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/12/SQLite-IN-Operator.jpg)

This query uses the OR operator instead of the IN operator to return the same result set as the above query:

```SQL
SELECT
	TrackId,
	Name,
	MediaTypeId
FROM
	Tracks
WHERE
	MediaTypeId = 1 OR MediaTypeId = 2
ORDER BY
	Name ASC;
```

As you can see from the queries, using the IN operator is much shorter.

If you have a query that uses many OR operators, you can consider using the IN operator instead to make the query more readable.

##### SQLite IN operator with a subquery example
The following query returns a list of album id of the artist id 12:
```console
sqlite> SELECT albumid
FROM albums
WHERE artistid = 12;
AlbumId
-------
16     
17     
sqlite> 
```

To get the tracks that belong to the artist id 12, you can combine the IN operator with a subquery as follows:

```console
sqlite> SELECT albumid
FROM albums
WHERE artistid = 12;
AlbumId
-------
16     
17     
sqlite> SELECT
        TrackId, 
        Name, 
        AlbumId
FROM
        Tracks
WHERE
        AlbumId IN (
                SELECT
                        AlbumId
                FROM
                        Albums
                WHERE
                        ArtistId = 12
        );
TrackId  Name                                    AlbumId
-------  --------------------------------------  -------
149      Black Sabbath                           16     
150      The Wizard                              16     
151      Behind The Wall Of Sleep                16     
152      N.I.B.                                  16     
153      Evil Woman                              16     
154      Sleeping Village                        16     
155      Warning                                 16     
156      Wheels Of Confusion / The Straightener  17     
157      Tomorrow's Dream                        17     
158      Changes                                 17     
159      FX                                      17     
160      Supernaut                               17     
161      Snowblind                               17     
162      Cornucopia                              17     
163      Laguna Sunrise                          17     
164      St. Vitus Dance                         17     
165      Under The Sun/Every Day Comes and Goes  17     
sqlite> 
```

In this example:

+ First, the subquery returns a list of album ids that belong to the artist id 12.
+ Then, the outer query return all tracks whose album id matches with the album id list returned by the subquery.

##### SQLite NOT IN examples
The following statement returns a list of tracks whose genre id is not in a list of (1,2,3).

```SQL
SELECT
	trackid,
	name,
	genreid
FROM
	tracks
WHERE
	genreid NOT IN (1, 2,3);
```

#### Like – query data based on pattern matching using wildcard characters: percent sign (%) and underscore (\_).
a
##### Introduction to SQLite LIKE operator
Sometimes, you don’t know exactly the complete keyword that you want to query. For example, you may know that your most favorite song contains the word,elevator but you don’t know exactly the name.

To query data based on partial information, you use the LIKE operator in the WHERE clause of the SELECT statement as follows:

```SQL
SELECT
	column_list
FROM
	table_name
WHERE
	column_1 LIKE pattern;
```

Note that you can also use the LIKE operator in the WHERE clause of other statements such as the DELETE and UPDATE.

SQLite provides two wildcards for constructing patterns. They are percent sign % and underscore _ :

+ The percent sign % wildcard matches any sequence of zero or more characters.
+ The underscore _ wildcard matches any single character.

###### The percent sign % wildcard examples
The s% pattern that uses the percent sign wildcard ( %) matches any string that starts with s e.g.,son and so.

The %er pattern matches any string that ends with er like peter, clever, etc.

And the %per% pattern matches any string that contains per such as percent and peeper.

###### The underscore _ wildcard examples
The h\_nt pattern matches hunt, hint, etc. The \_\_pple pattern matches topple, supple, tipple, etc.
Note that SQLite LIKE operator is case-insensitive. It means "A" LIKE "a" is true.

However, for Unicode characters that are not in the ASCII ranges, the LIKE operator is case sensitive e.g., "Ä" LIKE "ä" is false.
In case you want to make LIKE operator works case-sensitively, you need to use the following PRAGMA:

```bash
PRAGMA case_sensitive_like = true;
```

##### SQLite LIKE examples
We’ll use the table tracks in the sample database for the demonstration.

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2018/11/tracks.png)

To find the tracks whose names start with the Wild literal string, you use the percent sign % wildcard at the end of the pattern.

```console
sqlite> SELECT           
        trackid,
        name    
FROM
        tracks
WHERE
        name LIKE 'Wild%';
TrackId  Name            
-------  ----------------
1245     Wildest Dreams  
1973     Wild Side       
2627     Wild Hearted Son
2633     Wild Flower     
2944     Wild Honey      
sqlite> 
```

To find the tracks whose names end with Wild word, you use % wildcard at the beginning of the pattern.

```console
sqlite> SELECT           
        trackid,
        name
FROM
        tracks
WHERE
        name LIKE '%Wild';
TrackId  Name             
-------  -----------------
4        Restless and Wild
32       Deuces Are Wild  
775      Call Of The Wild 
2697     I Go Wild        
sqlite> 
```

To find the tracks whose names contain the Wild literal string, you use % wildcard at the beginning and end of the pattern:

```console
sqlite> SELECT             
        trackid,
        name    
FROM
        tracks
WHERE
        name LIKE '%Wild%';
TrackId  Name                             
-------  ---------------------------------
4        Restless and Wild                
32       Deuces Are Wild                  
775      Call Of The Wild                 
1245     Wildest Dreams                   
1869     Where The Wild Things Are        
1973     Wild Side                        
2312     Near Wild Heaven                 
2627     Wild Hearted Son                 
2633     Wild Flower                      
2697     I Go Wild                        
2930     Who's Gonna Ride Your Wild Horses
2944     Wild Honey                       
sqlite> 
```

The following statement finds the tracks whose names contain: zero or more characters (%), followed by Br, followed by a character (\_), followed by wn, and followed by zero or more characters ( %).

```console
sqlite> SELECT              
        trackid,
        name
FROM
        tracks
WHERE
        name LIKE '%Br_wn%';
TrackId  Name                
-------  --------------------
1053     Bad, Bad Leroy Brown
1150     Mr. Brownstone      
sqlite> 
```

##### SQLite LIKE with ESCAPE clause
If the pattern that you want to match contains % or \_, you must use an escape character in an optional ESCAPE clause as follows:

```bash
column_1 LIKE pattern ESCAPE expression;
```

When you specify the ESCAPE clause, the LIKE operator will evaluate the expression that follows the ESCAPE keyword to a string which consists of a single character, or an escape character.

Then you can use this escape character in the pattern to include literal percent sign (%) or underscore (\_).  The LIKE operator evaluates the percent sign (%) or underscore (\_) that follows the escape character as a literal string, not a wildcard character.

Suppose you want to match the string 10% in a column of a table. However, SQLite interprets the percent symbol % as the wildcard character. Therefore,  you need to escape this percent symbol % using an escape character:

```bash
column_1 LIKE '%10\%%' ESCAPE '\';
```

In this expression, the LIKE operator interprets the first % and last % percent signs as wildcards and the second percent sign as a literal percent symbol.

Note that you can use other characters as the escape character e.g., /, @, $.

Consider the following example:

First, create a table t that has one column:

```SQL
CREATE TABLE t(
	c TEXT
);
```

Next, insert some rows into the table t:

```SQL
INSERT INTO t(c)
VALUES('10% increase'),
	('10 times decrease'),
	('100% vs. last year'),
	('20% increase next year');
```

Then, query data from the t table:

```console
sqlite> SELECT * FROM t;
c                     
----------------------
10% increase          
10 times decrease     
100% vs. last year    
20% increase next year
sqlite> 
```

Fourth, attempt to find the row whose value in the c column contains the 10% literal string:

```console
sqlite> SELECT c     
FROM t 
WHERE c LIKE '%10%%';
c                 
------------------
10% increase      
10 times decrease 
100% vs. last year
sqlite> 
```

However, it returns rows whose values in the c column contains 10.

Fifth, to get the correct result, you use the ESCAPE clause as shown in the following query:

```console
sqlite> SELECT c                 
FROM t 
WHERE c LIKE '%10\%%' ESCAPE '\';
c           
------------
10% increase
sqlite> 
```

#### Glob – determine whether a string matches a specific UNIX-pattern.

##### Introduction to the SQLite GLOB operator
The GLOB operator is similar to the LIKE operator. The GLOB operator determines whether a string matches a specific pattern.

Unlike the LIKE operator, the GLOB operator is case sensitive and uses the UNIX wildcards. In addition, the GLOB patterns do not have escape characters.

The following shows the wildcards used with the GLOB operator:

+ The asterisk (\*) wildcard matches any number of characters.
+ The question mark (?) wildcard matches exactly one character.

On top of these wildcards, you can use the list wildcard [] to match one character from a list of characters. For example [xyz] match any single x, y, or z character.

The list wildcard also allows a range of characters e.g., [a-z] matches any single lowercase character from a to z. The [a-zA-Z0-9] pattern matches any single alphanumeric character, both lowercase, and uppercase.

Besides, you can use the character ^ at the beginning of the list to match any character except for any character in the list. For example, the [^0-9] pattern matches any single character except a numeric character.

##### SQLite GLOB examples
The following statement finds tracks whose names start with the string Man. The pattern Man\* matches any string that starts with Man.

```console
sqlite> SELECT           
        trackid,
        name
FROM
        tracks
WHERE
        name GLOB 'Man*';
TrackId  Name                                   
-------  ---------------------------------------
52       Man In The Box                         
106      Man Or Animal                          
257      Manguetown                             
358      Man With The Woman Head                
562      Mangueira                              
584      Manuel                                 
1397     Man On The Edge                        
1459     Manifest Destiny                       
1480     Manic Depression                       
2046     Manguetown                             
2859     Man of Science, Man of Faith (Premiere)
sqlite> 
```

The following statement gets the tracks whose names end with Man. The pattern \*Man matches any string that ends with Man.

```console
sqlite> SELECT           
        trackid,
        name
FROM
        tracks
WHERE
        name GLOB '*Man';
TrackId  Name                        
-------  ----------------------------
31       Blind Man                   
359      Muffin Man                  
431      The Invisible Man           
760      Hard Lovin' Man             
809      Holy Man                    
821      Ramshackle Man              
836      Make Love Like A Man        
962      Just A Man                  
1235     The Wicker Man              
1353     The Wicker Man              
1457     Half The Man                
1573     2,000 Man                   
1809     Of Wolf And Man             
2107     Iron Man                    
2162     Better Man                  
2224     Mystic Man                  
2228     Equal Rights Downpresser Man
2372     My Lovely Man               
2645     Back Door Man               
2854     Company Man                 
2855     Company Man                 
2880     Confidence Man              
2986     Wake Up Dead Man            
3022     Drowning Man                
3090     Ice Cream Man               
3223     How to Stop an Exploding Man
3379     She'll Never Be Your Man    
3427     Fanfare for the Common Man  
sqlite> 
```

The following query finds the tracks whose names start with any single character (?), followed by the string ere and then any number of character (\*).

```console
sqlite> SELECT            
        trackid,
        name
FROM
        tracks
WHERE
        name GLOB '?ere*';
TrackId  Name                        
-------  ----------------------------
324      Pererê                      
1132     Serenity                    
1452     Were Do We Go From Here     
1740     Sereia                      
2198     Jeremy                      
2479     Here's To The Atom Bomb     
2791     Hereditário                 
3042     Here I Am (Come And Take Me)
3133     Here I Go Again             
sqlite> 
```

To find the tracks whose names contain numbers, you can use the list wildcard [0-9] as follows:

```SQL
SELECT
	trackid,
	name
FROM
	tracks
WHERE
	name GLOB '*[1-9]*';
```

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/12/SQLite-GLOB-list-wildcard-example.jpg)

Or to find the tracks whose name does not contain any number, you place the character ^ at the beginning of the list:

```SQL
SELECT
	trackid,
	name
FROM
	tracks
WHERE
	name GLOB '*[^1-9]*';
```

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/12/SQLite-GLOB-list-wildcard-characters-example.jpg)

The following statement finds the tracks whose names end with a number.

```SQL
SELECT
	trackid,
	name
FROM
	tracks
WHERE
	name GLOB '*[1-9]';
```

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/12/SQLite-GLOB-list-wildcard-numbers-example.jpg)

#### IS NULL – check if a value is null or not.

##### Introduction to the SQLite IS NULL operator
NULL is special. It indicates that a piece of information is unknown or not applicable.

For example, some songs may not have the songwriter information because we don’t know who wrote them.

To store these unknown songwriters along with the songs in a database table, we must use NULL.

NULL is not equal to anything even the number zero, an empty string, and so on.

Especially, NULL is not equal to itself. The following expression returns 0:

```bash
NULL = NULL
```

This is because two unknown information cannot be comparable.

Let’s see the following tracks table from the sample database:

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2018/11/tracks.png)

The following statement attempts to find tracks whose composers are NULL:

```SQL
SELECT
    Name, 
    Composer
FROM
    tracks
WHERE
    Composer = NULL;
```

It returns an empty row without issuing any additional message.

This is because the following expression always evaluates to false:

```bash
Composer = NULL
```

It’s not valid to use the NULL this way.

To check if a value is NULL or not, you use the IS NULL operator instead:

```SQL
{ column | expression } IS NULL;
```

The IS NULL operator returns 1 if the column or expression evaluates to NULL.

To find all tracks whose composers are unknown, you use the IS NULL operator as shown in the following query:

```SQL
SELECT
    Name, 
    Composer
FROM
    tracks
WHERE
    Composer IS NULL
ORDER BY 
    Name;
```

Here is the partial output:

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2019/08/SQLite-IS-NULL-example.png)

##### SQLite IS NOT NULL operator
The NOT operator negates the IS NULL operator as follows:

```bash
expression | column IS NOT NULL
```

The IS NOT NULL operator returns 1 if the expression or column is not NULL, and 0 if the expression or column is NULL.

The following example finds tracks whose composers are not NULL:

```SQL
SELECT
    Name, 
    Composer
FROM
    tracks
WHERE
    Composer IS NOT NULL
ORDER BY 
    Name;
```

This picture illustrates the partial output:

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2019/08/SQLite-IS-NOT-NULL-example.png)

### Section 4. Joining tables
#### Inner Join – query data from multiple tables using the inner join clause
##### Introduction to SQLite inner join clause
In relational databases, data is often distributed in many related tables. A table is associated with another table using foreign keys.

To query data from multiple tables, you use INNER JOIN clause. The INNER JOIN clause combines columns from correlated tables.

Suppose you have two tables: A and B.

A has a1, a2, and f columns. B has b1, b2, and f column. The A table links to the B table using a foreign key column named f.

The following illustrates the syntax of the inner join clause:

```SQL
SELECT a1, a2, b1, b2
FROM A
INNER JOIN B on B.f = A.f;
```

For each row in the A table, the INNER JOIN clause compares the value of the f column with the value of the f column in the B table. If the value of the f column in the A table equals the value of the f column in the B table, it combines data from a1, a2, b1, b2, columns and includes this row in the result set.

In other words, the INNER JOIN clause returns rows from the A table that has the corresponding row in B table.

This logic is applied if you join more than 2 tables.

See the following example.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617694441/SQLite/SQLite-Inner-Join-Example_q36ury.png)

Only the rows in the A table: (a1,1), (a3,3) have the corresponding rows in the B table (b1,1), (b2,3) are included in the result set.

The following diagram illustrates the INNER JOIN clause:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617694523/SQLite/SQLite-inner-join-venn-diagram_qtjdhc.png)

##### SQLite INNER JOIN examples
Let’s take a look at the tracks and albums tables in the sample database. The tracks table links to the albums table via AlbumId column.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617694587/SQLite/tracks_albums_inbfdz.png)

In the tracks table, the AlbumId column is a foreign key. And in the albums table, the AlbumId is the primary key.

To query data from both tracks and albums tables, you use the following statement:

```SQL
SELECT
	trackid,
	name,
	title
FROM
	tracks
INNER JOIN albums ON albums.albumid = tracks.albumid;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617694771/SQLite/SQLite-Inner-Join-2-Tables-Example_z3eagi.jpg)

For each row in the tracks table, SQLite uses the value in the albumid column of the tracks table to compare with the value in the albumid of the albums table. If SQLite finds a match, it combines data of rows in both tables in the result set.

You can include the AlbumId columns from both tables in the final result set to see the effect.

```SQL
SELECT
    trackid,
    name,
    tracks.albumid AS album_id_tracks,
    albums.albumid AS album_id_albums,
    title
FROM
    tracks
    INNER JOIN albums ON albums.albumid = tracks.albumid;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617695073/SQLite/SQLite-Inner-Join-Example_nvfumc.jpg)

##### SQLite inner join – 3 tables example
See the following tables:tracks albums and artists

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617695180/SQLite/artists_albums_tracks_hif9gb.png)

One track belongs to one album and one album have many tracks. The tracks table associated with the albums table via albumid column.

One album belongs to one artist and one artist has one or many albums. The albums table links to the artists table via artistid column.

To query data from these tables, you need to use two inner join clauses in the SELECT statement as follows:

```SQL
SELECT
    trackid,
    tracks.name AS track,
    albums.title AS album,
    artists.name AS artist
FROM
    tracks
    INNER JOIN albums ON albums.albumid = tracks.albumid
    INNER JOIN artists ON artists.artistid = albums.artistid;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617695539/SQLite/SQLite-Inner-Join-3-tables_ncxv2k.jpg)

You can use a WHERE clause to get the tracks and albums of the artist with id 10 as the following statement:

```SQL
SELECT
	trackid,
	tracks.name AS Track,
	albums.title AS Album,
	artists.name AS Artist
FROM
	tracks
INNER JOIN albums ON albums.albumid = tracks.albumid
INNER JOIN artists ON artists.artistid = albums.artistid
WHERE
	artists.artistid = 10;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617695629/SQLite/SQLite-INNER-JOIN-with-WHERE-clause_shab7v.jpg)

#### Left Join – combine data from multiple tables using the left join clause
##### Introduction to SQLite LEFT JOIN clause
Similar to the INNER JOIN clause, the LEFT JOIN clause is an optional clause of the SELECT statement. You use the LEFT JOIN clause to query data from multiple related tables.

Suppose we have two tables: A and B.

+ A has m and f columns.
+ B has n and f columns.

To perform join between A and B using LEFT JOIN clause, you use the following statement:

```SQL
SELECT
	a,
	b
FROM
	A
LEFT JOIN B ON A.f = B.f
WHERE search_condition;
```

The expression A.f = B.f is a conditional expression. Besides the equality (=) operator, you can use other comparison operators such as greater than (>), less than (<), etc.

The statement returns a result set that includes:

1. Rows in table A (left table) that have corresponding rows in table B.
2. Rows in the table A table and the rows in the table B filled with NULL values in case the row from table A does not have any corresponding rows in table B.

In other words, all rows in table A are included in the result set whether there are matching rows in table B or not.

In case you have a WHERE clause in the statement, the search_condition in the WHERE clause is applied after the matching of the LEFT JOIN clause completes.

See the following illustration of the LEFT JOIN clause between the A and B tables.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617695957/SQLite/SQLite-left-join-example_ws2gvm.png)

All rows in the table A are included in the result set.

Because the second row (a2,2) does not have a corresponding row in table B, the LEFT JOIN clause creates a fake row filled with NULL.

The following Venn Diagram illustrates the LEFT JOIN clause.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617696015/SQLite/SQLite-Left-Join-Venn-Diagram_hwmkfk.png)

It is noted that LEFT OUTER JOIN is the same as LEFT JOIN.

##### SQLite LEFT JOIN examples
We will use the artists and albums tables in the sample database for demonstration.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617696091/SQLite/artists_albums_ako5gi.png)

One album belongs to one artist. However, one artist may have zero or more albums.

To find artists who do not have any albums by using the LEFT JOIN clause, we select artists and their corresponding albums. If an artist does not have any albums, the value of the AlbumId column is NULL.

To display the artists who do not have any albums first, we have two choices:

+ First, use ORDER BY clause to list the rows whose AlbumId is NULL values first.
+ Second, use WHERE clause and IS NULL operator to list only artists who do not have any albums.

The following statement uses the LEFT JOIN clause with the ORDER BY clause.

```SQL
SELECT
   artists.ArtistId, 
   AlbumId
FROM
   artists
LEFT JOIN albums ON
   albums.ArtistId = artists.ArtistId
ORDER BY
   AlbumId;
```

The following statement uses the LEFT JOIN clause with the WHERE clause.

```SQL
SELECT
   artists.ArtistId
   , AlbumId
FROM
   artists
LEFT JOIN albums ON
   albums.ArtistId = artists.ArtistId
WHERE
   AlbumId IS NULL;
```

#### Cross Join – show you how to use the cross join clause to produce a cartesian product of result sets of the tables involved in the join
##### Introduction to SQLite CROSS JOIN clause
If you use a LEFT JOIN, INNER JOIN, or CROSS JOIN without the ON or USING clause, SQLite produces the Cartesian product of the involved tables. The number of rows in the Cartesian product is the product of the number of rows in each involved tables.

Suppose, we have two tables A and B. The following statements perform the cross join and produce a cartesian product of the rows from the A and B tables.

```SQL
SELECT *
FROM A JOIN B;
```

```SQL
SELECT *
FROM A
INNER JOIN B;
```

```SQL
SELECT *
FROM A
CROSS JOIN B;
```

```SQL
SELECT * 
FROM A, B;
```

Suppose, the A table has N rows and B table has M rows, the CROSS JOIN of these two tables will produce a result set that contains NxM rows.

Imagine that if you have the third table C with K rows, the result of the CROSS JOIN clause of these three tables will contain NxMxK rows, which may be very huge. Therefore, you should be very careful when using the CROSS JOIN clause.

You use the INNER JOIN and LEFT JOIN clauses more often than the CROSS JOIN clause. However, you will find the CROSS JOIN clause very useful in some cases.

For example, when you want to have a matrix that has two dimensions filled with data completely like members and dates data in a membership database. You want to check the attendants of members for all relevant dates. In this case, you may use the CROSS JOIN clause as the following statement:

```SQL
SELECT name,
       date 
FROM members
CROSS JOIN dates;
```

##### SQLite CROSS JOIN clause example
The following statements create the ranks and suits tables that store the ranks and suits for a deck of cards and insert the complete data into these two tables.

```SQL
CREATE TABLE ranks (
    rank TEXT NOT NULL
);

CREATE TABLE suits (
    suit TEXT NOT NULL
);

INSERT INTO ranks(rank) 
VALUES('2'),('3'),('4'),('5'),('6'),('7'),('8'),('9'),('10'),('J'),('Q'),('K'),('A');

INSERT INTO suits(suit) 
VALUES('Clubs'),('Diamonds'),('Hearts'),('Spades');
```

The following statement uses the CROSS JOIN clause to return a complete deck of cards data:

```SQL
SELECT rank,
       suit
  FROM ranks
       CROSS JOIN
       suits
ORDER BY suit;
```

| rank |   suit   |
|------|----------|
|  2   |  Clubs   |
|  3   |  Clubs   |
|  4   |  Clubs   |
|  5   |  Clubs   |
|  6   |  Clubs   |
|  7   |  Clubs   |
|  8   |  Clubs   |
|  9   |  Clubs   |
|  10  |  Clubs   |
|  J   |  Clubs   |
|  Q   |  Clubs   |
|  K   |  Clubs   |
|  A   |  Clubs   |
|  2   |  Diamonds|
|  3   |  Diamonds|
|  4   |  Diamonds|
|  5   |  Diamonds|
|  6   |  Diamonds|
|  7   |  Diamonds|
|  8   |  Diamonds|
|  9   |  Diamonds|
|  10  |  Diamonds|
|  J   |  Diamonds|
|  Q   |  Diamonds|
|  K   |  Diamonds|
|  A   |  Diamonds|
|  2   |  Hearts  |
|  3   |  Hearts  |
|  4   |  Hearts  |
|  5   |  Hearts  |
|  6   |  Hearts  |
|  7   |  Hearts  |
|  8   |  Hearts  |
|  9   |  Hearts  |
|  10  |  Hearts  |
|  J   |  Hearts  |
|  Q   |  Hearts  |
|  K   |  Hearts  |
|  A   |  Hearts  |
|  2   |  Spades  |
|  3   |  Spades  |
|  4   |  Spades  |
|  5   |  Spades  |
|  6   |  Spades  |
|  7   |  Spades  |
|  8   |  Spades  |
|  9   |  Spades  |
|  10  |  Spades  |
|  J   |  Spades  |
|  Q   |  Spades  |
|  K   |  Spades  |
|  A   |  Spades  |

#### Self Join – join a table to itself to create a result set that joins rows with other rows within the same table
##### Introduction to SQLite self-join
The self-join is a special kind of joins that allow you to join a table to itself using either LEFT JOIN or INNER JOIN clause. You use self-join to create a result set that joins the rows with the other rows within the same table.

Because you cannot refer to the same table more than one in a query, you need to use a table alias to assign the table a different name when you use self-join.

The self-join compares values of the same or different columns in the same table. Only one table is involved in the self-join.

You often use self-join to query parents/child relationship stored in a table or to obtain running totals.

##### SQLite self-join examples
We will use the employees table in the sample database for demonstration.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617697644/SQLite/employees_x3wxsp.png)

The employees table stores not only employee data but also organizational data. The ReportsTo column specifies the reporting relationship between employees.

If an employee reports to a manager, the value of the ReportsTo column of the employee’s row is equal to the value of the EmployeeId column of the manager’s row. In case an employee does not report to anyone, the ReportsTo column is NULL.

To get the information on who is the direct report of whom, you use the following statement:

```SQL
SELECT m.firstname || ' ' || m.lastname AS 'Manager',
       e.firstname || ' ' || e.lastname AS 'Direct report' 
FROM employees e
INNER JOIN employees m ON m.employeeid = e.reportsto
ORDER BY manager;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617697926/SQLite/SQLite-self-join-example_ubxpbk.jpg)

The statement used the INNER JOIN clause to join the employees to itself. The employees table has two roles: employees and managers.

Because we used the INNER JOIN clause to join the employees table to itself, the result set does not have the row whose manager column contains a NULL value.

Note that the concatenation operator || concatenates multiple strings into a single string. In the example, we use the concatenation operator to from the full names of the employees by concatenating the first name, space, and last name.

In case you want to query the CEO who does not report to anyone, you need to change the INNER JOIN clause to LEFT JOIN clause in the query above.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617698114/SQLite/SQLite-self-join-with-left-join-example_j9byoi.jpg)

Andrew Adams is the CEO because he does not report anyone.

You can use the self-join technique to find the employees located in the same city as the following query:

```SQL
SELECT DISTINCT
	e1.city,
	e1.firstName || ' ' || e1.lastname AS fullname
FROM
	employees e1
INNER JOIN employees e2 ON e2.city = e1.city 
   AND (e1.firstname <> e2.firstname AND e1.lastname <> e2.lastname)
ORDER BY
	e1.city;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617698212/SQLite/SQLite-self-join-employees-locate-in-the-same-city_kbi8dv.jpg)

The join condition has two expressions:

+ e1.city = e2.city to make sure that both employees located in the same city
+ e.firstname <> e2.firstname AND e1.lastname <> e2.lastname to ensure that e1 and e2 are not the same employee with the assumption that there aren’t employees who have the same first name and last name.

#### Full Outer Join – show you how to emulate the full outer join in the SQLite using left join and union clauses
##### Introduction to SQL FULL OUTER JOIN clause
In theory, the result of the FULL OUTER JOIN is a combination of  a LEFT JOIN and a RIGHT JOIN. The result set of the full outer join has NULL values for every column of the table that does not have a matching row in the other table. For the matching rows, the FULL OUTER JOIN produces a single row with values from columns of the rows in both tables.

The following picture illustrates the result of the FULL OUTER JOIN clause:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617699306/SQLite/full-outer-join_b7scgv.png)

See the following cats and dogs tables.

```SQL
-- create and insert data into the dogs table
CREATE TABLE dogs (
    type       TEXT,
    color TEXT
);

INSERT INTO dogs(type, color) 
VALUES('Hunting','Black'), ('Guard','Brown');

-- create and insert data into the cats table
CREATE TABLE cats (
    type       TEXT,
    color TEXT
);

INSERT INTO cats(type,color) 
VALUES('Indoor','White'), 
      ('Outdoor','Black');
```

The following statement uses the FULL OUTER JOIN clause to query data from the dogs and cats tables.

```SQL
SELECT *
FROM dogs 
FULL OUTER JOIN cats
    ON dogs.color = cats.color;
```

The following shows the result of the statement above:

|  Type  |  Color  |  Type  |  Color  |
|--------|---------|--------|---------|
| Hunting|  Black  | Outdoor|  Black  |
| Guard  |  Brown  | NULL   |  NULL   |
| NULL   |  NULL   | Indoor |  White  |

Unfortunately, SQLite does not support the RIGHT JOIN clause and also the FULL OUTER JOIN clause. However, you can easily emulate the FULL OUTER JOIN by using the LEFT JOIN clause.

##### Emulating SQLite full outer join
The following statement emulates the FULL OUTER JOIN clause in SQLite:

```SQL
SELECT d.type,
         d.color,
         c.type,
         c.color
FROM dogs d
LEFT JOIN cats c USING(color)
UNION ALL
SELECT d.type,
         d.color,
         c.type,
         c.color
FROM cats c
LEFT JOIN dogs d USING(color)
WHERE d.color IS NULL;
```

How the query works.

+ Because SQLilte does not support the RIGHT JOIN clause, we use the LEFT JOIN clause in the second SELECT statement instead and switch the positions of the cats and dogs tables.
+ The UNION ALL clause retains the duplicate rows from the result sets of both queries.
+ The WHERE clause in the second SELECT statement removes rows that already included in the result set of the first SELECT statement.

In this section, you have learned how to use the UNION ALL and LEFT JOIN clauses to emulate the SQLite FULL OUTER JOIN clause.

### Section 5. Grouping data
#### Group By – combine a set of rows into groups based on specified criteria. The GROUP BY clause helps you summarize data for reporting purposes.
##### Introduction to SQLite GROUP BY clause
The GROUP BY clause is an optional clause of the SELECT statement. The GROUP BY clause a selected group of rows into summary rows by values of one or more columns.

The GROUP BY clause returns one row for each group. For each group, you can apply an aggregate function such as MIN, MAX, SUM, COUNT, or AVG to provide more information about each group.

The following statement illustrates the syntax of the SQLite GROUP BY clause.

```SQL
SELECT 
    column_1,
    aggregate_function(column_2) 
FROM 
    table
GROUP BY 
    column_1,
    column_2;
```

The GROUP BY clause comes after the FROM clause of the SELECT statement. In case a statement contains a WHERE clause, the GROUP BY clause must come after the WHERE clause.

Following the GROUP BY clause is a column or a list of comma-separated columns used to specify the group.

##### SQLite GROUP BY examples
We use the tracks table from the sample database for the demonstration.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617700052/SQLite/tracks_dzsp7k.png)

##### SQLite GROUP BY clause with COUNT function
The following statement returns the album id and the number of tracks per album. It uses the GROUP BY clause to groups tracks by album and applies the COUNT() function to each group.

```SQL
SELECT
	albumid,
	COUNT(trackid)
FROM
	tracks
GROUP BY
	albumid;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617700133/SQLite/SQLite-GROUP-BY-with-COUNT-function_o53xsq.jpg)

You can use the ORDER BY clause to sort the groups as follows:

```SQL
SELECT
	albumid,
	COUNT(trackid)
FROM
	tracks
GROUP BY
	albumid
ORDER BY COUNT(trackid) DESC;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617700201/SQLite/SQLite-GROUP-BY-with-COUNT-function-and-ORDER-BY-clause_ictnyy.jpg)

##### SQLite GROUP BY and INNER JOIN clause
You can query data from multiple tables using the INNER JOIN clause, then use the GROUP BY clause to group rows into a set of summary rows.

For example, the following statement joins the tracks table with the albums table to get the album’s titles and uses the GROUP BY clause with the COUNT function to get the number of tracks per album.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617694587/SQLite/tracks_albums_inbfdz.png)

```SQL
SELECT
	tracks.albumid,
	title,
	COUNT(trackid)
FROM
	tracks
INNER JOIN albums ON albums.albumid = tracks.albumid
GROUP BY
	tracks.albumid;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617700421/SQLite/SQLite-GROUP-BY-with-INNER-JOIN_fsidpj.jpg)

##### SQLite GROUP BY with HAVING clause
To filter groups, you use the GROUP BY with HAVING clause. For example, to get the albums that have more than 15 tracks, you use the following statement:

```SQL
SELECT
	tracks.albumid,
	title,
	COUNT(trackid)
FROM
	tracks
INNER JOIN albums ON albums.albumid = tracks.albumid
GROUP BY
	tracks.albumid
HAVING COUNT(trackid) > 15;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617700499/SQLite/SQLite-GROUP-BY-with-HAVING-clause_erf9xo.jpg)

##### SQLite GROUP BY clause with SUM function example
You can use the SUM function to calculate total per group. For example, to get total length and bytes for each album, you use the SUM function to calculate total milliseconds and bytes.

```SQL
SELECT
	albumid,
	SUM(milliseconds) length,
	SUM(bytes) size
FROM
	tracks
GROUP BY
	albumid;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617700571/SQLite/SQLite-GROUP-BY-with-SUM-function_q8bidz.jpg)

##### SQLite GROUP BY with MAX, MIN, and AVG functions
The following statement returns the album id, album title, maximum length, minimum length, and the average length of tracks in the tracks table.

```SQL
SELECT
	tracks.albumid,
	title,
	min(milliseconds),
	max(milliseconds),
	round(avg(milliseconds),2)
FROM
	tracks
INNER JOIN albums ON albums.albumid = tracks.albumid
GROUP BY
	tracks.albumid;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617700653/SQLite/SQLite-GROUP-BY-with-MAX-MIN-AVG-functions_zuz5zo.jpg)

##### SQLite GROUP BY multiple columns example
In the previous example, we have used one column in the GROUP BY clause. SQLite allows you to group rows by multiple columns.

For example, to group tracks by media type and genre, you use the following statement:

```SQL
SELECT
   MediaTypeId, 
   GenreId, 
   COUNT(TrackId)
FROM
   tracks
GROUP BY
   MediaTypeId, 
   GenreId;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617700746/SQLite/SQL-GROUP-BY-multiple-columns-example_wvkjpr.jpg)

SQLite uses the combination of values of MediaTypeId and GenreId columns as a group e.g., (1,1) and (1,2). It then applies the COUNT function to return the number of tracks in each group.

##### SQLite GROUP BY date example
See the following invoices table from the sample database:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617700819/SQLite/invoices_vpuw0q.png)

The following statement returns the number of invoice by years.

```SQL
SELECT
   STRFTIME('%Y', InvoiceDate) InvoiceYear, 
   COUNT(InvoiceId) InvoiceCount
FROM
   invoices
GROUP BY
   STRFTIME('%Y', InvoiceDate)
ORDER BY
   InvoiceYear;
```

Here is the output:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617700901/SQLite/SQLite-GROUP-BY-date-example_dx2loe.png)

In this example:

+ The function STRFTIME('%Y', InvoiceDate) returns a year from a date string.
+ The GROUP BY clause groups the invoices by years.
+ The function COUNT() returns the number of invoice in each year (or group).

#### Having – specify the conditions to filter the groups summarized by the GROUP BY clause.
##### Introduction to SQLite HAVING clause
SQLite HAVING clause is an optional clause of the SELECT statement. The HAVING clause specifies a search condition for a group.

You often use the HAVING clause with the GROUP BY clause. The GROUP BY clause groups a set of rows into a set of summary rows or groups. Then the HAVING clause filters groups based on a specified condition.

If you use the HAVING clause, you must include the GROUP BY clause; otherwise, you will get the following error:

```bash
Error: a GROUP BY clause is required before HAVING
```

**NOTE:** that the HAVING clause is applied after GROUP BY clause, whereas the WHERE clause is applied before the GROUP BY clause.

The following illustrates the syntax of the HAVING clause:

```SQL
SELECT
	column_1, 
        column_2,
	aggregate_function (column_3)
FROM
	table
GROUP BY
	column_1,
        column_2
HAVING
	search_condition;
```

In this syntax, the HAVING clause evaluates the search_condition for each group as a Boolean expression. It only includes a group in the final result set if the evaluation is true.
##### SQLite HAVING clause examples
We will use the tracks table in the sample database for demonstration.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617700052/SQLite/tracks_dzsp7k.png)

To find the number of tracks for each album, you use GROUP BY clause as follows:

```SQL
SELECT
	albumid,
	COUNT(trackid)
FROM
	tracks
GROUP BY
	albumid;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617701225/SQLite/SQLite-HAVING-clause-with-COUNT-function_eotp3d.jpg)

To find the numbers of tracks for the album with id 1, we add a HAVING clause to the following statement:

```SQL
SELECT
	albumid,
	COUNT(trackid)
FROM
	tracks
GROUP BY
	albumid
HAVING albumid = 1;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617701302/SQLite/SQLite-HAVING-with-WHERE-clause_rwtenb.jpg)

We have referred to the AlbumId column in the HAVING clause.

To find albums that have the number of tracks between 18 and 20, you use the aggregate function in the HAVING clause as shown in the following statement:

```SQL
SELECT
   albumid,
   COUNT(trackid)
FROM
   tracks
GROUP BY
   albumid
HAVING 
   COUNT(albumid) BETWEEN 18 AND 20
ORDER BY albumid;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617701366/SQLite/SQLite-HAVING-COUNT-example_mnx9hz.jpg)

##### SQLite HAVING clause with INNER JOIN example
The following statement queries data from tracks and albums tables using inner join to find albums that have the total length greater than 60,000,000 milliseconds.

```SQL
SELECT
	tracks.AlbumId,
	title,
	SUM(Milliseconds) AS length
FROM
	tracks
INNER JOIN albums ON albums.AlbumId = tracks.AlbumId
GROUP BY
	tracks.AlbumId 
HAVING
	length > 60000000;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617701443/SQLite/SQLite-HAVING-with-greater-than-operator-example_k982jj.jpg)

### Section 6. Set operators
#### Union – combine result sets of multiple queries into a single result set. We also discuss the differences between UNION and UNION ALL clauses.
##### Introduction to SQLite UNION operator
Sometimes, you need to combine data from multiple tables into a complete result set. It may be for tables with similar data within the same database or maybe you need to combine similar data from multiple databases.

To combine rows from two or more queries into a single result set, you use SQLite UNION operator. The following illustrates the basic syntax of the UNION operator:

```SQL
query_1
UNION [ALL]
query_2
UNION [ALL]
query_3
...;
```

Both UNION and UNION ALL operators combine rows from result sets into a single result set. The UNION operator removes eliminate duplicate rows, whereas the UNION ALL operator does not.

Because the UNION ALL operator does not remove duplicate rows, it runs faster than the UNION operator.

The following are rules to union data:

+ The number of columns in all queries must be the same.
+ The corresponding columns must have compatible data types.
+ The column names of the first query determine the column names of the combined result set.
+ The GROUP BY and HAVING clauses are applied to each individual query, not the final result set.
+ The ORDER BY clause is applied to the combined result set, not within the individual result set.

Note that the difference between UNION and JOIN e.g., INNER JOIN or LEFT JOIN is that the JOIN clause combines columns from multiple related tables, while UNION combines rows from multiple similar tables.

Suppose we have two tables t1 and t2 with the following structures:

```SQL
CREATE TABLE t1(
    v1 INT
);
 
INSERT INTO t1(v1)
VALUES(1),(2),(3);
 
CREATE TABLE t2(
    v2 INT
);
INSERT INTO t2(v2)
VALUES(2),(3),(4);
```

The following statement combines the result sets of the t1 and t2 table using the UNION operator:

```SQL
SELECT v1
  FROM t1
UNION
SELECT v2
  FROM t2;
```

Here is the output:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617701725/SQLite/SQLite-UNION-example_xpq1de.png)

The following picture illustrates the UNION operation of t1 and t2 tables:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617701775/SQLite/SQLite-UNION_oqawwq.png)

The following statement combines the result sets of t1 and t2 table using the  UNION ALL operator:

```SQL
SELECT v1
  FROM t1
UNION ALL
SELECT v2
  FROM t2;
```

The following picture shows the output:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617701871/SQLite/SQLite-UNION-ALL-example_sjniko.png)

The following picture illustrates the UNION ALL operation of the result sets of t1 and t2 tables:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617701933/SQLite/SQLite-UNION-ALL_i8gyqb.png)

##### SQLite UNION examples
Let’s take some examples of using the UNION operator.

1) SQLite UNION example
This statement uses the UNION operator to combine names of employees and customers into a single list:

```SQL
SELECT FirstName, LastName, 'Employee' AS Type
FROM employees
UNION
SELECT FirstName, LastName, 'Customer'
FROM customers;
```

Here is the output:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617702027/SQLite/sqlite-union-example_erlzfd.png)

2) SQLite UNION with ORDER BY example
This example uses the UNION operator to combine the names of the employees and customers into a single list. In addition, it uses the ORDER BY clause to sort the name list by first name and last name.

```SQL
SELECT FirstName, LastName, 'Employee' AS Type
FROM employees
UNION
SELECT FirstName, LastName, 'Customer'
FROM customers
ORDER BY FirstName, LastName;
```

Here is the output:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617702120/SQLite/sqlite-union-with-order-by-example_ugtwxj.png)

#### Except – compare the result sets of two queries and returns distinct rows from the left query that are not output by the right query.
##### Introduction to SQLite EXCEPT operator
SQLite EXCEPT operator compares the result sets of two queries and returns distinct rows from the left query that are not output by the right query.

The following shows the syntax of the EXCEPT operator:

```SQL
SELECT select_list1
FROM table1
EXCEPT
SELECT select_list2
FROM table2
```

This query must conform to the following rules:

+ First, the number of columns in the select lists of both queries must be the same.
+ Second, the order of the columns and their types must be comparable.

The following statements create two tables t1 and t2 and insert some data into both tables:

```SQL
CREATE TABLE t1(
    v1 INT
);

INSERT INTO t1(v1)
VALUES(1),(2),(3);

CREATE TABLE t2(
    v2 INT
);
INSERT INTO t2(v2)
VALUES(2),(3),(4);
```

The following statement illustrates how to use the EXCEPT operator to compare result sets of two queries:

```SQL
SELECT v1
FROM t1
EXCEPT 
SELECT v2
FROM t2;
```

The output is 1.

The following picture illustrates the EXCEPT operation:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617702566/SQLite/SQLite-EXCEPT-Operator-Illustration_ieifmn.png)

##### SQLite EXCEPT examples
We will use the artists and albums tables from the sample database for the demonstration.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617696091/SQLite/artists_albums_ako5gi.png)

The following statement finds artist ids of artists who do not have any album in the albums table:

```SQL
SELECT ArtistId
FROM artists
EXCEPT
SELECT ArtistId
FROM albums;
```

The output is as follows:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617702709/SQLite/SQLite-EXCEPT-Example_lbaf4h.png)

#### Intersect – compare the result sets of two queries and returns distinct rows that are output by both queries.
##### Introduction to SQLite INTERSECT operator
SQLite INTERSECT operator compares the result sets of two queries and returns distinct rows that are output by both queries.

The following illustrates the syntax of the INTERSECT operator:

```SQL
SELECT select_list1
FROM table1
INTERSECT
SELECT select_list2
FROM table2
```

The basic rules for combining the result sets of two queries are as follows:

+ First, the number and the order of the columns in all queries must be the same.
+ Second, the data types must be comparable.

For the demonstration, we will create two tables t1 and t2 and insert some data into both:

```SQL
CREATE TABLE t1(
    v1 INT
);

INSERT INTO t1(v1)
VALUES(1),(2),(3);

CREATE TABLE t2(
    v2 INT
);
INSERT INTO t2(v2)
VALUES(2),(3),(4);
```

The following statement illustrates how to use the INTERSECT operator to compare result sets of two queries:

```SQL
SELECT v1
FROM t1
INTERSECT
SELECT v2
FROM t2;
```

Here is the output:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617703196/SQLite/SQLite-INTERSECT-operator-example_p8cglp.png)

The following picture illustrates the INTERSECT operation:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617703247/SQLite/SQLite-INTERSECT_ovma1f.png)

#### SQLite INTERSECT example
For the demonstration, we will use the customers and invoices tables from the sample database.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617703320/SQLite/customers_invoices_g1ho0k.png)

The following statement finds customers who have invoices:

```SQL
SELECT CustomerId
FROM customers
INTERSECT
SELECT CustomerId
FROM invoices
ORDER BY CustomerId;
```

The following picture shows the partial output:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617703443/SQLite/SQLite-INTERSECT-example_wddm65.png)

### Section 7. Subquery
#### Subquery – introduce you to the SQLite subquery and correlated subquery.
##### Introduction to SQLite subquery
A subquery is a SELECT statement nested in another statement. See the following statement.

```SQL
SELECT column_1
FROM table_1
WHERE column_1 = (
   SELECT column_1 
   FROM table_2
);
```

The following query is the outer query:

```SQL
SELECT column_1
  FROM table_1
 WHERE colum_1 =
```

And the following query is the subquery.

```SQL
(SELECT column_1
  FROM table_2)
```

You must use a pair of parentheses to enclose a subquery. Note that you can nest a subquery inside another subquery with a certain depth.

Typically, a subquery returns a single row as an atomic value, though it may return multiple rows for comparing values with the IN operator.

You can use a subquery in the SELECT, FROM, WHERE, and JOIN clauses.

##### SQLite subquery examples
We will use the tracks and albums tables from the sample database for the demonstration.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617694587/SQLite/tracks_albums_inbfdz.png)

1) SQLite subquery in the WHERE clause example
You can use a simple subquery as a search condition. For example, the following statement returns all the tracks in the album with the title  Let There Be Rock

```SQL
SELECT trackid,
       name,
       albumid
FROM tracks
WHERE albumid = (
   SELECT albumid
   FROM albums
   WHERE title = 'Let There Be Rock'
);
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617704007/SQLite/SQLite-Subquery-example_pa6t3l.png)

The subquery returns the id of the album with the title 'Let There Be Rock'. The query uses the equal operator (=) to compare albumid returned by the subquery with the  albumid in the tracks table.

If the subquery returns multiple values, you can use the IN operator to check for the existence of a single value against a set of value.

See the following employees and customers table in the sample database:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617704078/SQLite/customers_employees_xkya1m.png)

For example, the following query returns the customers whose sales representatives are in Canada.

```SQL
SELECT customerid,
       firstname,
       lastname
  FROM customers
 WHERE supportrepid IN (
           SELECT employeeid
             FROM employees
            WHERE country = 'Canada'
       );
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617704161/SQLite/SQLite-Subquery-with-IN-operator-example_dplofz.png)

The subquery returns a list of ids of the employees who locate in Canada. The outer query uses the IN operator to find the customers who have the sales representative id in the list.

2) SQLite subquery in the FROM clause example

Sometimes you want to apply aggregate functions to a column multiple times. For example, first, you want to sum the size of an album and then calculate the average size of all albums. You may come up with the following query.

```SQL
SELECT AVG(SUM(bytes) 
FROM tracks
GROUP BY albumid;
```

This query is not valid.

To fix it, you can use a subquery in the FROM clause as follows:

```SQL
SELECT
	AVG(album.size)
FROM
	(
		SELECT
			SUM(bytes) SIZE
		FROM
			tracks
		GROUP BY
			albumid
	) AS album;
```

AVG(album.size)
---------------
  338288920.317


In this case, SQLite first executes the subquery in the FROM clause and returns a result set. Then, SQLite uses this result set as a derived table in the outer query.

##### SQLite correlated subquery
All the subqueries you have seen so far can be executed independently. In other words, it does not depend on the outer query.

The correlated subquery is a subquery that uses the values from the outer query. Unlike an ordinal subquery, a correlated subquery cannot be executed independently.

The correlated subquery is not efficient because it is evaluated for each row processed by the outer query.

The following query uses a correlated subquery to return the albums whose size is less than 10MB.

```SQL
SELECT albumid,
       title
  FROM albums
 WHERE 10000000 > (
                      SELECT sum(bytes) 
                        FROM tracks
                       WHERE tracks.AlbumId = albums.AlbumId
                  )
 ORDER BY title;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617704396/SQLite/SQLite-Correlated-Subquery-Example_ddoidq.png)

How the query works.

+ For each row processed in the outer query, the correlated subquery calculates the size of the albums from the tracks that belong the current album using the SUM function.
+ The predicate in the WHERE clause filters the albums that have the size greater than or equal 10MB (10000000 bytes).

##### SQLite correlated subquery in the SELECT clause example
The following query uses a correlated subquery in the SELECT clause to return the number of tracks in an album.

```SQL
SELECT albumid,
       title,
       (
           SELECT count(trackid) 
             FROM tracks
            WHERE tracks.AlbumId = albums.AlbumId
       )
       tracks_count
  FROM albums
 ORDER BY tracks_count DESC;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617704522/SQLite/SQLite-Subquery-in-SELECT-clause-example_hbts2m.png)

#### Exists operator – test for the existence of rows returned by a subquery.
##### Introduction to SQLite EXISTS operator
The EXISTS operator is a logical operator that checks whether a subquery returns any row.

Here is the basic syntax of the EXISTS operator:

```SQL
EXISTS(subquery)
```

In this syntax, the subquery is a SELECT statement that returns zero or more rows.

If the subquery returns one or more row, the EXISTS operator return true. Otherwise, the EXISTS operator returns false or NULL.

Note that if the subquery returns one row with NULL, the result of the EXISTS operator is still true because the result set contains one row with NULL.

To negate the EXISTS operator, you use the NOT EXISTS operator as follows:

```SQL
NOT EXISTS (subquery)
```

The NOT EXISTS operator returns true if the subquery returns no row.

##### SQLite EXISTS operator example
See the following Customers and Invoices tables from the sample database:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617703320/SQLite/customers_invoices_g1ho0k.png)

The following statement finds customers who have invoices:

```SQL
SELECT
    CustomerId,
    FirstName,
    LastName,
    Company
FROM
    Customers c
WHERE
    EXISTS (
        SELECT 
            1 
        FROM 
            Invoices
        WHERE 
            CustomerId = c.CustomerId
    )
ORDER BY
    FirstName,
    LastName;
```

The following picture shows the partial result set:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617705202/SQLite/sqlite-exists-example_rqtwgm.png)

In this example, for each customer, the EXISTS operator checks if the customer id exists in the invoices table.

+ If yes, the subquery returns one row with value 1 that causes the EXISTS operator evaluate to true. Therefore, the query includes the curstomer in the result set.

+ In case the customer id does not exist in the Invoices table, the subquery returns no rows which causes the EXISTS operator to evaluate to false, hence the query does not include the customer in the result set.

Notice that you can use the IN operator instead of EXISTS operator in this case to achieve the same result:

```SQL
SELECT
   CustomerId, 
   FirstName, 
   LastName, 
   Company
FROM
   Customers c
WHERE
   CustomerId IN (
      SELECT
         CustomerId
      FROM
         Invoices
   )
ORDER BY
   FirstName, 
   LastName;
```

Once the subquery returns the first row, the EXISTS operator stops searching because it can determine the result. On the other hand, the IN operator must scan all rows returned by the subquery to determine the result.

Generally speaking, the EXISTS operator is faster than IN operator if the result set returned by the subquery is large. By contrast, the IN operator is faster than the EXISTS operator if the result set returned by the subquery is small.

##### SQLite NOT EXISTS operator example
See the following Artists and Albums table from the sample database:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617696091/SQLite/artists_albums_ako5gi.png)

This query find all artists who do not have any album in the Albums table:

```SQL
SELECT
   *
FROM
   Artists a
WHERE
   NOT EXISTS(
      SELECT
         1
      FROM
         Albums
      WHERE
         ArtistId = a.ArtistId
   )
ORDER BY Name;
```

Here is the partial output:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617705462/SQLite/sqlite-not-exists-example_r3jvhz.png)

### Section 8. More querying techniques
#### Case – add conditional logic to the query
The SQLite CASE expression evaluates a list of conditions and returns an expression based on the result of the evaluation.

The CASE expression is similar to the IF-THEN-ELSE statement in other programming languages.

You can use the CASE expression in any clause or statement that accepts a valid expression. For example, you can use the CASE expression in clauses such as WHERE, ORDER BY, HAVING, SELECT and statements such as SELECT, UPDATE, and DELETE.

SQLite provides two forms of the CASE expression: simple CASE and searched CASE.

##### SQLite simple CASE expression
The simple CASE expression compares an expression to a list of expressions to return the result. The following illustrates the syntax of the simple CASE expression.

```SQL
CASE case_expression
     WHEN when_expression_1 THEN result_1
     WHEN when_expression_2 THEN result_2
     ...
     [ ELSE result_else ] 
END
```

The simple CASE expression compares the case_expression to the expression appears in the first WHEN clause, when_expression_1, for equality.

If the case_expression equals when_expression_1, the simple CASE returns the expression in the corresponding THEN clause, which is the result_1.

Otherwise, the simple CASE expression compares the case_expression with the expression in the next WHEN clause.

In case no case_expression matches the when_expression, the CASE expression returns the result_else in the ELSE clause. If you omit the ELSE clause, the CASE expression returns NULL.

The simple CASE expression uses short-circuit evaluation. In other words, it returns the result and stop evaluating other conditions as soon as it finds a match.

##### Simple CASE example
Let’s take a look at the customers table in the sample database.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617705726/SQLite/customers_fjoa0m.png)

Suppose, you have to make a report of the customer groups with the logic that if a customer locates in the USA, this customer belongs to the domestic group, otherwise the customer belongs to the foreign group.

To make this report, you use the simple CASE expression in the SELECT statement as follows:

```SQL
SELECT customerid,
       firstname,
       lastname,
       CASE country 
           WHEN 'USA' 
               THEN 'Domestic' 
           ELSE 'Foreign' 
       END CustomerGroup
FROM 
    customers
ORDER BY 
    LastName,
    FirstName;
```

##### SQLite searched CASE expression
The searched CASE expression evaluates a list of expressions to decide the result. Note that the simple CASE expression only compares for equality, while the searched CASE expression can use any forms of comparison.

The following illustrates the syntax of the searched CASE expression.

```SQL
CASE
     WHEN bool_expression_1 THEN result_1
     WHEN bool_expression_2 THEN result_2
     [ ELSE result_else ] 
END
```

The searched CASE expression evaluates the Boolean expressions in the sequence specified and return the corresponding result if the expression evaluates to true.

In case no expression evaluates to true, the searched CASE expression returns the expression in the ELSE clause if specified. If you omit the ELSE clause, the searched CASE expression returns NULL.

Similar to the simple CASE expression, the searched CASE expression stops the evaluation when a condition is met.

##### Searched CASE example
We will use the tracks table for the demonstration.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617700052/SQLite/tracks_dzsp7k.png)

Suppose you want to classify the tracks based on its length such as less a minute, the track is short; between 1 and 5 minutes, the track is medium; greater than 5 minutes, the track is long.

To achieve this, you use the searched CASE expression as follows:

```SQL
SELECT
	trackid,
	name,
	CASE
		WHEN milliseconds < 60000 THEN
			'short'
		WHEN milliseconds > 60000 AND milliseconds < 300000 THEN 'medium'
		ELSE
			'long'
		END category
FROM
	tracks;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617705930/SQLite/SQLite-Searched-CASE-example_qjfnwb.png)

### Section 9. Changing data
This section guides you on how to update data in the table using insert, update, delete, and replace statements.

#### Insert – insert rows into a table
To insert data into a table, you use the INSERT statement. SQLite provides various forms of the INSERT statements that allow you to insert a single row, multiple rows, and default values into a table.

In addition, you can insert a row into a table using data provided by a  SELECT statement.

##### SQLite INSERT – inserting a single row into a table
To insert a single row into a table, you use the following form of the INSERT statement:

```SQL
INSERT INTO table (column1,column2 ,..)
VALUES( value1,	value2 ,...);
```

Let’s examine the INSERT statement in more detail:

+ First, specify the name of the table to which you want to insert data after the INSERT INTO keywords.

+ Second, add a comma-separated list of columns after the table name. The column list is optional. However, it is a good practice to include the column list after the table name.

+ Third, add a comma-separated list of values after the VALUES keyword. If you omit the column list, you have to specify values for all columns in the value list. The number of values in the value list must be the same as the number of columns in the column list.

We will use the artists table in the sample database for the demonstration.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617707929/SQLite/artists_e2hb1s.png)

The following statement insert a new row into the artists table:

```SQL
INSERT INTO artists (name)
VALUES('Bud Powell');
```

Because the ArtistId column is an auto-increment column, you can ignore it in the statement. SQLite automatically geneate a sequential integer number to insert into the ArtistId column.

You can verify the insert operation by using the following SELECT statement:

```SQL
SELECT
	ArtistId,
	Name
FROM
	Artists
ORDER BY
	ArtistId DESC
LIMIT 1;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617708021/SQLite/SQLite-Insert-Example_qkquix.jpg)

As you see, we have a new row in the artists table.

##### SQLite INSERT – Inserting multiple rows into a table
To insert multiple rows into a table, you use the following form of the INSERT statement:

```SQL
INSERT INTO table1 (column1,column2 ,..)
VALUES 
   (value1,value2 ,...),
   (value1,value2 ,...),
    ...
   (value1,value2 ,...);
```

Each value list following the VALUES clause is a row that will be inserted into the table.

The following example inserts three rows into the artists table:

```SQL
INSERT INTO artists (name)
VALUES
	("Buddy Rich"),
	("Candido"),
	("Charlie Byrd");
```

SQLite issued a message:

```SQL
Row Affected: 3
```

You can verify the result using the following statement:

```SQL
SELECT
	ArtistId,
	Name
FROM
	artists
ORDER BY
	ArtistId DESC
LIMIT 3;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617708148/SQLite/SQLite-Insert-Multiple-Example_uzd1d0.jpg)

##### SQLite INSERT – Inserting default values
When you create a new table using the CREATE TABLE statement, you can specify default values for columns, or a NULL if a default value is not specified.

The third form of the INSERT statement is INSERT DEFAULT VALUES, which inserts a new row into a table using the default values specified in the column definition or NULL if the default value is not available and the column does not have a NOT NULL constraint.

For example, the following statement inserts a new row into the artists table using INSERT DEFAULT VALUES:

```SQL
INSERT INTO artists DEFAULT VALUES;
```

To verify the insert, you use the following statement:

```SQL
SELECT
	ArtistId,
	Name
FROM
	artists
ORDER BY
	ArtistId DESC;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617708283/SQLite/SQLite-Insert-default-values_x6whpi.jpg)

The default value of the ArtistId column is the next sequential integer . However, the name column does not have any default value, therefore, the INSERT DEFAULT VALUES statement inserts NULL  into it.

##### SQLite INSERT – Inserting new rows with data provided by a SELECT statement
Suppose you want to backup the artists table, you can follow these steps:

First, create a new table named artists_backup as follows:

```SQL
CREATE TABLE artists_backup(
   ArtistId INTEGER PRIMARY KEY AUTOINCREMENT,
   Name NVARCHAR
);
```

To insert data into the artists_backup table with the data from the artists table, you use the INSERT INTO SELECT statement as follows:

```SQL
INSERT INTO artists_backup 
SELECT ArtistId, Name
FROM artists;
```

If you query data from the artists_backup table, you will see all data in the artists table.

```SQL
SELECT * FROM artists_backup;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617708465/SQLite/SQLite-Insert-Into-Select_befkdo.jpg)

#### Update – update existing rows in a table.
##### Introduction to SQLite UPDATE statement
To update existing data in a table, you use SQLite UPDATE statement. The following illustrates the syntax of the UPDATE statement:

```SQL
UPDATE table
SET column_1 = new_value_1,
    column_2 = new_value_2
WHERE
    search_condition 
ORDER column_or_expression
LIMIT row_count OFFSET offset;
```

In this syntax:

+ First, specify the table where you want to update after the UPDATE clause.
+ Second, set new value for each column of the table in the SET clause.
+ Third, specify rows to update using a condition in the WHERE clause. The WHERE clause is optional. If you skip it, the UPDATE statement will update data in all rows of the table.
+ Finally, use the ORDER BY and LIMIT clauses in the UPDATE statement to specify the number of rows to update.

Notice that if use a negative value in the LIMIT clause, SQLite assumes that there are no limit and updates all rows that meet the condition in the preceding WHERE clause.

The ORDER BY clause should always goes with the LIMIT clause to specify exactly which rows to be updated. Otherwise, you will never know which row will be actually updated; because without the ORDER BY clause, the order of rows in the table is unspecified.

##### SQLite UPDATE statement examples
We will use the employees table in the sample database to demonstrate the UPDATE statement.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617697644/SQLite/employees_x3wxsp.png)

The following SELECT statement gets partial data from the employees table:

```SQL
SELECT
	employeeid,
	firstname,
	lastname,
	title,
	email
FROM
	employees;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617708775/SQLite/SQLite-Update-Table-Example_drfwnf.jpg)

1) Update one column example
Suppose, Jane got married and she wanted to change her last name to her husband’s last name i.e., Smith. In this case, you can update Jane’s last name using the following statement:

```SQL
UPDATE employees
SET lastname = 'Smith'
WHERE employeeid = 3;
```

The expression in the WHERE clause makes sure that we update Jane’s record only. We set the lastname column to a literal string 'Smith'.

To verify the UPDATE, you use the following statement:

```SQL
SELECT
	employeeid,
	firstname,
	lastname,
	title,
	email
FROM
	employees
WHERE
	employeeid = 3;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617709034/SQLite/SQLite-Update-One-Column-Example_hsar7a.jpg)

2) Update multiple columns example
Suppose Park Margaret locates in Toronto and you want to change his address, city, and state information. You can use the UPDATE statement to update multiple columns as follows:

```SQL
UPDATE employees
SET city = 'Toronto',
    state = 'ON',
    postalcode = 'M5P 2N7'
WHERE
    employeeid = 4;
```

To verify the UPDATE, you use the following statement:

```SQL
SELECT
	employeeid,
	firstname,
	lastname,
	state,
	city,
	PostalCode
FROM
	employees
WHERE
	employeeid = 4;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617709259/SQLite/SQLite-Update-Multiple-Columns-Example_w2izkx.jpg)

3) Update with ORDER BY and LIMIT clauses example
Notice that you need to build SQLite with SQLITE_ENABLE_UPDATE_DELETE_LIMIT option in order to perform UPDATE statement with optional ORDER BY and LIMIT clauses.

Let’s check the email addresses of employees in the employees table:

```SQL
SELECT
	employeeid,
	firstname,
	lastname,
	email
FROM
	employees;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617709501/SQLite/SQLite-Update-Order-By-Limit_rcp4fo.jpg)

To update one row in the employees table, you use LIMIT 1 clause. To make sure that you update the first row of employees sorted by the first name, you add the ORDER BY firstname clause.

So the following statement updates email of Andrew Adams:

```SQL
UPDATE employees
SET email = LOWER(
	firstname || "." || lastname || "@chinookcorp.com"
)
ORDER BY
	firstname
LIMIT 1;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617709612/SQLite/SQLite-Update-Order-By-Limit-Example_ady0ms.jpg)

The new email is the combination of the first name, dot (.), last name and the suffix @chinookcorp.com

The LOWER() function converts the email to lower case.

4) Update all rows example
To update all rows in the  employees table, you skip the WHERE clause. For example, the following UPDATE statement changes all email addresses of all employees to lowercase:

```SQL
UPDATE employees
SET email = LOWER(
	firstname || "." || lastname || "@chinookcorp.com"
);
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617709685/SQLite/SQLite-Update-all-Rows-Example_zilhc2.jpg)

#### Delete – delete rows from a table.
##### Introduction to SQLite DELETE statement
You have learned how to insert a new row into a table and update existing data of a table. Sometimes, you need to remove rows from a table. In this case, you use SQLite DELETE statement.

The SQLite DELETE statement allows you to delete one row, multiple rows, and all rows in a table. The syntax of the SQLite DELETE statement is as follows:

```SQL
DELETE FROM table
WHERE search_condition;
```

In this syntax:

+ First, specify the name of the table which you want to remove rows after the DELETE FROM keywords.

+ Second, add a search condition in the WHERE clause to identify the rows to remove. The WHERE clause is an optional part of the DELETE statement. If you omit the WHERE clause, the DELETE statement will delete all rows in the table.

SQLite also provides an extension to the DELETE statement by adding ORDER BY and LIMIT clauses. If you compile SQLite with the SQLITE_ENABLE_UPDATE_DELETE_LIMIT compile-time option, you can use the ORDER BY and LIMIT clause in the DELETE statement like the following form:

```SQL
DELETE FROM table
WHERE search_condition
ORDER BY criteria
LIMIT row_count OFFSET offset;
```

The ORDER BY clause sorts the rows filtered by the preceding search_condition in the WHERE clause and the LIMIT clause specifies the number of rows that to be deleted.

Notice that when you use the DELETE statement without a WHERE clause on a table that has no triggers. SQLite will delete all rows in one shot instead of visiting and deleting each individual row. This feature is known as truncate optimization.

##### SQLite DELETE statement examples
We will use the artists_backup table created in the how to insert rows into table tutorial.

If you did not follow that tutorial, you can create the artists_backup table and insert data into it using the following script:

```SQL
-- create artists backup table
CREATE TABLE artists_backup(
   artistid INTEGER PRIMARY KEY AUTOINCREMENT,
   name NVARCHAR
);
-- populate data from the artists table
INSERT INTO artists_backup 
SELECT artistid,name
FROM artists;
```

The following statement returns all rows from the artists_backup table:

```SQL
SELECT
	artistid,
	name
FROM
	artists_backup;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617713492/SQLite/SQLite-Delete-Table-Example_fhgdjz.jpg)

We have 280 rows in the artists_backup table.

To remove an artist with id 1, you use the following statement:

```SQL
DELETE FROM artists_backup
WHERE artistid = 1;
```

Because we use artistid to identify the artist, the statement removed exactly 1 row.

Suppose you want to delete artists whose names contain the word Santana:

```SQL
DELETE FROM artists_backup
WHERE name LIKE '%Santana%';
```

There are 9 rows whose values in the name column contain the word Santana therefore, these 9 rows were deleted.

To remove all rows in the artists_backup table, you just need to omit the WHERE clause as the following statement:

```SQL
DELETE FROM artists_backup;
```

#### Replace – insert a new row or replace the existing row in a table.
##### Introduction to the SQLite REPLACE statement
The idea of the REPLACE statement is that when a UNIQUE or PRIMARY KEY constraint violation occurs, it does the following:

+ First, delete the existing row that causes a constraint violation.
+ Second, insert a new row.

In the second step, if any constraint violation e.g., NOT NULL constraint occurs, the REPLACE statement will abort the action and roll back the transaction.

The following illustrates the syntax of the REPLACE statement.

```SQL
INSERT OR REPLACE INTO table(column_list)
VALUES(value_list);
```

Or in a short form:

```SQL
REPLACE INTO table(column_list)
VALUES(value_list);
```

Let’s take a look at some examples of using the SQLite REPLACE statement to understand how it works.

##### The SQLite REPLACE statement examples
First, create a new table named positions with the following structure.

```SQL
CREATE TABLE IF NOT EXISTS positions (
	id INTEGER PRIMARY KEY,
	title TEXT NOT NULL,
	min_salary NUMERIC
);
```

Second, insert some rows into the positions table.

```
INSERT INTO positions (title, min_salary)
VALUES ('DBA', 120000),
       ('Developer', 100000),
       ('Architect', 150000);
```

Third, verify the insert using the following SELECT statement.

```SQL
SELECT * FROM positions;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617715399/SQLite/SQLite-REPLACE-positions-table_df5oqm.jpg)

The following statement creates a unique index on the title column of the positions table to ensure that it doesn’t have any duplicate position title:

```SQL
CREATE UNIQUE INDEX idx_positions_title 
ON positions (title);
```

Suppose, you want to add a position into the positions table if it does not exist, in case the position exists, update the current one.

The following REPLACE statement inserts a new row into the positions table because the position title Full Stack Developer is not in the positions table.

```SQL
REPLACE INTO positions (title, min_salary)
VALUES('Full Stack Developer', 140000);
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617715586/SQLite/SQLite-REPLACE-insert-new-row_mh6jan.jpg)

You can verify the REPLACE operation using the SELECT statement.

```SQL
SELECT
	id,title,min_salary
FROM
	positions;
```

See the following statement.

```SQL
REPLACE INTO positions (title, min_salary)
VALUES('DBA', 170000);
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617715685/SQLite/SQLite-REPLACE-replace_n1igt0.jpg)

First, SQLite checked the UNIQUE constraint.

Second, because this statement violated the UNIQUE constraint by trying to add the DBA title that already exists, SQLite deleted the existing row.

Third, SQLite inserted a new row with the data provided by the REPLACE statement.

Notice that the REPLACE statement means INSERT or REPLACE, not INSERT or UPDATE.

See the following statement.

```SQL
REPLACE INTO positions (id, min_salary)
VALUES(2, 110000);
```

What the statement tried to do is to update the min_salary for the position with id 2, which is the developer.

First, the position with id 2 already exists, the REPLACE statement removes it.

Then, SQLite tried to insert a new row with two columns: ( id, min_salary). However, it violates the NOT NULL constraint of the title column. Therefore, SQLite rolls back the transaction.

If the title column does not have the NOT NULL constraint, the REPLACE statement will insert a new row whose the title column is NULL.

### Section 10. Transactions
#### Transaction – show you how to handle transactions in SQLite.
##### SQLite & ACID
SQLite is a transactional database that all changes and queries are atomic, consistent, isolated, and durable (ACID).

SQLite guarantees all the transactions are ACID compliant even if the transaction is interrupted by a program crash, operation system dump, or power failure to the computer.

+ **Atomic**: a transaction should be atomic. It means that a change cannot be broken down into smaller ones. When you commit a transaction, either the entire transaction is applied or not.

+ **Consistent**: a transaction must ensure to change the database from one valid state to another. When a transaction starts and executes a statement to modify data, the database becomes inconsistent. However, when the transaction is committed or rolled back, it is important that the transaction must keep the database consistent.

+ **Isolation**: a pending transaction performed by a session must be isolated from other sessions. When a session starts a transaction and executes the INSERT or UPDATE statement to change the data, these changes are only visible to the current session, not others. On the other hand, the changes committed by other sessions after the transaction started should not be visible to the current session.

+ **Durable**: if a transaction is successfully committed, the changes must be permanent in the database regardless of the condition such as power failure or program crash. On the contrary, if the program crashes before the transaction is committed, the change should not persist.
##### SQLite transaction statements
By default, SQLite operates in auto-commit mode. It means that for each command, SQLite starts, processes, and commits the transaction automatically.

To start a transaction explicitly, you use the following steps:

First, open a transaction by issuing the BEGIN TRANSACTION command.

```SQL
BEGIN TRANSACTION;
```

After executing the statement BEGIN TRANSACTION, the transaction is open until it is explicitly committed or rolled back.

Second, issue SQL statements to select or update data in the database. Note that the change is only visible to the current session (or client).

Third, commit the changes to the database by using the COMMIT or COMMIT TRANSACTION statement.

```SQL
COMMIT;
```

If you do not want to save the changes, you can roll back using the ROLLBACK or ROLLBACK TRANSACTION statement:

```SQL
ROLLBACK;
```

##### SQLite transaction example
We will create two new tables: accounts and account_changes for the demonstration.

The accounts table stores data about the account numbers and their balances. The account_changes table stores the changes of the accounts.

First, create the accounts and account_changes tables by using the following CREATE TABLE statements:

```SQL
CREATE TABLE accounts ( 
	account_no INTEGER NOT NULL, 
	balance DECIMAL NOT NULL DEFAULT 0,
	PRIMARY KEY(account_no),
        CHECK(balance >= 0)
);

CREATE TABLE account_changes (
	change_no INT NOT NULL PRIMARY KEY,
	account_no INTEGER NOT NULL, 
	flag TEXT NOT NULL, 
	amount DECIMAL NOT NULL, 
	changed_at TEXT NOT NULL 
);
```

Second, insert some sample data into the accounts table.

```SQL
INSERT INTO accounts (account_no,balance)
VALUES (100,20100);

INSERT INTO accounts (account_no,balance)
VALUES (200,10100);
```

Third, query data from the accounts table:

```SQL
SELECT * FROM accounts;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617716224/SQLite/sqlite-transaction-accounts-table_zjxa4w.png)

Fourth, transfer 1000 from account 100 to 200, and log the changes to the table account_changes in a single transaction.

```SQL
BEGIN TRANSACTION;

UPDATE accounts
   SET balance = balance - 1000
 WHERE account_no = 100;

UPDATE accounts
   SET balance = balance + 1000
 WHERE account_no = 200;
 
INSERT INTO account_changes(account_no,flag,amount,changed_at) 
VALUES(100,'-',1000,datetime('now'));

INSERT INTO account_changes(account_no,flag,amount,changed_at) 
VALUES(200,'+',1000,datetime('now'));

COMMIT;
```

Fifth, query data from the accounts table:

```SQL
SELECT * FROM accounts;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617716324/SQLite/sqlite-transaction-accounts-table-after-modifying_a09qwi.png)

As you can see, balances have been updated successfully.

Sixth, query the contents of the account_changes table:

```SQL
SELECT * FROM account_changes;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617716405/SQLite/sqlite-transaction-log-table_bvl9m9.png)

Let’s take another example of rolling back a transaction.

First, attempt to deduct 20,000 from account 100:

```SQL
BEGIN TRANSACTION;

UPDATE accounts
   SET balance = balance - 20000
 WHERE account_no = 100;

INSERT INTO account_changes(account_no,flag,amount,changed_at) 
VALUES(100,'-',20000,datetime('now'));
```

SQLite issued an error due to not enough balance:

```SQL
[SQLITE_CONSTRAINT]  Abort due to constraint violation (CHECK constraint failed: accounts)
```

However, the log has been saved to the account_changes table:

```SQL
SELECT * FROM account_changes;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617716542/SQLite/sqlite-transaction-rollback-example_yu9vhv.png)

Second, roll back the transaction by using the ROLLBACK statement:

```SQL
ROLLBACK;
```

Finally, query data from the account_changes table, you will see that the change no #3 is not there anymore:

```SQL
SELECT * FROM account_changes;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617716640/SQLite/sqlite-transaction-rollback-change_wn0upw.png)

### Section 11. Data definition

In this section, you’ll learn how to create database objects such as tables, views, indexes using SQL data definition language.

#### SQLite Data Types – introduce you to the SQLite dynamic type system and its important concepts: storage classes, manifest typing, and type affinity.

##### Introduction to SQLite data types
If you come from other database systems such as MySQL and PostgreSQL, you notice that they use static typing. It means when you declare a column with a specific data type, that column can store only data of the declared data type.

Different from other database systems, SQLite uses dynamic type system. In other words, a value stored in a column determines its data type, not the column’s data type.

In addition, you don’t have to declare a specific data type for a column when you create a table. In case you declare a column with the integer data type, you can store any kind of data types such as text and BLOB, SQLite will not complain about this.

SQLite provides five primitive data types which are referred to as storage classes.

Storage classes describe the formats that SQLite uses to store data on disk. A storage class is more general than a data type e.g., INTEGER storage class includes 6 different types of integers. In most cases, you can use storage classes and data types interchangeably.

The following table illustrates 5 storage classes in SQLite:

| Storage Class |                                 Meaning                                            |
|---------------|------------------------------------------------------------------------------------|
|     NULL      | NULL values mean missing information or unknown.                                   |
|    INTEGER    | Integer values are whole numbers (either positive or negative). An integer can have variable sizes such as 1, 2,3, 4, or 8 bytes.
| REAL          | Real values are real numbers with decimal values that use 8-byte floats.           |
| TEXT          | TEXT is used to store character data. The maximum length of TEXT is unlimited. SQLite supports various character encodings.|
| BLOB          | BLOB stands for a binary large object that can store any kind of data. The maximum size of BLOB is, theoretically, unlimited.|

SQLite determines the data type of a value based on its data type according to the following rules:

+ If a literal has no enclosing quotes and decimal point or exponent, SQLite assigns the INTEGER storage class.
+ If a literal is enclosed by single or double quotes, SQLite assigns the TEXT storage class.
+ If a literal does not have quote nor decimal point nor exponent, SQLite assigns REAL storage class.
+ If a literal is NULL without quotes, it assigned NULL storage class.
+ If a literal has the X’ABCD’ or x ‘abcd’, SQLite assigned BLOB storage class.

SQLite does not support built-in date and time storage classes. However, you can use the TEXT, INT, or REAL to store date and time values. For the detailed information on how to handle date and time values, check it out the SQLite date and time tutorial.

SQLites provides the typeof() function that allows you to check the storage class of a value based on its format. See the following example:

```console
sqlite> SELECT       
        typeof(100),
        typeof(10.0),
        typeof('100'),
        typeof(x'1000'),
        typeof(NULL);
typeof(100)  typeof(10.0)  typeof('100')  typeof(x'1000')  typeof(NULL)
-----------  ------------  -------------  ---------------  ------------
integer      real          text           blob             null        
sqlite> 
```

A single column in SQLite can store mixed data types. See the following example.

First, create a new table named test_datatypes for testing.

```SQL
CREATE TABLE test_datatypes (
	id INTEGER PRIMARY KEY,
	val
);
```

Second, insert data into the test_datatypes table.

```SQL
INSERT INTO test_datatypes (val)
VALUES
	(1),
	(2),
	(10.1),
	(20.5),
	('A'),
	('B'),
	(NULL),
	(x'0010'),
	(x'0011');
```

Third, use the typeof() function to get the data type of each value stored in the val column.

```console
sqlite> SELECT         
        id,
        val,
        typeof(val)
FROM
        test_datatypes;
id  val   typeof(val)
--  ----  -----------
1   1     integer    
2   2     integer    
3   10.1  real       
4   20.5  real       
5   A     text       
6   B     text       
7         null       
8         blob       
9         blob
```

You may ask how SQLite sorts data in a column with different storage classes like val column above.

To resolve this, SQLite provides the following set of rules when it comes to sorting:

+ NULL storage class has the lowest value. It is lower than any other values. Between NULL values, there is no order.
+ The next higher storage classes are INTEGER and REAL. SQLite compares INTEGER and REAL numerically.
+ The next higher storage class is TEXT. SQLite uses the collation of TEXT values when it compares the TEXT values.
+ The highest storage class is the BLOB. SQLite uses the C function memcmp() to compare BLOB values.

When you use the ORDER BY clause to sort the data in a column with different storage classes, SQLite performs the following steps:

+ First, group values based on storage class: NULL, INTEGER, and REAL, TEXT, and BLOB.
+ Second, sort the values in each group.

The following statement sorts the mixed data in the val column of the test_datatypes table:

```console
sqlite> SELECT
        id,
        val,
        typeof(val)
FROM
        test_datatypes
ORDER BY val;
id  val   typeof(val)
--  ----  -----------
7         null       
16        null       
1   1     integer    
10  1     integer    
2   2     integer    
11  2     integer    
3   10.1  real       
12  10.1  real       
4   20.5  real       
13  20.5  real       
5   A     text       
14  A     text       
6   B     text       
15  B     text       
8         blob       
17        blob       
9         blob       
18        blob       
sqlite> 
```

##### SQLite manifest typing & type affinity
Other important concepts related to SQLite data types are manifest typing and type affinity:

Manifest typing means that a data type is a property of a value stored in a column, not the property of the column in which the value is stored. SQLite uses manifest typing to store values of any type in a column.
Type affinity of a column is the recommended type for data stored in that column. Note that the data type is recommended, not required, therefore, a column can store any type of data.

#### Create Table – show you how to create a new table in the database.

##### Introduction to SQLite CREATE TABLE statement
To create a new table in SQLite, you use CREATE TABLE statement using the following syntax:

```SQL
CREATE TABLE [IF NOT EXISTS] [schema_name].table_name (
	column_1 data_type PRIMARY KEY,
   	column_2 data_type NOT NULL,
	column_3 data_type DEFAULT 0,
	table_constraints
) [WITHOUT ROWID];
```

In this syntax:

+ First, specify the name of the table that you want to create after the CREATE TABLE keywords. The name of the table cannot start with sqlite_ because it is reserved for the internal use of SQLite.

+ Second, use IF NOT EXISTS option to create a new table if it does not exist. Attempting to create a table that already exists without using the IF NOT EXISTS option will result in an error.

+ Third, optionally specify the schema_name to which the new table belongs. The schema can be the main database, temp database or any attached database.

+ Fourth, specify the column list of the table. Each column has a name, data type, and the column constraint. SQLite supports PRIMARY KEY, UNIQUE, NOT NULL, and CHECK column constraints.

+ Fifth, specify the table constraints such as PRIMARY KEY, FOREIGN KEY, UNIQUE, and CHECK constraints.

+ Finally, optionally use the WITHOUT ROWID option. By default, a row in a table has an implicit column, which is referred to as the rowid, oid or _rowid_ column. The rowid column stores a 64-bit signed integer key that uniquely identifies the row inside the table. If you don’t want SQLite creates the rowid column, you specify the WITHOUT ROWID option. A table that contains the rowid column is known as a rowid table. Note that the WITHOUT ROWID option is only available in SQLite 3.8.2 or later.

Note that the primary key of a table is a column or a group of columns that uniquely identify each row in the table.

##### SQLite CREATE TABLE examples
Suppose you have to manage contacts using SQLite.

Each contact has the following information:

+ First name
+ Last name
+ Email
+ Phone

The requirement is that the email and phone must be unique. In addition, each contact belongs to one or many groups, and each group can have zero or many contacts.

Based on these requirements, we came up with three tables:

+ The contacts table that stores contact information.
+ The groups table that stores group information.
+ The contact_groups table that stores the relationship between contacts and groups.

The following database diagram illustrates tables:contacts groups, and contact_groups.

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/12/SQLite-CREATE-TABLE-example.jpg)

The following statement creates the contacts table.

```SQL
CREATE TABLE contacts (
	contact_id INTEGER PRIMARY KEY,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email TEXT NOT NULL UNIQUE,
	phone TEXT NOT NULL UNIQUE
);
```

The contact_id is the primary key of the contacts table.

Because the primary key consists of one column, you can use the column constraint.

The first_name and last_name columns have TEXT storage class and these columns are NOT NULL. It means that you must provide values when you insert or update rows in the contacts table.

The email and phone are unique therefore we use the UNIQUE constraint for each column.

The following statement creates the groups table:

```SQL
CREATE TABLE groups (
   group_id INTEGER PRIMARY KEY,
   name TEXT NOT NULL
);
```

The groups table is quite simple with two columns: group_id and name. The group_id column is the primary key column.

The following statement creates contact_groups table:

```SQL
CREATE TABLE contact_groups(
   contact_id INTEGER,
   group_id INTEGER,
   PRIMARY KEY (contact_id, group_id),
   FOREIGN KEY (contact_id) 
      REFERENCES contacts (contact_id) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION,
   FOREIGN KEY (group_id) 
      REFERENCES groups (group_id) 
         ON DELETE CASCADE 
         ON UPDATE NO ACTION
);
```

The contact_groups table has a primary key that consists of two columns: contact_id and group_id.

To add the table primary key constraint, you use this syntax:

```SQL
PRIMARY KEY (contact_id, group_id)
```

In addition, the contact_id and group_id are the foreign keys. Therefore, you use FOREIGN KEY constraint to define a foreign key for each column.

```SQL
FOREIGN KEY (contact_id) 
   REFERENCES contacts (contact_id) 
      ON DELETE CASCADE 
      ON UPDATE NO ACTION
```

```SQL
FOREIGN KEY (group_id) 
    REFERENCES groups (group_id) 
      ON DELETE CASCADE 
      ON UPDATE NO ACTION
```

Note that we will discuss in the FOREIGN KEY constraint in detail in the subsequent tutorial.

#### Alter Table – show you how to use modify the structure of an existing table.

Unlike SQL-standard and other database systems, SQLite supports a very limited functionality of the ALTER TABLE statement.

By using an SQLite ALTER TABLE statement, you can perform two actions:

1. Rename a table.
2. Add a new column to a table.
3. Rename a column (added supported in version 3.20.0)

##### Using SQLite ALTER TABLE to rename a table
To rename a table, you use the following ALTER TABLE RENAME TO statement:

```SQL
ALTER TABLE existing_table
RENAME TO new_table;
```

These are important points you should know before you rename a table:

+ The ALTER TABLE only renames a table within a database. You cannot use it to move the table between the attached databases.

+ The database objects such as indexes and triggers associated with the table will be associated with the new table.

+ If a table is referenced by views or statements in triggers, you must manually change the definition of views and triggers.

Let’s take an example of renaming a table.

First, create a table named devices that has three columns: name, model, serial; and insert a new row into the devices table.

```SQL
CREATE TABLE devices (
   name TEXT NOT NULL,
   model TEXT NOT NULL,
   Serial INTEGER NOT NULL UNIQUE
);

INSERT INTO devices (name, model, serial)
VALUES('HP ZBook 17 G3 Mobile Workstation','ZBook','SN-2015');
```

Second, use the ALTER TABLE RENAME TO statement to change the devices table to equipment table as follows:

```SQL
ALTER TABLE devices
RENAME TO equipment;
```

Third, query data from the equipment table to verify the RENAME operation.

```SQL
SELECT
	name,
	model,
	serial
FROM
	equipment;
```

##### Using SQLite ALTER TABLE to add a new column to a table
You can use the SQLite ALTER TABLE statement to add a new column to an existing table. In this scenario, SQLite appends the new column at the end of the existing column list.

The following illustrates the syntax of ALTER TABLE ADD COLUMN statement:

```SQL
ALTER TABLE table_name
ADD COLUMN column_definition;
```

There are some restrictions on the new column:

+ The new column cannot have a UNIQUE or PRIMARY KEY constraint.
+ If the new column has a NOT NULL constraint, you must specify a default value for the column other than a NULL value.
+ The new column cannot have a default of CURRENT_TIMESTAMP, CURRENT_DATE, and CURRENT_TIME, or an expression.
+ If the new column is a foreign key and the foreign key constraint check is enabled, the new column must accept a default value NULL.

For example, you can add a new column named location to the equipment table:

```SQL
ALTER TABLE equipment 
ADD COLUMN location text;
```

##### Using SQLite ALTER TABLE to rename a column
SQLite added the support for renaming a column using ALTER TABLE RENAME COLUMN statement in version 3.20.0

The following shows the syntax of the ALTER TABLE RENAME COLUMN statement:

```SQL
ALTER TABLE table_name
RENAME COLUMN current_name TO new_name;
```

##### Using SQLite ALTER TABLE for other actions
If you want to perform other actions e.g., drop a column, you use the following steps:

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/12/SQLite-ALTER-TABLE-Steps.jpg)

The following script illustrates the steps above:

```SQL
-- disable foreign key constraint check
PRAGMA foreign_keys=off;

-- start a transaction
BEGIN TRANSACTION;

-- Here you can drop column
CREATE TABLE IF NOT EXISTS new_table( 
   column_definition,
   ...
);
-- copy data from the table to the new_table
INSERT INTO new_table(column_list)
SELECT column_list
FROM table;

-- drop the table
DROP TABLE table;

-- rename the new_table to the table
ALTER TABLE new_table RENAME TO table; 

-- commit the transaction
COMMIT;

-- enable foreign key constraint check
PRAGMA foreign_keys=on;
```

##### SQLite ALTER TABLE DROP COLUMN example
SQLite does not support ALTER TABLE DROP COLUMN statement. To drop a column, you need to use the steps above.

The following script creates two tables users and favorites, and insert data into these tables:

```SQL
CREATE TABLE users(
	UserId INTEGER PRIMARY KEY,
	FirstName TEXT NOT NULL,
	LastName TEXT NOT NULL,
	Email TEXT NOT NULL,
	Phone TEXT NOT NULL
);VACUUM with an INTO clause
Here is syntax of the VACUUM with INTO clause:

VACUUM schema-name INTO filename;
Code language: SQL (Structured Query Language) (sql)
The VACUUM statement with an INTO clause keeps the original database file unchanged and creates a new database with the file name specified. The new database will contain the same logical content as the original database, but fully vacuumed.

The filename in the INTO clause can be any SQL expression that evaluates to a string. It must be a path to a file that does not exist or to an empty file, or the VACUUM INTO command will result in an error.

The VACUUM command is very useful for generating backup copies of a live database. It is transactional safe, which the generated database is a consistent snapshot of the original database. However, if a unplanned shutdown or power lose interupts the command, the generated database might be corrupted.

The following statement uses the VACUUM INTO command to generate a new database with the file name chinook_backup.db whose data is copied from of the main schema of the chinook database:

VACUUM main INTO 'c:\sqlite\db\chinook_backup.db';
Code language: JavaScript (javascript)
In this tutorial, you have learned why you need to use the SQLite VACUUM command and how to run it to optimize the database.

CREATE TABLE favorites(
	UserId INTEGER,
	PlaylistId INTEGER,
	FOREIGN KEY(UserId) REFERENCES users(UserId),
	FOREIGN KEY(PlaylistId) REFERENCES playlists(PlaylistId)
);

INSERT INTO users(FirstName, LastName, Email, Phone)
VALUES('John','Doe','john.doe@example.com','408-234-3456');

INSERT INTO favorites(UserId, PlaylistId)
VALUES(1,1);
```

The following statement returns data from the users table:

```console
sqlite> SELECT * FROM users;
UserId  FirstName  LastName  Email                 Phone       
------  ---------  --------  --------------------  ------------
1       John       Doe       john.doe@example.com  408-234-3456
sqlite> 
```

And the following statement returns the data from the favorites table:

```console
sqlite> SELECT * FROM favorites;
UserId  PlaylistId
------  ----------
1       1         
sqlite> 
```

Suppose, you want to drop the column phone of the users table.

First, disable the foreign key constraint check:

```SQL
PRAGMA foreign_keys=off;
```

Second, start a new transaction:

```SQL
BEGIN TRANSACTION;
```

Third, create a new table to hold data of the users table except for the phone column:

```SQL
CREATE TABLE IF NOT EXISTS persons (
	UserId INTEGER PRIMARY KEY,
	FirstName TEXT NOT NULL,
	LastName TEXT NOT NULL,
	Email TEXT NOT NULL
);
```

Fourth, copy data from the users to persons table:

```SQL
INSERT INTO persons(UserId, FirstName, LastName, Email)
SELECT UserId, FirstName, LastName, Email 
FROM users;
```

Fifth, drop the users table:

```SQL
DROP TABLE users;
```

Sixth, rename the persons table to users table:

```SQL
ALTER TABLE persons RENAME TO users;
```

Seventh, commit the transaction:

```SQL
COMMIT;
```

Eighth, enable the foreign key constraint check:

```SQL
PRAGMA foreign_keys=on;
```

Here is the users table after dropping the phone column:

```SQL
SELECT * FROM users;
```

#### Rename column – learn step by step how to rename a column of a table.

##### Introduction to SQLite ALTER TABLE RENAME COLUMN statement
SQLite added support for renaming column since version 3.25.0 using the ALTER TABLE statement with the following syntax:

```SQL
ALTER TABLE table_name
RENAME COLUMN current_name TO new_name;
```

In this syntax:

+ First, specify the name of the table after the ALTER TABLE keywords.
+ Second, specify the name of the column that you want to rename after the RENAME COLUMN keywords and the new name after the TO keyword.

##### SQLite ALTER TABLE RENAME COLUMN example
Let’s take an example of using the ALTER TABLE RENAME COLUMN statement.

First, create a new table called Locations:

```SQL
CREATE TABLE Locations(
	LocationId INTEGER PRIMARY KEY,
	Address TEXT NOT NULL,
	City TEXT NOT NULL,
	State TEXT NOT NULL,
	Country TEXT NOT NULL
);
```

Second, insert a new row into the Locations table by using the INSERT statement:

```SQL
INSERT INTO Locations(Address,City,State,Country)
VALUES('3960 North 1st Street','San Jose','CA','USA');
```

Third, rename the column Address to Street by using the ALTER TABLE RENAME COLUMN statement:

```SQL
ALTER TABLE Locations
RENAME COLUMN Address TO Street;
```

Fourth, query data from the Locations table:

```SQL
SELET * FROM Locations;
```

Finally, show the schema of the Locations table:

```SQL
.schema Locations
```

##### The old way to rename column
SQLite did not support the ALTER TABLE RENAME COLUMN syntax before version 3.25.0.

If you’re using the SQLite with the version lower than 3.25.0 and could not upgrade, then you should follow these steps to rename a column:

+ First, start a transaction.VACUUM with an INTO clause
Here is syntax of the VACUUM with INTO clause:

VACUUM schema-name INTO filename;
Code language: SQL (Structured Query Language) (sql)
The VACUUM statement with an INTO clause keeps the original database file unchanged and creates a new database with the file name specified. The new database will contain the same logical content as the original database, but fully vacuumed.

The filename in the INTO clause can be any SQL expression that evaluates to a string. It must be a path to a file that does not exist or to an empty file, or the VACUUM INTO command will result in an error.

The VACUUM command is very useful for generating backup copies of a live database. It is transactional safe, which the generated database is a consistent snapshot of the original database. However, if a unplanned shutdown or power lose interupts the command, the generated database might be corrupted.

The following statement uses the VACUUM INTO command to generate a new database with the file name chinook_backup.db whose data is copied from of the main schema of the chinook database:

VACUUM main INTO 'c:\sqlite\db\chinook_backup.db';
Code language: JavaScript (javascript)
In this tutorial, you have learned why you need to use the SQLite VACUUM command and how to run it to optimize the database.

+ Second, create a new table whose structure is the same as the original one except for the column that you want to rename.

+ Third, copy data from the original table to the new table.

+ Fourth, drop the original table.

+ Fifth, rename the new table to the original table.

+ Finally, commit the transaction.

###### Renaming column example

The following statement recreates the Locations table:

```SQL
DROP TABLE IF EXISTS Locations;
CREATE TABLE Locations(
	LocationId INTEGER PRIMARY KEY,
	Address TEXT NOT NULL,
	State TEXT NOT NULL,
	City TEXT NOT NULL,
	Country TEXT NOT NULL
);
```

And this INSERT statement inserts a new row into the Locations table:

```SQL
INSERT INTO Locations(Address,City,State,Country)
VALUES('3960 North 1st Street','San Jose','CA','USA');
```

Suppose that you want to the change the column Address to Street.

First, start a new transaction:

```SQL
BEGIN TRANSACTION;
```

Second, create a new table called LocationsTemp with the same structure as the Locations table except for the Address column:

```SQL
CREATE TABLE LocationsTemp(
	LocationId INTEGER PRIMARY KEY,
	Street TEXT NOT NULL,
	City TEXT NOT NULL,
	State TEXT NOT NULL,
	Country TEXT NOT NULL
);
```

Third, copy data from the table Locations to LocationsTemp:

```SQL
INSERT INTO LocationsTemp(Street,City,State,Country)
SELECT Address,City,State,Country
FROM Locations;
```

Fourth, drop the Locations table:

```SQL
DROP TABLE Locations;
```

Fifth, rename the table LocationsTemp to Locations:

```SQL
ALTER TABLE LocationsTemp 
RENAME TO Locations;
```

Finally, commit the transaction:

```SQL
COMMIT;
```

If you query the Locations table, you will see that the column Address has been renamed to Street:

```SQL
sqlite> SELECT * FROM Locations;
LocationId  Street                 City      State  Country
----------  ---------------------  --------  -----  -------
1           3960 North 1st Street  San Jose  CA     USA    
sqlite> 
```

#### Drop Table – guide you on how to remove a table from the database.

##### Introduction to SQLite DROP TABLE statement
To remove a table in a database, you use SQLite DROP TABLE statement. The statement is simple as follows:

```SQL
DROP TABLE [IF EXISTS] [schema_name.]table_name;
```

In this syntax, you specify the name of the table which you want to remove after the DROP TABLE keywords.

SQLite allows you to drop only one table at a time. To remove multiple tables, you need to issue multiple DROP TABLE statements.

If you remove a non-existing table, SQLite issues an error. If you use IF EXISTS option, then SQLite removes the table only if the table exists, otherwise, it just ignores the statement and does nothing.

If you want to remove a table in a specific database, you use the [schema_name.] explicitly.

In case the table has dependent objects such as triggers and indexes, the DROP TABLE statement also removes all the dependent objects.

The DROP TABLE statement performs an implicit DELETE statement before dropping the table. However, the DROP TABLE statement removes the triggers associated with the table before performing the implicit DELETE statement, therefore, the delete triggers will not fire.

If the foreign key constraints enabled and you perform the DROP TABLE statement, before SQLite performs the implicit DELETE statement, it carries the foreign key constraints check. If a foreign key constraint violation occurs, SQLite issues an error message and will not drop the table.

**Notice** that the DROP TABLE statement deletes the table from the database and the file on disk completely. You will not be able to undo or recover from this action. Therefore, you should perform the DROP TABLE statement with extra caution.

##### SQLite DROP TABLE statement examples
For the demonstration purpose, we will create two tables: people and addresses. Each person has one address. And one address can be shared by multiple people.

First, create the tables:

```SQL
CREATE TABLE IF NOT EXISTS people (
   person_id INTEGER PRIMARY KEY,
   first_name TEXT,
   last_name TEXT,
   address_id INTEGER,
   FOREIGN KEY (address_id) 
      REFERENCES addresses (address_id)
);

CREATE TABLE IF NOT EXISTS addresses (
   address_id INTEGER PRIMARY KEY,
   house_no TEXT,
   street TEXT,
   city TEXT,
   postal_code TEXT,
   country TEXT
);
```

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/12/SQLite-DROP-TABLE-example.png)

Second, insert an address and a person into the addresses and people tables.

```SQL
INSERT INTO addresses ( house_no, street, city, postal_code, country ) 
VALUES ( '3960', 'North 1st Street', 'San Jose ', '95134', 'USA ' ); 
INSERT INTO people ( first_name, last_name, address_id ) 
VALUES ('John', 'Doe', 1);
```

Third, use the DROP TABLE statement to remove the addresses table.

```SQL
DROP TABLE addresses;
```

SQLite issued an error message:

```
constraint failed
```

Because this action violates the foreign key constraint.

To remove the addresses table, you have to:

+ Disable foreign key constraints.
+ Drop the addresses table.
+ Update the address_id in the people table to NULL values.
+ Enable the foreign key constraints.

See the following statements:

```SQL
PRAGMA foreign_keys = OFF;

DROP TABLE addresses;

UPDATE people
SET address_id = NULL;

PRAGMA foreign_keys = ON;
```

The addresses table is removed and values of the address_id column are updated to NULL values.

#### VACUUM – show you how to optimize database files.
##### Why do you need SQLite VACUUM command
First, when you drop database objects such as tables, views, indexes, and triggers or delete data from tables, the database file size remains unchanged. Because SQLite just marks the deleted objects as free and reserves it for the future uses. As a result, the size of the database file always grows in size.

Second, when you insert or delete data from the tables, the indexes and tables become fragmented, especially for the database that has a high number of inserts, updates, and deletes.

Third, the insert, update and delete operations create unused data block within individual database pages. It decreases the number of rows that can be stored in a single page. Therefore, it increases the number of pages to hold a table. Because of this, it increases storage overhead for the table, takes more time to read/write, and decreases the cache performance.

![](https://cdn.sqlitetutorial.net/wp-content/uploads/2015/12/SQLite-VACUUM.jpg)

SQLite provides the VACUUM command to address all three issues above.

SQLite first copies data within a database file to a temporary database. This operation defragments the database objects, ignores the free spaces, and repacks individual pages. Then, SQLite copies the content of the temporary database file back to the original database file. The original database file is overwritten.

Because the VACUUM command rebuilds the database, you can use it to change some database-specific configuration parameters such as page size, page format, and default encoding. To do this, you set new values using pragma and then vacuum the database.

##### The SQLite VACUUM command
The VACUUM command does not change the content of the database except the rowid values. If you use INTEGER PRIMARY KEY column, the VACUUM does not change the values of that column. However, if you use unaliased rowid, the VACUUM command will reset the rowid values. Besides changing the rowid values, the VACUUM command also builds the index from scratch.

It is a good practice to perform the VACUUM command periodically, especially when you delete large tables or indexes from a database.

It is important to note that the VACCUM command requires storage to hold the original file and also the copy. Also, the VACUUM command requires exclusive access to the database file. In other words, the VACUUM command will not run successfully if the database has a pending SQL statement or an open transaction.

Currently, as of version 3.9.2, you can run the VACUUM command on the main database, not the attached database file.

Even though SQLite enables the auto-vacuum mode that triggers the vacuum process automatically with some limitations. It is a good practice to run the VACUUM command manually.

##### How to run the SQLite VACUUM command
The following shows how to run the VACUUM command:

```SQL
VACUUM;
```

Make sure that there is no open transaction while you’re running the command.

The following statement enables full auto-vacuum mode:

```SQL
PRAGMA auto_vacuum = FULL;
```

To enable incremental vacuum, you use the following statement:

```SQL
PRAGMA auto_vacuum = INCREMENTAL;
```

The following statement disables auto-vacuum mode:

```SQL
PRAGMA auto_vacuum = NONE;
```

##### VACUUM with an INTO clause
Here is syntax of the VACUUM with INTO clause:

```SQL
VACUUM schema-name INTO filename;
```

The VACUUM statement with an INTO clause keeps the original database file unchanged and creates a new database with the file name specified. The new database will contain the same logical content as the original database, but fully vacuumed.

The filename in the INTO clause can be any SQL expression that evaluates to a string. It must be a path to a file that does not exist or to an empty file, or the VACUUM INTO command will result in an error.

The VACUUM command is very useful for generating backup copies of a live database. It is transactional safe, which the generated database is a consistent snapshot of the original database. However, if a unplanned shutdown or power lose interupts the command, the generated database might be corrupted.

The following statement uses the VACUUM INTO command to generate a new database with the file name chinook_backup.db whose data is copied from of the main schema of the chinook database:

```SQL
VACUUM main INTO 'c:\sqlite\db\chinook_backup.db';
```

In this tutorial, you have learned why you need to use the SQLite VACUUM command and how to run it to optimize the database.

### Section 12. Constraints
#### Primary Key – show you how to define the primary key for a table.
##### Introduction to SQLite primary key
A primary key is a column or group of columns used to identify the uniqueness of rows in a table. Each table has one and only one primary key.

SQLite allows you to define primary key in two ways:

First, if the primary key has only one column, you use the PRIMARY KEY column constraint to define the primary key as follows:

```SQL
CREATE TABLE table_name(
   column_1 INTEGER NOT NULL PRIMARY KEY,
   ...
);
```

Second, in case primary key consists of two or more columns, you use the PRIMARY KEY table constraint to define the primary as shown in the following statement.

```SQL
CREATE TABLE table_name(
   column_1 INTEGER NOT NULL,
   column_2 INTEGER NOT NULL,
   ...
   PRIMARY KEY(column_1,column_2,...)
);
```

In SQL standard, the primary key column must not contain NULL values. It means that the primary key column has an implicit NOT NULL constraint.

However, to make the current version of SQLite compatible with the earlier version, SQLite allows the primary key column to contain NULL values.

##### SQLite primary key and rowid table
When you create a table without specifying the WITHOUT ROWID option, SQLite adds an implicit column called rowid that stores 64-bit signed integer. The rowid column is a key that uniquely identifies the rows in the table. Tables that have rowid columns are called rowid tables.

If a table has the primary key that consists of one column, and that column is defined as INTEGER then this primary key column becomes an alias for the rowid column.

Notice that if you assign another integer type such as BIGINT and UNSIGNED INT to the primary key column, this column will not be an alias for the rowid column.

Because the rowid table organizes its data as a B-tree, querying and sorting data of a rowid table are very fast. It is faster than using a primary key which is not an alias of the rowid.

Another important note is that if you declare a column with the INTEGER type and PRIMARY KEY DESC clause, this column will not become an alias for the rowid column:

```SQL
CREATE TABLE table(
   pk INTEGER PRIMARY KEY DESC,
   ...
);
```

##### Creating SQLite primary key examples
The following statement creates a table named countries which has country_id column as the primary key.

```SQL
CREATE TABLE countries (
   country_id INTEGER PRIMARY KEY,
   name TEXT NOT NULL
);
```

Because the primary key of the countries table has only one column, we defined the primary key using PRIMARY KEY column constraint.

It is possible to use the PRIMARY KEY table constraint to define the primary key that consists of one column as shown in the following statement:

```SQL
CREATE TABLE languages (
   language_id INTEGER,
   name TEXT NOT NULL,
   PRIMARY KEY (language_id)
);
```

However, for tables that the primary keys consist of more than one column, you must use PRIMARY KEY table constraint to define primary keys.

The following statement creates the country_languages table whose primary key consists of two columns.

```SQL
CREATE TABLE country_languages (
	country_id INTEGER NOT NULL,
	language_id INTEGER NOT NULL,
	PRIMARY KEY (country_id, language_id),
	FOREIGN KEY (country_id) REFERENCES countries (country_id) 
            ON DELETE CASCADE ON UPDATE NO ACTION,
	FOREIGN KEY (language_id) REFERENCES languages (language_id) 
            ON DELETE CASCADE ON UPDATE NO ACTION
);
```

##### Adding SQLite primary key example
Unlike other database systems e.g., MySQL and PostgreSQL, you cannot use the ALTER TABLE statement to add a primary key to an existing table.

You need to follow these steps to work around the limitation:

+ First, set the foreign key constarint check off.
+ Next, rename the table to another table name (old_table)
+ Then, create a new table (table) with exact structure of the table that you have been renamed.
+ After that, copy data from the old_table to the table.
+ Finally, turn on the foreign key constraint check on

See the following statements:

```SQL
PRAGMA foreign_keys=off;

BEGIN TRANSACTION;

ALTER TABLE table RENAME TO old_table;

-- define the primary key constraint here
CREATE TABLE table ( ... );

INSERT INTO table SELECT * FROM old_table;

COMMIT;

PRAGMA foreign_keys=on;
```

The BEGIN TRANSACTION starts a new transaction. It ensures that all subsequent statements execute successfully or nothing executes at all.

The COMMIT statement commits all the statements.

Let’s create a table name cities without a primary key.

```SQL
CREATE TABLE cities (
   id INTEGER NOT NULL,
   name text NOT NULL
);

INSERT INTO cities (id, name)
VALUES(1, 'San Jose');
```

In order to add the primary key to the cities table, you perform the following steps:

```SQL
PRAGMA foreign_keys=off;

BEGIN TRANSACTION;

ALTER TABLE cities RENAME TO old_cities;

CREATE TABLE cities (
   id INTEGER NOT NULL PRIMARY KEY,
   name TEXT NOT NULL
);

INSERT INTO cities 
SELECT * FROM old_cities;

DROP TABLE old_cities;

COMMIT;

PRAGMA foreign_keys=on;
```

If you use SQLite GUI tool, you can use the following statement to show the table’s information.

```SQL
PRAGMA table_info([cities]);
```

#### NOT NULL constraint – learn how to enforce values in a column are not NULL.

##### Introduction to SQLite NOT NULL constraint
When you create a table, you can specify whether a column acceptsNULL values or not. By default, all columns in a table accept NULL values except you explicitly use NOT NULL constraints.

To define a NOT NULL constraint for a column, you use the following syntax:

```SQL
CREATE TABLE table_name (
    ...,
    column_name type_name NOT NULL,
    ...
);
```

Unlike other constraints such as PRIMARY KEY and CHECK, you can only define NOT NULL constraints at the column level, not the table level.

Based on the SQL standard, PRIMARY KEY should always imply NOT NULL. However, SQLite allows NULL values in the PRIMARY KEY column except that a column is INTEGER PRIMARY KEY column or the table is a WITHOUT ROWID table or the column is defined as a NOT NULL column.

This is due to a bug in some early versions. If this bug is fixed to conform with the SQL standard, then it might break the legacy systems. Therefore, it has been decided to allow NULL values in the  PRIMARY KEY column.

Once a NOT NULL constraint is attached to a column, any attempt to set the column value to NULL such as inserting or updating will cause a constraint violation.

##### SQLite NOT NULL constraint example
The following example creates a new table named suppliers:

```SQL
CREATE TABLE suppliers(
    supplier_id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);
```

In this example, the supplier_id is the PRIMARY KEY column of the suppliers table. Because this column is declared as INTEGER PRIMARY KEY, it will not accept NULL values.

The name column is also declared with a NOT NULL constraint, so it will accept only non-NULL values.

The following statement attempt to insert a NULL into the name column of the suppliers table:

```SQL
INSERT INTO suppliers(name)
VALUES(NULL);
```

The statement fails due to the NOT NULL constraint violation. Here is the error message:

```SQL
SQL Error [19]: [SQLITE_CONSTRAINT]  Abort due to constraint violation (NOT NULL constraint failed: suppliers.name)
```

#### UNIQUE constraint – ensure values in a column or a group of columns are unique.

##### Introduction to SQLite UNIQUE constraint
A UNIQUE constraint ensures all values in a column or a group of columns are distinct from one another or unique.

To define a UNIQUE constraint, you use the UNIQUE keyword followed by one or more columns.

You can define a UNIQUE constraint at the column or the table level. Only at the table level, you can define a UNIQUE constraint across multiple columns.

The following shows how to define a UNIQUE constraint for a column at the column level:

```SQL
CREATE TABLE table_name(
    ...,
    column_name type UNIQUE,
    ...
);
```

Or at the table level:

```SQL
CREATE TABLE table_name(
    ...,
    UNIQUE(column_name)
);
```

The following illustrates how to define a UNIQUE constraint for multiple columns:

```SQL
CREATE TABLE table_name(
    ...,
    UNIQUE(column_name1,column_name2,...)
);
```

Once a UNIQUE constraint is defined, if you attempt to insert or update a value that already exists in the column, SQLite will issue an error and abort the operation.

##### SQLite UNIQUE constraint examples
Let’s take some examples of using the UNIQUE constraint.

###### Defining a UNIQUE constraint for one column example
The following statement creates a new table named contacts with a UNIQUE constraint defined for the email column:

```SQL
CREATE TABLE contacts(
    contact_id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    email TEXT NOT NULL UNIQUE
);
```

The following example inserts a new row into the contacts table:

```SQL
INSERT INTO contacts(first_name,last_name,email)
VALUES ('John','Doe','john.doe@gmail.com');
```

If you attempt to insert a new contact with the same email, you will get an error message:

```SQL
INSERT INTO contacts(first_name,last_name,email)
VALUES ('Johnny','Doe','john.doe@gmail.com');
```

Here is the error message:

```SQL
Error while executing SQL query on database 'chinook': UNIQUE constraint failed: contacts.email
```

###### Defining a UNIQUE constraint for multiple columns example
The following statement creates the shapes table with a UNIQUE constraint defined for the background_color and foreground_color columns:

```SQL
CREATE TABLE shapes(
    shape_id INTEGER PRIMARY KEY,
    background_color TEXT,
    foreground_color TEXT,
    UNIQUE(background_color,foreground_color)
);
```

The following statement inserts a new row into the shapes table:

```SQL
INSERT INTO shapes(background_color,foreground_color)
VALUES('red','green');
```

The following statement works because of no duplication violation in both background_color and foreground_color columns:

```SQL
INSERT INTO shapes(background_color,foreground_color)
VALUES('red','blue');
```

However, the following statement causes an error due to the duplicates in both background_color and foreground_color columns:

```SQL
INSERT INTO shapes(background_color,foreground_color)
VALUES('red','green');
```

Here is the error:

```SQL
Error while executing SQL query on database 'chinook': `UNIQUE` constraint failed: shapes.background_color, shapes.foreground_color
```

##### SQLite UNIQUE constraint and NULL
SQLite treats all NULL values are different, therefore, a column with a UNIQUE constraint can have multiple NULL values.

The following statement creates a new table named lists whose email column has a UNIQUE constraint:

```SQL
CREATE TABLE lists(
    list_id INTEGER PRIMARY KEY,
    email TEXT UNIQUE
);
```

The following statement inserts multiple NULL values into the email column of the lists table:

```SQL
INSERT INTO lists(email)
VALUES(NULL),(NULL);
```

Let’s query data from the lists table:

```SQL
SELECT * FROM lists;
```

As you can see, even though the email column has a UNIQUE constraint, it can accept multiple NULL values.

#### CHECK constraint – ensure the values in a column meet a specified condition defined by an expression.

##### Introduction to SQLite CHECK constraints
SQLite CHECK constraints allow you to define expressions to test values whenever they are inserted into or updated within a column.

If the values do not meet the criteria defined by the expression, SQLite will issue a constraint violation and abort the statement.

The CHECK constraints allow you to define additional data integrity checks beyond UNIQUE or NOT NULL to suit your specific application.

SQLite allows you to define a CHECK constraint at the column level or the table level.

The following statement shows how to define a CHECK constraint at the column level:

```SQL
CREATE TABLE table_name(
    ...,
    column_name data_type CHECK(expression),
    ...
);
```

and the following statement illustrates how to define a CHECK constraint at the table level:

```SQL
CREATE TABLE table_name(
    ...,
    CHECK(expression)
);
```

In this syntax, whenever a row is inserted into a table or an existing row is updated, the expression associated with each CHECK constraint is evaluated and returned a numeric value 0 or 1.

If the result is zero, then a constraint violation occurred. If the result is a non-zero value or NULL, it means no constraint violation occurred.

Note that the expression of a CHECK constraint cannot contain a subquery.

##### SQLite CHECK constraint examples
Let’s take some examples of using the CHECK constraints.

1) Using SQLite CHECK constraint at the column level example
The following statement creates a new table named contacts:

```SQL
CREATE TABLE contacts (
    contact_id INTEGER PRIMARY KEY,
    first_name TEXT    NOT NULL,
    last_name  TEXT    NOT NULL,
    email      TEXT,
    phone      TEXT    NOT NULL
                    CHECK (length(phone) >= 10) 
);
```

In the contacts table, the phone column has a CHECK constraint:

```SQL
CHECK (length(phone) >= 10)
```

This CHECK constraint ensures that the values in the phone column must be at least 10 characters.

If you attempt to execute the following statement, you will get a constraint violation error:

```SQL
INSERT INTO contacts(first_name, last_name, phone)
VALUES('John','Doe','408123456');
```

Here is the error message:

```SQL
Result: CHECK constraint failed: contacts
```

The reason was that the phone number that you attempted to insert just has 9 characters while it requires at least 10 characters.

The following statement should work because the value in the phone column has 13 characters, which satisfies the expression in the CHECK constraint:

```SQL
INSERT INTO contacts(first_name, last_name, phone)
VALUES('John','Doe','(408)-123-456');
```

2) Using SQLite CHECK constraints at the table level example
The following statement creates a new table named products:

```SQL
CREATE TABLE products (
    product_id   INTEGER         PRIMARY KEY,
    product_name TEXT            NOT NULL,
    list_price   DECIMAL (10, 2) NOT NULL,
    discount     DECIMAL (10, 2) NOT NULL
                                DEFAULT 0,
    CHECK (list_price >= discount AND 
        discount >= 0 AND 
        list_price >= 0) 
);
```

In this example, the CHECK constraint is defined at the table level:

```SQL
CHECK (list_price >= discount AND 
            discount >= 0 AND 
            list_price >= 0)
```

The CHECK constraint ensures that list price is always greater or equal to discount and both discount and list price are greater or equal to zero.

The following statement violates the CHECK constraint because the discount is higher than the list price.

```SQL
INSERT INTO products(product_name, list_price, discount)
VALUES('New Product',900,1000);
```

The following statement also violates the CHECK constraint because the discount is negative:

```SQL
INSERT INTO products(product_name, list_price, discount)
VALUES('New XFactor',1000,-10);
```

##### Adding CHECK constraints to an existing table
As of version 3.25.2, SQLite does not support adding a CHECK constraint to an existing table.

However, you can follow these steps:

First, create a new table whose structure is the same as the table that you want to add a CHECK constraint. The new table should also include the CHECK constraint:

```SQL
CREATE TABLE new_table (
    [...],
    CHECK ([...])
);
```

To get the structure of the old table, you can use the .schema command. Check out the SQLite DESCRIBE table tutorial for more information.

Second, copy data from the old table to the new table.

```SQL
INSERT INTO new_table SELECT * FROM old_table;
```

Third, drop the old table:

```SQL
DROP TABLE old_table;
```

Fourth, rename the new table to the old one:

```SQL
ALTER TABLE new_table RENAME TO old_table;
```

To make all statements above transaction-safe, you should execute all of them within a transaction like this:

```SQL
BEGIN;
-- create a new table 
CREATE TABLE new_table (
    [...],
    CHECK ([...])
);
-- copy data from old table to the new one
INSERT INTO new_table SELECT * FROM old_table;

-- drop the old table
DROP TABLE old_table;

-- rename new table to the old one
ALTER TABLE new_table RENAME TO old_table;

-- commit changes
COMMIT;
```

#### AUTOINCREMENT – explain how the AUTOINCREMENT column attribute works and why you should avoid using it.
##### Introduction to SQLite ROWID table
Whenever you create a table without specifying the WITHOUT ROWID option, you get an implicit auto-increment column called rowid. The rowid column store 64-bit signed integer that uniquely identifies a row in the table.

Let’s see the following example.

First, create a new table named people that has two columns: first_name,  and last_name:

```SQL
CREATE TABLE people (
   first_name TEXT NOT NULL,
   last_name TEXT NOT NULL
);
```

Second, insert a row into the people table using the following INSERT statement:

```SQL
INSERT INTO people (first_name, last_name)
VALUES('John', 'Doe');
```

Third, query data from the people table using the following SELECT statement:

```SQL
SELECT
   rowid,
   first_name,
   last_name
FROM
   people;
```

As you can see clearly from the output, SQLite implicitly creates a column named rowid and automatically assigns an integer value whenever you insert a new row into the table.

Note that you can also refer to the rowid column using its aliases: \_rowid\_ and oid.

When you create a table that has an INTEGER PRIMARY KEY column, this column is the alias of the rowid column.

The following statement drops table people and recreates it. This time, however, we add another column named person_id whose data type is INTEGER and column constraint is PRIMARY KEY:

```SQL
DROP TABLE people;

CREATE TABLE people (
   person_id INTEGER PRIMARY KEY,
   first_name TEXT NOT NULL,
   last_name TEXT NOT NULL
);
```

In this case, the person_id column is actually the rowid column.

How does SQLite assign an integer value to the rowid column?

If you don’t specify the rowid value or you use a NULL value when you insert a new row, SQLite automatically assigns the next sequential integer, which is one larger than the largest rowid in the table. The rowid value starts at 1.

The maximum value of  therowid column is 9,223,372,036,854,775,807, which is very big. If your data reaches this maximum value and you attempt to insert a new row, SQLite will find an unused integer and uses it. If SQLite cannot find any unused integer, it will issue an SQLITE_FULL error. On top of that, if you delete some rows and insert a new row, SQLite will try to reuse the rowid values from the deleted rows.

Let’s take a test on it.

First, insert a row with the maximum value into the people table.

```SQL
INSERT INTO people (person_id,first_name,last_name)
VALUES(	9223372036854775807,'Johnathan','Smith');
```

Second, insert another row without specifying a value for the person_id column:

```SQL
INSERT INTO people (first_name,last_name)
VALUES('William','Gate');
```

As clearly shown in the output, the new row received an unused integer.

Consider another example.

First, create a new table named t1 that has one column:

```SQL
CREATE TABLE t1(c text);
```

Second, insert some rows into the t1 table:

```SQL
INSERT INTO t1(c) VALUES('A');
INSERT INTO t1(c) values('B');
INSERT INTO t1(c) values('C');
INSERT INTO t1(c) values('D');
```

Third, query data from the t1 table:

```SQL
SELECT rowid, c FROM t1;
```

Fourth, delete all rows of the t1 table:

```SQL
DELETE FROM t1;
```

Fifth, insert some rows into the t1 table:

```SQL
INSERT INTO t1(c) values('E');
INSERT INTO t1(c) values('F');
INSERT INTO t1(c) values('G');
```

Finally, query data from the t1 table:

```SQL
SELECT rowid, c FROM t1;
```

As you can see, the rowid 1, 2 and 3 have been reused for the new rows.

##### SQLite AUTOINCREMENT column attribute
SQLite recommends that you should not use AUTOINCREMENT attribute because:

The AUTOINCREMENT keyword imposes extra CPU, memory, disk space, and disk I/O overhead and should be avoided if not strictly needed. It is usually not needed.

In addition, the way SQLite assigns a value for the AUTOINCREMENT column slightly different from the way it does for the rowid column.

Consider the following example.

First, drop and recreate the people table. This time, we use AUTOINCREMENT attribute column:

```SQL
DROP TABLE people;

CREATE TABLE people (
   person_id INTEGER PRIMARY KEY AUTOINCREMENT,
   first_name text NOT NULL,
   last_name text NOT NULL
);
```

Second, insert a row with the maximum rowid value into the people table.

```SQL
INSERT INTO people (person_id,first_name,last_name)
VALUES(9223372036854775807,'Johnathan','Smith');
```

Third, insert another row into the people table.

```SQL
INSERT INTO people (first_name,last_name)
VALUES('John','Smith');
```

This time, SQLite issued an error message because the person_id column did not reuse the number like a rowid column.

```SQL
[Err] 13 - database or disk is full
```

When should you use the AUTOINCREMENT column attribute?

The main purpose of using attribute AUTOINCREMENT is to prevent SQLite to reuse a value that has not been used or a value from the previously deleted row.

If you don’t have any requirement like this, you should not use the AUTOINCREMENT attribute in the primary key.

### Section 13. Views
#### Create View – introduce you to the view concept and show you how to create a new view in the database.
##### What is a view
In database theory, a view is a result set of a stored query. A view is the way to pack a query into a named object stored in the database.

You can access the data of the underlying tables through a view. The tables that the query in the view definition refers to are called base tables.

A view is useful in some cases:

+ First, views provide an abstraction layer over tables. You can add and remove the columns in the view without touching the schema of the underlying tables.
+ Second, you can use views to encapsulate complex queries with joins to simplify the data access.

SQLite view is read only. It means you cannot use INSERT, DELETE, and  UPDATE statements to update data in the base tables through the view.

##### SQLite CREATE VIEW statement
To create a view, you use the CREATE VIEW statement as follows:

```SQL
CREATE [TEMP] VIEW [IF NOT EXISTS] view_name[(column-name-list)]
AS 
   select-statement;
```

First, specify a name for the view. The IF NOT EXISTS option only creates a new view if it doesn’t exist. If the view already exists, it does nothing.

Second, use the the TEMP or TEMPORARY option if you want the view to be only visible in the current database connection. The view is called a temporary view and SQLite automatically removes the temporary view whenever the database connection is closed.

Third, specify a  SELECT statement for the view. By default, the columns of the view derive from the result set of the SELECT statement. However, you can assign the names of the view columns that are different from the column name of the table

##### SQLite CREATE VIEW examples
Let’s take some examples of creating a new view using the CREATE VIEW statement.

1) Creating a view to simplify a complex query
The following query gets data from the tracks, albums, media_types and genres tables in the sample database using the inner join clause.

```SQL
SELECT
   trackid,
   tracks.name,
   albums.Title AS album,
   media_types.Name AS media,
   genres.Name AS genres
FROM
   tracks
INNER JOIN albums ON Albums.AlbumId = tracks.AlbumId
INNER JOIN media_types ON media_types.MediaTypeId = tracks.MediaTypeId
INNER JOIN genres ON genres.GenreId = tracks.GenreId;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617717167/SQLite/MySQL-CREATE-VIEW-example_d5c4px.jpg)

To create a view based on this query, you use the following statement:

```SQL
CREATE VIEW v_tracks 
AS 
SELECT
	trackid,
	tracks.name,
	albums.Title AS album,
	media_types.Name AS media,
	genres.Name AS genres
FROM
	tracks
INNER JOIN albums ON Albums.AlbumId = tracks.AlbumId
INNER JOIN media_types ON media_types.MediaTypeId = tracks.MediaTypeId
INNER JOIN genres ON genres.GenreId = tracks.GenreId;
```

From now on, you can use the following simple query instead of the complex one above.

```SQL
SELECT * FROM v_tracks;
```

2) Creating a view with custom column names
The following statement creates a view named v_albums that contains album title and the length of album in minutes:

```SQL
CREATE VIEW v_albums (
    AlbumTitle,
    Minutes
)
AS
    SELECT albums.title,
           SUM(milliseconds) / 60000
      FROM tracks
           INNER JOIN
           albums USING (
               AlbumId
           )
     GROUP BY AlbumTitle;
```

In this example, we specified new columns for the view AlbumTitle for the albums.title column and Minutes for the expression SUM(milliseconds) / 60000

This query returns data from the v_albums view:

```SQL
SELECT * FROM v_albums;
```

#### Drop View – show you how to drop a view from its database schema.
##### Introduction to SQLite DROP VIEW statement
The DROP VIEW statement deletes a view from the database schema. Here is the basic syntax of the DROP VIEW statement:

```SQL
DROP VIEW [IF EXISTS] [schema_name.]view_name;
```

In this syntax:

+ First, specify the name of the view that you wants to remove after the DROP VIEW keywords.

+ Second, specify the schema of the view that you want to delete.

+ Third, use the IF EXISTS option to remove a view only if it exists. If the view does not exist, the DROP VIEW IF EXISTS statement does nothing. However, trying to drop a non-existing view without the IF EXISTS option will result in an error.

**Note** that the DROP VIEW statement only removes the view object from the database schema. It does not remove the data of the base tables.

##### SQLite DROP VIEW statement examples
This statement creates a view that summarizes data from the invoices and invoice_items in the sample database:

```SQL
CREATE VIEW v_billings (
    invoiceid,
    invoicedate,
    total
)
AS
    SELECT invoiceid,
           invoicedate,
           sum(unit_price * quantity) 
      FROM invoices
           INNER JOIN
           invoice_items USING (
               invoice_id
           );
```

To delete the v_billings view, you use the following DROP VIEW statement:

```SQL
DROP VIEW v_billings;
```

This example uses the IF EXISTS option to delete a non-existing view:

```SQL
DROP VIEW IF EXISTS v_xyz;
```

It does not return any error. However, if you don’t use the IF EXISTS option like the following example, you will get an error:

```SQL
DROP VIEW v_xyz;
```

Here is the error message:

```SQL
Error while executing SQL query on database 'chinook': no such view: v_xyz
```

### Section 14. Indexes
#### Index – teach you about the index and how to utilize indexes to speed up your queries.
##### What is an index?
In relational databases, a table is a list of rows. In the same time, each row has the same column structure that consists of cells. Each row also has a consecutive rowid sequence number used to identify the row. Therefore, you can consider a table as a list of pairs: (rowid, row).

Unlike a table, an index has an opposite relationship: (row, rowid). An index is an additional data structure that helps improve the performance of a query.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617717707/SQLite/SQLite-Index_avph9o.png)

SQLite uses B-tree for organizing indexes. Note that B stands for balanced, B-tree is a balanced tree, not a binary tree.

The B-tree keeps the amount of data at both sides of the tree balanced so that the number of levels that must be traversed to locate a row is always in the same approximate number. In addition, querying using equality (=) and ranges (>, >=, <,<=) on the B-tree indexes are very efficient.

##### How does an index work
Each index must be associated with a specific table. An index consists of one or more columns, but all columns of an index must be in the same table. A table may have multiple indexes.

Whenever you create an index, SQLite creates a B-tree structure to hold the index data.

The index contains data from the columns that you specify in the index and the corresponding rowid value. This helps SQLite quickly locate the row based on the values of the indexed columns.

Imagine an index in the database like an index of a book. By looking at the index, you can quickly identify page numbers based on the keywords.

##### SQLite CREATE INDEX statement
To create an index, you use the CREATE INDEX statement with the following syntax:

```SQL
CREATE [UNIQUE] INDEX index_name 
ON table_name(column_list);
```

To create an index, you specify three important information:

+ The name of the index after the CREATE INDEX keywords.
+ The name of the table to the index belongs.
+ A list of columns of the index.

In case you want to make sure that values in one or more columns are unique like email and phone, you use the UNIQUE option in the CREATE INDEX statement. The CREATE UNIQUE INDEX creates a new unique index.

SQLite UNIQUE index example
Let’s create a new table named contacts for demonstration.

```SQL
CREATE TABLE contacts (
	first_name text NOT NULL,
	last_name text NOT NULL,
	email text NOT NULL
);
```

Suppose, you want to enforce that the email is unique, you create a unique index as follows:

```SQL
CREATE UNIQUE INDEX idx_contacts_email 
ON contacts (email);
```

To test this.

First,  insert a row into the contacts table.

```SQL
INSERT INTO contacts (first_name, last_name, email)
VALUES('John','Doe','john.doe@sqlitetutorial.net');
```

Second, insert another row with a duplicate email.

```SQL
INSERT INTO contacts (first_name, last_name, email)
VALUES('Johny','Doe','john.doe@sqlitetutorial.net');
```

SQLite issued an error message indicating that the unique index has been violated. Because when you inserted the second row, SQLite checked and made sure that the email is unique across of rows in email of the contacts table.

Let’s insert two more rows into the contacts table.

```SQL
INSERT INTO contacts (first_name, last_name, email)
VALUES('David','Brown','david.brown@sqlitetutorial.net'),
      ('Lisa','Smith','lisa.smith@sqlitetutorial.net');
```

If you query data from the contacts table based on a specific email, SQLite will use the index to locate the data. See the following statement:

```SQL
SELECT
	first_name,
	last_name,
	email
FROM
	contacts
WHERE
	email = 'lisa.smith@sqlitetutorial.net';
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617718121/SQLite/SQLite-index-example_iwt105.jpg)

To check if SQLite uses the index or not, you use the EXPLAIN QUERY PLAN statement as follows:

```SQL
EXPLAIN QUERY PLAN 
SELECT
	first_name,
	last_name,
	email
FROM
	contacts
WHERE
	email = 'lisa.smith@sqlitetutorial.net';
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617718197/SQLite/SQLite-Index-Explain-example_et20ei.jpg)

##### SQLite multicolumn index example
If you create an index that consists of one column, SQLite uses that column as the sort key. In case you create an index that has multiple columns, SQLite uses the additional columns as the second, third, … as the sort keys.

SQLite sorts the data on the multicolumn index by the first column specified in the CREATE INDEX statement. Then, it sorts the duplicate values by the second column, and so on.

Therefore, the column order is very important when you create a multicolumn index.

To utilize a multicolumn index, the query must contain the condition that has the same column order as defined in the index.

The following statement creates a multicolumn index on the first_name and last_name columns of the contacts table:

```SQL
CREATE INDEX idx_contacts_name 
ON contacts (first_name, last_name);
```

If you query the contacts table with one of the following conditions in the WHERE clause, SQLite will utilize the multicolumn index to search for data.

1) filter data by the first_name column.

```SQL
WHERE
	first_name = 'John';
```

2)filter data by both first_name and last_name columns:

```SQL
WHERE
	first_name = 'John' AND last_name = 'Doe';
```

However, SQLite will not use the multicolumn index if you use one of the following conditions.

1)filter by the last_name column only.

```SQL
WHERE
	last_name = 'Doe';
```

2) filter by first_name OR last_name columns.

```SQL
last_name = 'Doe' OR first_name = 'John';
```

##### SQLite Show Indexes
To find all indexes associated with a table, you use the following command:

```SQL
PRAGMA index_list('table_name');
```

For example, this statement shows all the indexes of the contacts table:

```SQL
PRAGMA index_list('playlist_track');
```

Here is the output:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617718675/SQLite/SQLite-index-show-indexes_bx0g6g.png)

To get the information about the columns in an index, you use the following command:

```SQL
PRAGMA index_info('idx_contacts_name');
```

This example returns the column list of the index idx_contacts_name:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617718757/SQLite/SQLite-index-column-list_ula7vh.png)

Another way to get all indexes from a database is to query from the sqlite_master table:

```SQL
SELECT
   type, 
   name, 
   tbl_name, 
   sql
FROM
   sqlite_master
WHERE
   type= 'index';
```

##### SQLite DROP INDEX statement
To remove an index from a database, you use the DROP INDEX statement as follows:

```SQL
DROP INDEX [IF EXISTS] index_name;
```

In this syntax, you specify the name of the index that you want to drop after the DROP INDEX keywords. The IF EXISTS option removes an index only if it exists.

For example, you use the following statement to remove the idx_contacts_name index:

```SQL
DROP INDEX idx_contacts_name;
```

The idx_contacts_name index is removed completely from the database.

#### Index for Expressions – show you how to use the expression-based index.
##### Introduction to the SQLite expression-based index
When you create an index, you often use one or more columns in a table. Besides the normal indexes, SQLite allows you to form an index based on expressions involved table columns. This kind of index is called an expression based index.

The following query selects the customers whose the length of the company is greater than 10 characters.

```SQL
SELECT customerid,
       company
  FROM customers
 WHERE length(company) > 10
 ORDER BY length(company) DESC;
```

If you use the EXPLAIN QUERY PLAN statement, you will find that SQLite query planner had to scan the whole customers table to return the result set.

```SQL
EXPLAIN QUERY PLAN
SELECT customerid,
       company
  FROM customers
 WHERE length(company) > 10
 ORDER BY length(company) DESC;
```

The SQLite query planner is a software component that determines the best algorithm or query plan to execute an SQL statement. As of SQLite version 3.8.0, the query planner component was rewritten to run faster and generate better query plans. The rewrite is known as the next generation query planner or NGQP.

To create an index based on the expression LENGTH(company), you use the following statement.

```SQL
CREATE INDEX customers_length_company 
ON customers(LENGTH(company));
```

Now if you execute the query above again, SQLite will use the expression index to search to select the data, which is faster.

##### How the SQLite expression-based index work
The SQLite query planner uses the expression-based index only when the expression, which you specified in the CREATE INDEX statement, appears the same as in the WHERE clause or ORDER BY clause.

For example, in the sample database, we have the invoice_items table.

The following statement creates an index using the unit price and quantity columns.

```SQL
CREATE INDEX invoice_line_amount 
ON invoice_items(unitprice*quantity);
```

However, when you run the following query:

```SQL
EXPLAIN QUERY PLAN 
SELECT invoicelineid,
       invoiceid, 
       unitprice*quantity
FROM invoice_items
WHERE quantity*unitprice > 10;
```

The SQLite query planner did not use the index because the expression in the CREATE INDEX ( unitprice\*quantity) is not the same as the one in the WHERE clause (quantity\*unitprice)

##### SQLite expression based index restriction
The following lists all the restrictions on the expression that appears in the CREATE INDEX statement.

1. The expression must refer to the columns of the table that is being indexed only. It cannot refer to the columns of other tables.
2. The expression can only use the deterministic function call.
3. The expression cannot use a subquery.

### Section 15. Triggers
#### Trigger – manage triggers in the SQLite database.
##### What is an SQLite trigger
An SQLite trigger is a named database object that is executed automatically when an INSERT, UPDATE or DELETE statement is issued against the associated table.

##### When do we need SQLite triggers
You often use triggers to enable sophisticated auditing. For example, you want to log the changes in the sensitive data such as salary and address whenever it changes.

In addition, you use triggers to enforce complex business rules centrally at the database level and prevent invalid transactions.

##### SQLite CREATE TRIGGER statement
To create a new trigger in SQLite, you use the CREATE TRIGGER statement as follows:
```SQL
CREATE TRIGGER [IF NOT EXISTS] trigger_name 
   [BEFORE|AFTER|INSTEAD OF] [INSERT|UPDATE|DELETE] 
   ON table_name
   [WHEN condition]
BEGIN
 statements;
END;
```

In this syntax:

+ First,  specify the name of the trigger after the CREATE TRIGGER keywords.
+ Next, determine when the trigger is fired such as BEFORE, AFTER, or INSTEAD OF. You can create BEFORE and AFTER triggers on a table. However, you can only create an INSTEAD OF trigger on a view.
+ Then, specify the event that causes the trigger to be invoked such as INSERT, UPDATE, or DELETE.
+ After that, indicate the table to which the trigger belongs.
+ Finally, place the trigger logic in the BEGIN END block, which can be any valid SQL statements.

If you combine the time when the trigger is fired and the event that causes the trigger to be fired, you have a total of 9 possibilities:

+ BEFORE INSERT
+ AFTER INSERT
+ BEFORE UPDATE
+ AFTER UPDATE
+ BEFORE DELETE
+ AFTER DELETE
+ INSTEAD OF INSERT
+ INSTEAD OF DELETE
+ INSTEAD OF UPDATE

Suppose you use a UPDATE statement to update 10 rows in a table, the trigger that associated with the table is fired 10 times. This trigger is called FOR EACH ROW trigger. If the trigger associated with the table is fired one time, we call this trigger a FOR EACH STATEMENT trigger.

As of version 3.9.2, SQLite only supports FOR EACH ROW triggers. It has not yet supported the FOR EACH STATEMENT triggers.

If you use a condition in the WHEN clause, the trigger is only invoked when the condition is true. In case you omit the WHEN clause, the trigger is executed for all rows.

**Notice** that if you drop a table, all associated triggers are also deleted. However, if the trigger references other tables, the trigger is not removed or changed if other tables are removed or updated.

For example, a trigger references to a table named people, you drop the people table or rename it, you need to manually change the definition of the trigger.

You can access the data of the row being inserted, deleted, or updated using the OLD and NEW references in the form: OLD.column_name and NEW.column_name.

the OLD and NEW references are available depending on the event that causes the trigger to be fired.

The following table illustrates the rules.:

|  Action  |                         Reference                  |
|----------|----------------------------------------------------|
|  INSERT  |  NEW is available                                  |
|  UPDATE  |  Both NEW and OLD are available                    |
|  DELETE  |  OLD is available                                  |

##### SQLite triggers examples
Let’s create a new table called leads to store all business leads of the company.

```SQL
CREATE TABLE leads (
	id integer PRIMARY KEY,
	first_name text NOT NULL,
	last_name text NOT NULL,
	phone text NOT NULL,
	email text NOT NULL,
	source text NOT NULL
);
```

1) SQLite BEFORE INSERT trigger example
Suppose you want to validate the email address before inserting a new lead into the leads table. In this case, you can use a BEFORE INSERT trigger.

First, create a BEFORE INSERT trigger as follows:

```SQL
CREATE TRIGGER validate_email_before_insert_leads 
   BEFORE INSERT ON leads
BEGIN
   SELECT
      CASE
	WHEN NEW.email NOT LIKE '%_@__%.__%' THEN
   	  RAISE (ABORT,'Invalid email address')
       END;
END;
```

We used the NEW reference to access the email column of the row that is being inserted.

To validate the email, we used the LIKE operator to determine whether the email is valid or not based on the email pattern. If the email is not valid, the RAISE function aborts the insert and issues an error message.

Second, insert a row with an invalid email into the leads table.

```SQL
INSERT INTO leads (first_name,last_name,email,phone)
VALUES('John','Doe','jjj','4089009334');
```

SQLite issued an error: “Invalid email address” and aborted the execution of the insert.

Third, insert a row with a valid email.

```SQL
INSERT INTO leads (first_name, last_name, email, phone)
VALUES ('John', 'Doe', 'john.doe@sqlitetutorial.net', '4089009334');
```

Because the email is valid, the insert statement executed successfully.

```SQL
SELECT
	first_name,
	last_name,
	email,
	phone
FROM
	leads;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617720336/SQLite/SQLite-TRIGGER-Leads-Table_uwgkfb.png)

2) SQLite AFTER UPDATE trigger example
The phones and emails of the leads are so important that you can’t afford to lose this information. For example, someone accidentally updates the email or phone to the wrong ones or even delete it.

To protect this valuable data, you use a trigger to log all changes which are made to the phone and email.

First, create a new table called lead_logs to store the historical data.

```SQL
CREATE TABLE lead_logs (
	id INTEGER PRIMARY KEY,
	old_id int,
	new_id int,
	old_phone text,
	new_phone text,
	old_email text,
	new_email text,
	user_action text,
	created_at text
);
```

Second, create an AFTER UPDATE trigger to log data to the lead_logs table whenever there is an update in the email or phone column.

```SQL
CREATE TRIGGER log_contact_after_update 
   AFTER UPDATE ON leads
   WHEN old.phone <> new.phone
        OR old.email <> new.email
BEGIN
	INSERT INTO lead_logs (
		old_id,
		new_id,
		old_phone,
		new_phone,
		old_email,
		new_email,
		user_action,
		created_at
	)
VALUES
	(
		old.id,
		new.id,
		old.phone,
		new.phone,
		old.email,
		new.email,
		'UPDATE',
		DATETIME('NOW')
	) ;
END;
```

You notice that in the condition in the WHEN clause specifies that the trigger is invoked only when there is a change in either email or phone column.

Third, update the last name of John from Doe to Smith.

```SQL
UPDATE leads
SET 
   last_name = 'Smith'
WHERE
   id = 1;
```

The trigger log_contact_after_update was not invoked because there was no change in email or phone.

Fourth, update both email and phone of John to the new ones.

```SQL
UPDATE leads
SET 
   phone = '4089998888',
   email = 'john.smith@sqlitetutorial.net'
WHERE
   id = 1;
```

If you check the log table, you will see there is a new entry there.

```SQL
SELECT
   old_phone, 
   new_phone, 
   old_email, 
   new_email, 
   user_action
FROM
   lead_logs;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617720677/SQLite/SQLite-TRIGGER-After-Update-Trigger-Example_dpoizb.png)

You can develop the AFTER INSERT and AFTER DELETE triggers to log the data in the lead_logs table as an excercise.

##### SQLite DROP TRIGGER statement
To drop an existing trigger, you use the DROP TRIGGER statement as follows:

```SQL
DROP TRIGGER [IF EXISTS] trigger_name;
```

In this syntax:

+ First, specify the name of the trigger that you want to drop after the DROP TRIGGER keywords.
+ Second, use the IF EXISTS option to delete the trigger only if it exists.
Note that if you drop a table, SQLite will automatically drop all triggers associated with the table.

For example, to remove the validate_email_before_insert_leads trigger, you use the following statement:

```SQL
DROP TRIGGER validate_email_before_insert_leads;
```

#### Create INSTEAD OF triggers – learn about INSTEAD OF triggers and how to create an INSTEAD OF trigger to update data via a view.
##### What are INSTEAD OF triggers in SQLite
In SQLite, an INSTEAD OF trigger can be only created based on a view, not a table.

Views are read-only in SQLite. And if you issue a DML statement such as INSERT, UPDATE, or DELETE against a view, you will receive an error.

When a view has an INSTEAD OF trigger, the trigger will fire when you issue a corresponding DML statement. This allows you to inject your own logic in the processing flow.

For example, if a view has an INSTEAD OF INSERT trigger, when you issue an INSERT statement, the trigger will fire automatically. Inside the trigger, you can perform insert, update, or delete data in the base tables.

In other words, the INSTEAD OF triggers allow views to become modifiable.

The following illustrates the syntax of creating an INSTEAD OF trigger in SQLite:

```SQL
CREATE TRIGGER [IF NOT EXISTS] schema_ame.trigger_name
    INSTEAD OF [DELETE | INSERT | UPDATE OF column_name]
    ON table_name
BEGIN
    -- insert code here
END;
```

In this syntax:

+ First, specify the name of the trigger after the CREATE TRIGGER keywords. Use IF NOT EXISTS if you want to create the trigger if it exists only.
+ Second, use the INSTEAD OF keywords followed by a triggering event such as INSERT, UPDATE, or DELETE.
+ Third, specify the name of the view to which the trigger belongs.
+ Finally, specify the code that executes the logic.

##### SQLite INSTEAD OF trigger example
For the demonstration, we will use the Artists and Albums tables from the sample database.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617696091/SQLite/artists_albums_ako5gi.png)

First, create a view named AlbumArtists based on data from the Artists and Albums tables:

```SQL
CREATE VIEW AlbumArtists(
    AlbumTitle, 
    ArtistName
) AS 
SELECT 
    Title, 
    Name
FROM 
    Albums
INNER JOIN Artists USING (ArtistId);
```

Second, use this query to verify data from the view:

```SQL
SELECT * FROM AlbumArtists;
```

Third, insert a new row into the AlbumArtists view:

```SQL
INSERT INTO AlbumArtists(AlbumTitle,ArtistName)
VALUES('Who Do You Trust?','Papa Roach');
```

SQLite issued the following error:

```SQL
[SQLITE_ERROR] SQL error or missing database (cannot modify AlbumArtists because it is a view)
```

Fourth, create an INSTEAD OF trigger that fires when a new row is inserted into the AlbumArtists table:

```SQL
CREATE TRIGGER insert_artist_album_trg
    INSTEAD OF INSERT ON AlbumArtists
BEGIN
    -- insert the new artist first
    INSERT INTO Artists(Name)
    VALUES(NEW.ArtistName);
    
    -- use the artist id to insert a new album
    INSERT INTO Albums(Title, ArtistId)
    VALUES(NEW.AlbumTitle, last_insert_rowid());
END;
```

In this trigger:

+ First, insert a new row into the Artists table. SQLite automatically generates an integer for the ArtistId column.
+ Second, use the last_insert_rowid() to get the generated value from the ArtistId column and insert a new row into the Albums table.

Finally, verify insert from the Artists and Albums tables:

```SQL
SELECT
  *   
FROM
    Artists
ORDER BY
    ArtistId DESC;

SELECT
*
FROM
    Albums
ORDER BY
    AlbumId DESC;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617721384/SQLite/SQLite-INSTEAD-OF-Trigger-Albums-Table_jtwywd.png)
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617721384/SQLite/SQLite-INSTEAD-OF-Trigger-Artists-Table_xxgnns.png)

As you can see the output, a new row has been inserted into the Artists and Albums tables.

### Section 16. Full-text search
Full-text search – get started with the full-text search in SQLite.
#### Introduction to SQLite full-text search
A virtual table is a custom extension to SQLite. A virtual table is like a normal table. The difference between a virtual table and a normal table is where the data come from i.e., when you process a normal table, SQLite accesses the database file to retrieve data. However, when you access a virtual table, SQLite calls the custom code to get the data. The custom code can have specified logic to handle certain tasks such as getting data from multiple data sources.

To use full-text search in SQLite, you use FTS5 virtual table module.

The following CREATE VIRTUAL TABLE statement creates an FTS5 table with two columns:

```SQL
CREATE VIRTUAL TABLE table_name 
USING FTS5(column1,column2...);
```

Notice that you cannot add types, constraints, or PRIMARY KEY declaration in the CREATE VIRTUAL TABLE statement for creating an FTS5 table. If you do so, SQLite will issue an error.

Like creating a normal table without specifying the primary key column, SQLite adds an implicit rowid column to the FTS5 table.

The following example creates an FTS5 table named posts with two columns title and body.A

```SQL
CREATE VIRTUAL TABLE posts 
USING FTS5(title, body);
```

Notice that you cannot add types, constraints, or PRIMARY KEY declaration in the CREATE VIRTUAL TABLE statement for creating an FTS5 table. If you do so, SQLite will issue an error.

Like creating a normal table without specifying the primary key column, SQLite adds an implicit rowid column to the FTS5 table.

The following example creates an FTS5 table named posts with two columns title and body.

```SQL
CREATE VIRTUAL TABLE posts 
USING FTS5(title, body);
```

Similar to a normal table, you can insert data into the posts table as follows:

```SQL
INSERT INTO posts(title,body)
VALUES('Learn SQlite FTS5','This tutorial teaches you how to perform full-text search in SQLite using FTS5'),
('Advanced SQlite Full-text Search','Show you some advanced techniques in SQLite full-text searching'),
('SQLite Tutorial','Help you learn SQLite quickly and effectively');
```

And query data against it:

```SQL
SELECT * FROM posts;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617721799/SQLite/SQLite-full-text-search-table-data_nzw7xr.png)

#### Querying data using full-text search
You can execute a full-text query against an FTS5 table using one of these three ways.

First, use a MATCH operator in the WHERE clause of the SELECT statement. For example, to get all rows that have the term fts5, you use the following query:

```SQL
SELECT * 
FROM posts 
WHERE posts MATCH 'fts5';
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617721883/SQLite/SQLite-full-text-search-MATCH-operator_hnhgdx.png)

Second, use an equal (=) operator in the WHERE clause of the SELECT statement. The following statement returns the same result as the statement above:

```SQL
SELECT * 
FROM posts 
WHERE posts = 'fts5';
```

Third, use a tabled-value function syntax. In this way, you use the search term as the first table argument:

```SQL
SELECT * 
FROM posts('fts5');
```

By default, FTS5 is case-independent. It treats the terms fts5FTS5 and Fts5 the same.

To sort the search results from the most to least relevant, you use the ORDER BY clause as follows:

```SQL
SELECT * 
FROM posts 
WHERE posts MATCH 'text' 
ORDER BY rank;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617722035/SQLite/SQLite-full-text-search-sorting_l8m1gk.png)

#### Using full-text query syntax
A full-text search query is made up of phrases, where each phrase is an ordered list of one or more tokens. You can use the “+” operator to concatenate two phrases as the following example:

```SQL
"learn SQLite"
"learn + SQLite"
```

FTS5 determines whether a document matches a phrase if the document contains at least one subsequence of tokens that match the sequence of tokens used to construct the phrase.

The following query returns all documents that match the search term Learn SQLite:

```SQL
SELECT * 
FROM posts 
WHERE posts MATCH 'learn SQLite';
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617722187/SQLite/SQLite-full-text-search-query-syntax_kmkvkl.png)

#### Prefix searches
You can use the asterisk (\*) as a prefix token. When a phrase contains the asterisk (\*), it will match any document that contains the token that begins with the phrase. For example, search\* matches with search, searching, searches, etc. See the following example:

```SQL
SELECT * 
FROM posts
WHERE posts = 'search*';
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617722282/SQLite/SQLite-full-text-search-prefix-searches_t48eb8.png)

Boolean operators
You can use the Boolean operator e.g., NOT, OR, or AND to combine queries.

+ q1 AND q2: matches if both q1 and q2 queries match.
+ q1 OR q2: matches if either query q1 or q2 matches.
+ q1 NOT q2: matches if query q1 matches and q2 doesn’t match.

For example, to get the documents that match the learn phrase but doesn’t match the FTS5 phrase, you use the NOT operator as follows:

```SQL
SELECT * 
FROM posts 
WHERE posts MATCH 'learn NOT text';
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617722390/SQLite/SQLite-full-text-search-NOT-operator_yftqdg.png)

To search for documents that match either phrase learn or text, you use the OR operator as the following example:

```SQL
SELECT * 
FROM posts 
WHERE posts MATCH 'learn OR text';
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617722440/SQLite/SQLite-full-text-search-OR-operator_vs5gjp.png)

To find the documents that match both SQLite and searching, you use the AND operator as shown below:

```SQL
SELECT * 
FROM posts 
WHERE posts MATCH 'sqlite AND searching';
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617722498/SQLite/SQLite-full-text-search-AND-operator_dx3g2a.png)

To change the operator precedence, you use parenthesis to group expressions. For example:

```SQL
SELECT * 
FROM posts 
WHERE posts MATCH 'search AND sqlite OR help';
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617722558/SQLite/SQLite-full-text-search-Combine-Logical-Operators_qwidsl.png)

The statement returns documents that match search and sqlite or help. To find the documents that match search and either sqlite or help, you use parenthesis as follows:

```SQL
SELECT * 
FROM posts 
WHERE posts MATCH 'search AND (sqlite OR help)';
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617722621/SQLite/SQLite-full-text-search-operator-precedence_zgncun.png)

#### Built-in auxiliary functions
SQLite provides three built-in auxiliary functions that can be used within full-text queries on the FTS5 table.

+ The bm25() returns a value that represents the accuracy of the current match, the lower value means a better match.
+ The highlight() auxiliary function returns a copy of the text with search terms surrounded by a specified markup e.g.,<b>search term </b>
+ The snippet() selects a short fragment of text in order to maximize the number of search terms it contains.

For example, the following query uses the highlight() function to decorate the search terms using the <b>tag</b>:

```SQL
SELECT highlight(posts,0, '<b>', '</b>') title, 
       highlight(posts,1, '<b>', '</b>') body
FROM posts 
WHERE posts MATCH 'SQLite'
ORDER BY rank;
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617722740/SQLite/SQLite-full-text-search-highlight-function_yncmwd.png)

In this section, you have learned how to use SQLite full-text search features via FTS5 virtual table module.

### Section 17. SQLite tools
#### SQLite Commands – show you the most commonly used command in the sqlite3 program.
The SQLite project delivers a simple command-line tool named sqlite3 (or sqlite3.exe on Windows) that allows you to interact with the SQLite databases using SQL statements and commands.

##### Connect to an SQLite database
To start the sqlite3, you type the sqlite3 as follows:

```console
>sqlite3
SQLite version 3.29.0 2019-07-10 17:32:03
Enter ".help" for usage hints.
Connected to a transient in-memory database.
Use ".open FILENAME" to reopen on a persistent database.
sqlite>
```

By default, an SQLite session uses the in-memory database, therefore, all changes will be gone when the session ends.

To open a database file, you use the .open FILENAME command. The following statement opens the chinook.db database:

```console
sqlite> .open c:\sqlite\db\chinook.db
```

If you want to open a specific database file when you connect to the SQlite database, you use the following command:

```console
>sqlite3 c:\sqlite\db\chinook.db
SQLite version 3.13.0 2016-05-18 10:57:30
Enter ".help" for usage hints.
sqlite>
```

If you start a session with a database name that does not exist, the sqlite3 tool will create the database file.

For example, the following command creates a database named sales in the C:\sqlite\db\ directory:

```console
>sqlite3 c:\sqlite\db\sales.db
SQLite version 3.29.0 2019-07-10 17:32:03
Enter ".help" for usage hints.
sqlite>
```

##### Show all available commands and their purposes
To show all available commands and their purpose, you use the .help command as follows:

```console
.help
```

##### Show databases in the current database connection
To show all databases in the current connection, you use the .databases command. The .databases command displays at least one database with the name: main.

For example, the following command shows all the databases of the current connection:

```console
sqlite> .database
seq  name             file
---  ---------------  --------------------------
0    main             c:\sqlite\db\sales.db
sqlite>
```

To add an additional database in the current connection, you use the statement ATTACH DATABASE. The following statement adds the chinook database to the current connection.

```console
sqlite> ATTACH DATABASE "c:\sqlite\db\chinook.db" AS chinook;
```

Now if you run the .database command again, the sqlite3 returns two databases: main and chinook.

```console
sqlite> .databases
seq  name             file
---  ---------------  ---------------------
0    main             c:\sqlite\db\sales.db
2    chinook          c:\sqlite\db\chinook.db
```

##### Exit sqlite3 tool
To exit the sqlite3 program, you use the .exit command.

```console
sqlite>.exit
```

Show tables in a database
To display all the tables in the current database, you use the .tables command. The following commands open a new database connection to the chinook database and display the tables in the database.

```console
>sqlite3 c:\sqlite\db\chinook.db
SQLite version 3.29.0 2019-07-10 17:32:03
Enter ".help" for usage hints.
sqlite> .tables
albums          employees       invoices        playlists
artists         genres          media_types     tracks
customers       invoice_items   playlist_track
sqlite>
```

If you want to find tables based on a specific pattern, you use the .table pattern command. The sqlite3 uses the LIKE operator for pattern matching.

For example, the following statement returns the table that ends with the string es.

```console
sqlite> .table '%es'
employees    genres       invoices     media_types
sqlite>
```

##### Show the structure of a table

To display the structure of a table, you use the .schema TABLE command. The TABLE argument could be a pattern. If you omit it, the .schema command will show the structures of all the tables.

The following command shows the structure of the albums table.

```console
sqlite> .schema albums
CREATE TABLE "albums"
(
    [AlbumId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Title] NVARCHAR(160)  NOT NULL,
    [ArtistId] INTEGER  NOT NULL,
    FOREIGN KEY ([ArtistId]) REFERENCES "artists" ([ArtistId])
                ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX [IFK_AlbumArtistId] ON "albums" ([ArtistId]);
sqlite>
```

To show the schema and the content of the sqlite_stat tables, you use the .fullschema command.

```console
sqlite>.fullschema
```

##### Show indexes
To show all indexes of the current database, you use the .indexes command as follows:

```console
sqlite> .indexes
IFK_AlbumArtistId
IFK_CustomerSupportRepId
IFK_EmployeeReportsTo
IFK_InvoiceCustomerId
IFK_InvoiceLineInvoiceId
IFK_InvoiceLineTrackId
IFK_PlaylistTrackTrackId
IFK_TrackAlbumId
IFK_TrackGenreId
IFK_TrackMediaTypeId
```

To show the indexes of a specific table, you use the .indexes TABLE command. For example, to show indexes of the albums table, you use the following command:

```console
sqlite> .indexes albums
IFK_AlbumArtistId
```

To show indexes of the tables whose names end with es, you use a pattern of the LIKE operator.

```console
sqlite> .indexes %es
IFK_EmployeeReportsTo
IFK_InvoiceCustomerId
```

##### Save the result of a query into a file

To save the result of a query into a file, you use the .output FILENAME command. Once you issue the .output command, all the results of the subsequent queries will be saved to the file that you specified in the FILENAME argument. If you want to save the result of the next single query only to the file, you issue the .once FILENAME command.

To display the result of the query to the standard output again, you issue the .output command without arguments.

The following commands select the title from the albums table and write the result to the albums.txt file.

```console
sqlite> .output albums.txt
sqlite> SELECT title FROM albums;
```

##### Execute SQL statements from a file
Suppose we have a file named commands.txt in the c:\sqlite\ folder with the following content:

```SQL
SELECT albumid, title
FROM albums
ORDER BY title
LIMIT 10;
```

To execute the SQL statements in the commands.txt file, you use the .read FILENAME command as follows:

```console
sqlite> .mode column
sqlite> .header on
sqlite> .read c:/sqlite/commands.txt
AlbumId     Title
----------  ----------------------
156         ...And Justice For All
257         20th Century Masters -
296         A Copland Celebration,
94          A Matter of Life and D
95          A Real Dead One
96          A Real Live One
285         A Soprano Inspired
139         A TempestadeTempestade
203         A-Sides
160         Ace Of Spades
```

In this section, you have learned many useful commands in the sqlite3 tool to perform various tasks that deal with the SQLite database.

#### SQLite Show Tables – list all tables in a database.
##### Showing tables using the sqlite command line shell program
To show tables in a database using the sqlite command line shell program, you follow these steps:

First, open the database that you want to show the tables:

```console
> sqlite3 c:\sqlite\db\chinook.db
```

The above statement opened the database named  chinook.db that locates in the c:\sqlite\db directory.

Second, type the .tables command:

```console
sqlite> .tables
```

The .tables command lists all tables in the  chinook database

```console
albums          employees       invoices        playlists
artists         genres          media_types     tracks
customers       invoice_items   playlist_track
```

Note that both .tables, .table have the same effect. In addition, the command .ta should work too.

The .tables command also can be used to show temporary tables. See the following example:

First, create a new temporary table named temp_table1:

```console
sqlite> CREATE TEMPORARY TABLE temp_table1( name TEXT );
```

Second, list all tables from the database:

```console
sqlite> .tables
```

The following shows the output:

```console
albums            employees         invoices          playlists
artists           genres            media_types       temp.temp_table1
customers         invoice_items     playlist_track    tracks
```

Because the schema of temporary tables is temp, the command showed the names of schema and table of the temporary table such as temp.temp_table1.

If you want to show tables with the specific name, you can add a matching pattern:

```console
.tables pattern
```

The command works the same as LIKE operator. The pattern must be surrounded by single quotation marks ( ').

For example, to find tables whose names start with the letter ‘a’, you use the following command:

```console
sqlite> .table 'a%'
```

Here is the output:

```console
albums   artists
```

To shows the tables whose name contains the string  ck, you use the %ck% pattern as shown in the following command:

```console
sqlite> .tables '%ck%'
```

The output is as follows:

```console
playlist_track  tracks
```

##### Showing tables using SQL statement
Another way to list all tables in a database is to query them from the sqlite_master table.

```SQL
SELECT 
    name
FROM 
    sqlite_master 
WHERE 
    type ='table' AND 
    name NOT LIKE 'sqlite_%';
```

Here is the output:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617724748/SQLite/SQLite-Show-Tables-Command_ge3lzx.png)

In this query, we filtered out all tables whose names start with sqlite_ such as  sqlite_stat1 and sqlite_sequence tables. These tables are the system tables managed internally by SQLite.

In this section, you have learned how to show all tables in a database using the .tables command or by querying data from the sqlite_master table.

#### SQLite Describe Table – show the structure of a table.

##### Getting the structure of a table via the SQLite command-line shell program
To find out the structure of a table via the SQLite command-line shell program, you follow these steps:

First, connect to a database via the SQLite command-line shell program:

```console
> sqlite3 c:\sqlite\db\chinook.db
```

Then, issue the following command:

```console
.schema table_name
```

For example, to show the statement that created the albums table, you use the following command:

```console
sqlite> .schema albums
```

Notice that there is no semicolon (;) after the table name. If you add a semicolon (;), the .schema will consider the albums; as the table name and returns nothing because the table albums; does not exist.

Here is the output:

```SQL
CREATE TABLE IF NOT EXISTS "albums"
(
    [AlbumId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Title] NVARCHAR(160)  NOT NULL,
    [ArtistId] INTEGER  NOT NULL,
    FOREIGN KEY ([ArtistId]) REFERENCES "artists" ([ArtistId])
                ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX [IFK_AlbumArtistId] ON "albums" ([ArtistId]);
```

Another way to show the structure of a table is to use the following PRAGMA command:

```console
sqlite> .header on
sqlite> .mode column
sqlite> pragma table_info('albums');
```

Note that the first two commands are used to format the output nicely.

The following picture shows the output:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617724969/SQLite/SQLite-Describe-Table_n7inqb.png)

##### Getting the structure of a table using the SQL statement
You can find the structure of a table by querying it from the sqlite_master table as follows:

```SQL
SELECT sql 
FROM sqlite_master 
WHERE name = 'albums';
```

Here is the output:

```console
sql
------------
CREATE TABLE "albums"
(
    [AlbumId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Title] NVARCHAR(160)  NOT NULL,
    [ArtistId] INTEGER  NOT NULL,
    FOREIGN KEY ([ArtistId]) REFERENCES "artists" ([ArtistId])
                ON DELETE NO ACTION ON UPDATE NO ACTION
)
```

In this section, you have learned how to show the structure of a table in SQLite via command-line shell program or SQL statement.

#### SQLite Dump – how to use dump command to backup and restore a database.
By using the sqlite3 tool, you can use the SQL statements to query or update data in the database. In addition, you can use special commands, which are known as dot-commands to perform various useful database operations.

One of these dot-commands is the  .dump command that gives you the ability to dump the entire database or tables into a text file.

##### Dump the entire database into a file using SQLite dump command

The following command opens a new SQLite database connection to the chinook.db file.

```console
C:\sqlite>sqlite3 c:/sqlite/chinook.db
SQLite version 3.13.0 2016-05-18 10:57:30
Enter ".help" for usage hints.
sqlite>
```

To dump a database into a file, you use the .dump command. The .dump command converts the entire structure and data of an SQLite database into a single text file.

By default, the .dump command outputs the SQL statements on screen. To issue the output to a file, you use the  .output FILENAME command.

The following commands specify the output of the dump file to chinook.sql and dump the chinook database into the chinook.sql file.

```console
sqlite> .output c:/sqlite/chinook.sql
sqlite> .dump
sqlite> .exit
```

##### Dump a specific table using the SQLite dump command
If you want to dump a specific table, you need to specify the table name followed the .dump command. For example, the following command saves the albums table to the albums.sql file.

```console
sqlite> .output c:/sqlite/albums.sql
sqlite> .dump albums
sqlite> .quit
```

The following picture shows the content of the albums.sql file.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617725283/SQLite/SQLite-dump-example_es5kc0.png)

##### Dump tables structure only using schema command
If you want to dump the structures of tables in a database, you use the .schema command. The following commands set the output file to chinook_structure.sql file and save the structures of tables into the chinook_structure.sql file.

```console
sqlite> .output c:/sqlite/chinook_structure.sql
sqlite> .schema
sqlite> .quit
```

The following picture shows the content of the chinook_structure.sql file.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617725377/SQLite/SQLite-dump-structure_d4vwug.png)

##### Dump data of one or more tables into a file

To dump the data of a table into a text file, you use these steps:

First, set the mode to insert using the .mode command as follows:

```console
sqlite> .mode insert
```

From now on, every SELECT statement will issue the result as the INSERT statements instead of pure text data.

Second, set the output to a text file instead of the default standard output. The following command sets the output file to the data.sql file.

```console
sqlite> .output data.sql
```

Third, issue the SELECT statements to query data from a table that you want to dump. The following command returns data from the artists table.

```console
sqlite> select * from artists;
```

Check the content of the data.sql file, if everything is fine, you will see the following output:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617725508/SQLite/SQLite-dump-data-only_voif1e.png)

To dump data from other tables, you need to issue the SELECT statements to query data from those tables.

In this section, you have learned how to dump data into a text file using the SQLite dump command and other commands.

#### SQLite Import CSV – import CSV files into a table.
##### Importing a CSV file into a table using sqlite3 tool

In the first scenario, you want to import data from CSV file into a table that does not exist in the SQLite database.

1. First, the sqlite3 tool creates the table. The sqlite3 tool uses the first row of the CSV file as the names of the columns of the table.
2. Second, the sqlite3 tool import data from the second row of the CSV file into the table.

We will import a CSV file named city.csv with two columns: name and population. You can download it here for practicing.

[Download the city.csv file](https://cdn.sqlitetutorial.net/wp-content/uploads/2016/05/city.csv)

To import the c:\sqlite\city.csv file into the cities table:

First, set the mode to CSV to instruct the command-line shell program to interpret the input file as a CSV file. To do this, you use the .mode command as follows:

```console
sqlite> .mode csv
```

Second, use the command .import FILE TABLE to import the data from the city.csv file into the cities table.

```console
sqlite>.import c:/sqlite/city.csv cities
```

To verify the import, you use the command .schema to display the structure of the cities table.

```console
sqlite> .schema cities
CREATE TABLE cities(
  "name" TEXT,
  "population" TEXT
);
```

To view the data of the cities table, you use the following SELECT statement.

```SQL
SELECT 
   name, 
   population
FROM 
   cities;
```

In the second scenario, the table is already available in the database and you just need to import the data.

First, drop the cities table that you have created.

```SQL
DROP TABLE IF EXISTS cities;
```

Second, use the following CREATE TABLE statement to create the table cities.

```SQL
CREATE TABLE cities(
  name TEXT NOT NULL,
  population INTEGER NOT NULL 
);
```

If the table already exists, the sqlite3 tool uses all the rows, including the first row, in the CSV file as the actual data to import. Therefore, you should delete the first row of the CSV file.

The following commands import the city_without_header.csv file into the cities table.

```console
sqlite> .mode csv
sqlite> .import c:/sqlite/city_no_header.csv cities
```

##### Import a CSV file into a table using SQLite Studio
Most SQLite GUI tools provide the import function that allows you to import data from a file in CSV format, tab-delimited format, etc., into a table.

We will use the SQLite Studio to show you how to import a CSV file into a table with the assumption that the target table already exists in the database.

First, from the menu choose tool menu item.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617725987/SQLite/SQLite-Import-csv-to-table-Step-1_zpagwc.png)

Second, choose the database and table that you want to import data then click the Next button.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617726034/SQLite/SQLite-Import-csv-to-table-Step-2_btaa9f.png)

Third, choose CSV as the data source type, choose the CSV file in the Input file field, and choose the ,(comma) option as the Field separator as shown in the picture below. Then click the Finish button to import the data.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617726093/SQLite/SQLite-Import-csv-to-table-Step-3_kcj7ox.png)

In this section, you have learned how to use the sqlite3 and SQLite Studio to import data from a CSV file into a table in the SQLite database.

#### SQLite Export CSV – export an SQLite database to CSV files.
##### Export SQLite Database to a CSV file using sqlite3 tool

SQLite project provides you with a command-line program called sqlite3 or sqlite3.exe on Windows. By using the sqlite3 tool, you can use the SQL statements and dot-commands to interact with the SQLite database.

To export data from the SQLite database to a CSV file, you use these steps:

1. Turn on the header of the result set using the .header on command.
2. Set the output mode to CSV to instruct the sqlite3 tool to issue the result in the CSV mode.
3. Send the output to a CSV file.
4. Issue the query to select data from the table to which you want to export.

The following commands select data from the customers table and export it to the data.csv file.

```console
>sqlite3 c:/sqlite/chinook.db
sqlite> .headers on
sqlite> .mode csv
sqlite> .output data.csv
sqlite> SELECT customerid,
   ...>        firstname,
   ...>        lastname,
   ...>        company
   ...>   FROM customers;
sqlite> .quit
```

If you check the data.csv file, you will see the following output.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617726311/SQLite/SQLite-Export-CSV-example_u2rq3f.png)

Besides using the dot-commands, you can use the options of the sqlite3 tool to export data from the SQLite database to a CSV file.

For example, the following command exports the data from the tracks table to a CSV file named tracks.csv.

```console
>sqlite3 -header -csv c:/sqlite/chinook.db "select * from tracks;" > tracks.csv
```

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617726389/SQLite/SQLite-Export-CSV-one-liner-option_lbijbb.png)

If you have a file named query.sql that contains the script to query data, you can execute the statements in the file and export data to a CSV file.

```console
>sqlite3 -header -csv c:/sqlite/chinook.db < query.sql > data.csv
```

##### Export SQLite database to a CSV file using SQliteStudio
The SQLiteStudio provides the export function that allows you to export data in a table or the result of a query to a CSV file.

The following steps show you how to export data from a table to a CSV file.

First, click the Tools > Export menu item

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617726466/SQLite/SQLite-Export-CSV-Step-1_wxhyes.png)

Next, choose the database and table that you want to export data; check the Export table data.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617726517/SQLite/SQLite-Export-CSV-Step-3_mvpivm.png)

Then, choose a single table to export the data.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617726559/SQLite/SQLite-Export-CSV-Step-2_hayyoe.png)

After that, (1) choose the CSV as the export format, (2) specify the CSV file name, (3) check the column names in the first row, (4) choose comma (,) as the column separator, (5) treat the NULL value as empty string, (6) click Finish button to complete exporting.

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617726597/SQLite/SQLite-Export-CSV-Step-4_zccwni.png)

Finally, check the customer.csv file, you will see the following content:

![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1617726639/SQLite/SQLite-Export-CSV-Result-Customers-Data_fna3nv.png)

In this section, you have learned various ways to export data in the SQLite database to a CSV file.


