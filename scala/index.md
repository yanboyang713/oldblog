# Getting Started with Scala


## Overview {#overview}

Scala is a modern multi-paradigm programming language designed to express common programming patterns in a concise, elegant, and type-safe way. Scala has been created by Martin Odersky and he released the first version in 2003. Scala smoothly integrates the features of object-oriented and functional languages. This tutorial explains the basics of Scala in a simple and reader-friendly way.


### Prerequisites {#prerequisites}

Scala Programming is based on Java, so if you are aware of Java syntax, then it's pretty easy to learn Scala. Further if you do not have expertise in Java but if you know any other programming language like C, C++ or Python then it will also help in grasping Scala concepts very quickly.


### Why need to learn Scala {#why-need-to-learn-scala}

1.  Spark and Flink are memory-level big data computing framework are very important part of big data.
2.  Spark and Flink are written in Scala. Therefore, in order to learn Spark and Flink better, you need to master the language Scala.
3.  The rise of Spark drives the development of the Scala language!


### Scala history {#scala-history}

Martin Odersky of the Federal Institute of Technology began designing Scala in 2001.
Martin Odyssky is a big fan of compilers and programming. After a long time of programming, he hopes to invent a Language can make basic tasks like writing programs efficient and simple. So when you come into contact with the JAVA language, right JAVA, a portable language that runs on the Internet and has garbage collection, has generated great interest, so he decided combining the features of functional programming languages ​into JAVA, two languages ​(Pizza &amp; Scala) were invented. Pizza and Scala have greatly promoted the development of the Java programming language. The generics of JDK5.0, enhanced for loops, automatic type conversion, etc., are all new features introduced from Pizza. Type inference and Lambda expressions of JDK8.0 are features introduced from Scala. The editors of JDK5.0 and JDK8.0 were written by Martin Odyssky, so Martin Odyssky alone. The fighting power is worthy of a Java development team.


### The relationship between Scala and Java {#the-relationship-between-scala-and-java}

Generally speaking, people who learn Scala already know Java, and Scala is based on Java.

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1622322955/scala/Sun%5F30%5FMay%5F2021%5F07%5F13%5F51%5FAEST%5Fu3wqes.png" >}}


### Scala language features {#scala-language-features}

Scala is a program that uses Java Virtual Machine (JVM) as its operating environment and combines the best features of object-oriented and functional programming. Statically typed programming languages ​(static languages ​need to be compiled in advance, such as: Java, c, c++, etc., dynamic languages ​such as: js).

1.  Scala is a multi-paradigm programming language. Scala supports object-oriented and functional programming. (Multi-paradigm means multiple programming methods The meaning of law. There are four programming methods: process-oriented, object-oriented, generic, and functional. )

2.  Scala source code (.scala) will be compiled into Java bytecode (.class), and then run on the JVM, and can call existing The Java class library realizes the seamless connection of the two languages.

3.  Scala is very simple and efficient as a language.

4.  When designing Scala, Martin Odyssky referred to the design ideas of Java. It can be said that Scala is derived from Java. At the same time, Martin Odessky Deski also added his own thoughts and integrated the features of functional programming language into JAVA. Therefore, for students who have studied Java, As long as you understand the similarities and differences between Scala and Java in the process of learning Scala, you can quickly master the language of Scala.


## Set-up Scala development environment {#set-up-scala-development-environment}

I recommend you using **NIX**, set-up your emvironment. Please, read this article: [Nix/Getting Started with Nix]({{< relref "nix" >}}).

```console
[yanboyang713@manjaro] ➜ ~ java -version
openjdk version "17.0.1" 2021-10-19
OpenJDK Runtime Environment (build 17.0.1+12-nixos)
OpenJDK 64-Bit Server VM (build 17.0.1+12-nixos, mixed mode, sharing)
```

