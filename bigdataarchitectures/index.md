# 4 big data architectures, Data Streaming, Lambda architecture, Kappa architecture and Unifield architecture

## Introduction
![](https://miro.medium.com/max/700/1*qQt5aKByL8vlxWWvcMH3AA.jpeg)

Although data analysis is hidden behind the business system, it has a very important role. The results of data analysis play a pivotal role in decision-making and business development. With the development of big data technology, the exposure of proper terms such as data mining and data exploration is getting higher and higher, but before big data analysis systems similar to the Hadoop become popular, data analysis work has undergone considerable development, especially data analysis based on BI systems already has very mature and stable technical solutions and ecosystems.

![](https://miro.medium.com/max/700/1*BFV9VapyN2CVHj8LN0vJ6A.png)

Cube is a higher-level business model abstraction. A variety of operations can be performed on Cube, such as drilling up, drilling down, and slicing. Most BI systems are based on relational databases. Relational databases use SQL statements to operate, but SQL is relatively weak in terms of multi-dimensional operation and analysis. So Cube has its own unique query language MDX, which has more expressions. Strong multi-dimensional performance capabilities, so the analysis system with Cube as the core basically occupies half of the data statistical analysis. Most database service vendors directly provide BI package software services, and an Olap analysis system can be easily built. However, the problems of BI gradually emerged over time:

+ BI systems are more focused on analyzing business data with high-density and high-value structured data, and are very weak in processing unstructured and semi-structured data, such as image, text, and audio storage and analysis.
+ Because the data warehouse is structured storage, we usually call the ETL process when data enters the data warehouse from other systems. ETL actions are strongly bound to the business, and a dedicated ETL team is usually required to connect with the business and decide how Perform data cleaning and conversion.
+ With the increase of heterogeneous data sources, for example, if there are data sources such as videos, texts, pictures, etc., to analyze the data content and enter the data warehouse, very complicated ETL programs are required, which causes ETL to become too large and bloated.
+ When the amount of data is too large, performance will become a bottleneck, and it will show obvious difficulty in the TB/PB level of data.
+ The database paradigm and other constraint rules focus on solving the problem of data redundancy to ensure data consistency, but for data warehouses, we do not need to modify the data and guarantee consistency. In principle, the data warehouse The original data is read-only, so these constraints will become a factor affecting performance.
+ The pre-supposition and processing of the data by the ETL action results in the data obtained by the machine learning part as hypothetical data, so the effect is not ideal. For example, if you need to use a data warehouse to mine abnormal data, you need to clearly define the feature data that needs to be extracted when the data is stored in the database through ETL, otherwise it cannot be structured into the database, but in most cases it needs to be extracted based on heterogeneous data Out characteristics.

Under a series of problems, the big data analysis platform led by the Hadoop system has gradually shown its superiority, and the ecosystem surrounding the Hadoop system has also continued to grow. For the Hadoop system, it has fundamentally solved the bottleneck of the traditional data warehouse. The problem, but also brings a series of problems:

1. Upgrading from a data warehouse to a big data architecture does not have a smooth evolution, which is basically equal to overturning and redoing.
2. Distributed storage under big data emphasizes the read-only nature of data, so similar to Hive, HDFS storage methods do not support update, and HDFS write operations do not support parallelism. These characteristics lead to certain limitations.

The data analysis platform based on big data architecture focuses on solving the bottlenecks faced by traditional data warehouses in data analysis from the following dimensions:

1. **Distributed computing**: The idea of distributed computing is to allow multiple nodes to compute in parallel, and emphasize the locality of data to reduce data transmission as much as possible. For example, Spark uses RDD to express the computing logic of data, which can be done on RDD. Series optimization to reduce data transmission.

2. **Distributed storage**: The so-called distributed storage refers to the division of a large file into N copies, and each copy is independently placed on a machine. Here it involves operations such as file copy, fragmentation, and management. The main optimization actions of distributed storage are in this area.

3. **Combination of retrieval and storage**: In the early big data components, storage and calculation were relatively single, but the current direction is to do more hands and feet on storage to make query and calculation more efficient, which is not efficient for calculation. What’s more is to find data fast and read data fast, so the current storage not only stores data content, but also adds a lot of meta-information, such as index information. Similar ideas like parquet and carbon data.

## Traditional big data architecture
![](https://miro.medium.com/max/400/1*ZBXihecxlvRQqIyYeI50Ng.jpeg)

The reason why it is called the traditional big data architecture is because its positioning is to solve the problems of traditional BI. Simply put, the data analysis business has not undergone any changes, but because of data volume and performance issues, the system cannot be used normally and needs to be upgraded. This type of architecture is to solve this problem. It can be seen that it still retains the ETL action, and enters the data storage through the ETL action.

**Advantages**: Simple and easy to implement as per BI system concerns, the basic methodology has not changed. The only change is the selection of technology, replacing the BI components with the big data architecture.

**Disadvantages**: For big data, there is no such complete Cube architecture under BI. Although kylin is currently available, the limitations of kylin are very obvious. It is far from the flexibility and stability of Cube under BI, so it is flexible in business support The degree is not enough, so for scenes with a large number of reports or complex drilling, too much manual customization is required. At the same time, the architecture is still mainly batch processing and lacks real-time support.

**Applicable scenarios**: Data analysis needs are still dominated by BI scenarios, but due to issues such as data volume and performance, they cannot meet daily use.

## Data Streaming architecture
![](https://miro.medium.com/max/700/1*Hg8ywz7cA5493rVrinUDGQ.png)

As compare to traditional big data architecture, the data streaming architecture is typically radical. The batch processing is directly removed, and the data is processed in the form of streams throughout the entire process. Therefore, there is no ETL at the data access end, and it is replaced with a data channel. The data processed by stream processing is directly pushed to consumers in the form of messages. Although there is a storage part, the storage is more stored in the form of windows, so the storage does not occur in the data lake, but in the peripheral system.

**Advantages**: There is no bloated ETL process, and the effectiveness of the data is very high.

**Disadvantages**: For streaming architecture, there is no batch processing, so data replay and historical statistics cannot be well supported. For offline analysis, only analysis within the window is supported.

**Applicable scenarios**: You can use this as early warning, the different monitoring aspects and the data validity period requirements.

## Lambda architecture

![](https://miro.medium.com/max/700/1*uX2_NDA6GhFC-owKU-Eu4w.png)

Lambda architecture is a pivotal architecture in big data systems. Most architectures are basically Lambda architecture or architectures based on its variants. Lambda’s data channel is divided into two branches real-time streaming and offline. Real-time streaming is basically depend on much of the streaming architecture to ensure its real-time performance, while offline is mainly batch processing to ensure final consistency. In order to ensure the effectiveness of streaming channel processing, incremental calculation is the main auxiliary reference, while the batch processing layer performs full calculations on the data to ensure its final consistency. Therefore, the outermost layer of Lambda has a real-time layer and an offline layer. The action of merging, this action is a very important action in Lambda, the general idea of merging is as follows:

**Advantages**: both real-time and offline, covering the data analysis scenarios very well.

**Disadvantages**: Although the offline layer and the real-time stream face different scenarios, their internal processing logic is the same, so there are a lot of honors and duplicate modules.

**Applicable scenarios**: There are both real-time and offline requirements.

## Kappa architecture

![](https://miro.medium.com/max/700/1*gKcpRXzSPxwkv9kTJTf9Sw.png)

The Kappa architecture is optimized on the basis of Lambda, combining the real-time and streaming parts, and replacing the data channel with a message queue. Kappa architecture uses stream processing as mainstay, but the data is stored at the data lake level. When massive offline analytics and various other multiple calculations is required, the data of the data lake can be transferred through the message queue again. .

**Advantages**: The Kappa architecture solves the redundant part of the Lambda architecture. It is designed with an extraordinary idea of replaying data. The entire architecture is very simple.

**Disadvantages**: Although the Kappa architecture looks concise, it is relatively difficult to implement, especially for the data replay part.

**Applicable scenarios**: It provides features like Lambda architecture.

## Unifield architecture

![](https://miro.medium.com/max/633/1*XUpN1zsGsB1Wp9PIeOzElg.jpeg)

All of the above architectures are mainly focused on massive data processing, while the Unifield architecture is more radical, combining machine learning and data processing. At the core, Unifield is still based on Lambda, but it has been transformed to stream processing. A new machine learning layer has been added to the layer. The data enters and the data lake through the data channel, a new model training part is added and it is used in the streaming layer. This streaming layer uses the model and continuously training the model.

**Advantages**: Unifield architecture provides a set of architecture solutions that combine data analysis and machine learning, which is a very good solution to the problem of how to combine machine learning with data platforms.

**Disadvantages**: Unifield architecture is more complicated to implement. For machine learning architecture, from software package to hardware deployment, there is a very big difference from the data analysis platform, so the difficulty coefficient in the implementation process is higher.

**Applicable scenarios**: There is a large amount of data to be analyzed, and there is a very large demand or plan for the convenience of machine learning.