```console
[yanboyang713@manjaro] ➜ ~ scala -version
Scala code runner version 2.13.7 -- Copyright 2002-2021, LAMP/EPFL and Lightbend, Inc.
```


## Basic Syntax {#basic-syntax}

If you have a good understanding on Java, then it will be very easy for you to learn Scala. The biggest syntactic difference between Scala and Java is that the ';' line end character is optional.

When we consider a Scala program, it can be defined as a collection of objects that communicate via invoking each other’s methods. Let us now briefly look into what do class, object, methods and instance variables mean.

-   **Object** − Objects have states and behaviors. An object is an instance of a class. Example − A dog has states - color, name, breed as well as behaviors - wagging, barking, and eating.

-   **Class** − A class can be defined as a template/blueprint that describes the behaviors/states that are related to the class.

-   **Methods** − A method is basically a behavior. A class can contain many methods. It is in methods where the logics are written, data is manipulated and all the actions are executed.

-   **Fields** − Each object has its unique set of instance variables, which are called fields. An object's state is created by the values assigned to these fields.

-   **Closure** − A closure is a function, whose return value depends on the value of one or more variables declared outside this function.

-   **Traits** − A trait encapsulates method and field definitions, which can then be reused by mixing them into classes. Traits are used to define object types by specifying the signature of the supported methods.


## First Scala Program {#first-scala-program}

We can execute a Scala program in two modes: one is **interactive mode** and another is **script mode**.


### Interactive Mode {#interactive-mode}

Open the command prompt and use the following command to open Scala.

```console
[yanboyang713@manjaro] ➜ ~ scala
Welcome to Scala 2.13.7 (OpenJDK 64-Bit Server VM, Java 17.0.1).
Type in expressions for evaluation. Or try :help.

scala>
```

Type the following text to the right of the Scala prompt and press the Enter key −

```console
scala> println("Hello, Scala!");
```

It will produce the following result −

```console
Hello, Scala!
```

You can type **:quit** to exit interactive Mode.


### Script Mode {#script-mode}

Use the following instructions to write a Scala program in script mode. Open notepad and add the following code into it.

Example

```scala
object HelloWorld {
   /* This is my first java program.
   * This will print 'Hello World' as the output
   */
   def main(args: Array[String]) {
      println("Hello, world!") // prints Hello World
   }
}
```

Save the file as − HelloWorld.scala.

Open the command prompt window and go to the directory where the program file is saved. The ‘scalac’ command is used to compile the Scala program and it will generate a few class files in the current directory. One of them will be called HelloWorld.class. This is a bytecode which will run on Java Virtual Machine (JVM) using ‘scala’ command.

Use the following command to compile and execute your Scala program.

```console
\> scalac HelloWorld.scala
\> scala HelloWorld
```

Output:

```text
Hello, World!
```


## Basic Syntax {#basic-syntax}

The following are the basic syntaxes and coding conventions in Scala programming.

-   **Case Sensitivity** − Scala is case-sensitive, which means identifier **Hello** and **hello** would have different meaning in Scala.

-   **Class Names** − For all class names, the first letter should be in Upper Case. If several words are used to form a name of the class, each inner word's first letter should be in Upper Case.

    **Example** − class MyFirstScalaClass.

-   **Method Names** − All method names should start with a Lower Case letter. If multiple words are used to form the name of the method, then each inner word's first letter should be in Upper Case.

    **Example** − def myMethodName()

-   **Program File Name** − Name of the program file should exactly match the object name. When saving the file you should save it using the object name (Remember Scala is case-sensitive) and append '**.scala**' to the end of the name. (If the file name and the object name do not match your program will not compile).

    **Example** − Assume 'HelloWorld' is the object name. Then the file should be saved as 'HelloWorld.scala'.

-   **def main(args: Array[String])** − Scala program processing starts from the main() method which is a mandatory part of every Scala Program.


## Reference List {#reference-list}

1.  <https://www.tutorialspoint.com/scala/index.htm>

