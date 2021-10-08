# Beginning Explore artificial intelligence and computer vision


## What is artificial intelligence? {#what-is-artificial-intelligence}


### Explore into artificial intelligence {#explore-into-artificial-intelligence}

For the definition of artificial intelligence, academic research area always have different understandings. The widely accepted definition is:

-   **Artificial intelligence is the use of machines to simulate human cognitive abilities technology**.

Artificial intelligence involves a wide range of insights, learning, reasoning and decision-making.

From the perspective of industry application, the core ability of artificial intelligence ability is to make judgments or predictions based on given input.

The rise of deep learning and the three booms of AI.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633594626/cv/MLThreeBooms%5Fxnexn3.png)

The Turing test, the cornerstone of artificial intelligence
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633607665/cv/turingTest%5F000%5Fwuxoka.png)


### Three core elements of artificial intelligence {#three-core-elements-of-artificial-intelligence}

Three core elements of AI: data, algorithm and compute resource.
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633609084/cv/threeCoreElements%5Fpj0xlg.png)

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633609181/cv/threeCoreElementsOne%5Fvn5zm9.png" >}}


#### Data {#data}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633607997/cv/data%5Fyoauah.png" >}}


#### Algorith {#algorith}

When you give a computer a task, you tell it not only what to do, but how to do it and a set of instructions about how to do it is called an algorithm.

-   Traditional algorithms -- traversal
-   Smarter algorithms -- gradient descent
-   More complex algorithms -- machine learning


#### Compute Resource/Power {#compute-resource-power}

Breakthrough in computing power -- traditional CPU and new computing acceleration technology.

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633608323/cv/cpu%5Ftkdhfn.png" >}}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633608393/cv/fpga%5Fbsknu0.png" >}}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633608486/cv/compare%5Fou1gus.png" >}}

smart chip
![](https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633608633/cv/smartChip%5Fev498y.png)


### Artificial intelligence technonly relationship {#artificial-intelligence-technonly-relationship}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633609345/cv/relationship%5Fnugk48.png" >}}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633673844/cv/AIrelationship%5Fmyqcj6.png" >}}

-   **Machine learning**: a way to achieve artificial intelligence

It is a multi-field interdisciplinary subject, involving probability theory, statistics, approximation theory, convex analysis, algorithm complexity theory and other subjects. Machine learning is the core of artificial intelligence, the fundamental way to make computers intelligent, and its applications are widespread
In all fields of artificial intelligence, it mainly uses induction and synthesis rather than deduction.

-   **Deep learning**: a technology that implements machine learning.

It uses a deep neural network to process the model more complex, so that the model has a deeper understanding of the data. It is a method of machine learning based on data representation learning. The motivation is to establish and simulate the human brain to analyzing the learning neural network, it imitates the mechanism of the human brain to interpret data, such as images, sounds and texts. The essence of deep learning is to learn more by building a machine learning model with many hidden layers and massive training data. Use the features to ultimately improve the accuracy of classification or prediction.

-   **Artificial neural network**: a machine learning algorithm

Neural networks generally have input layer -> hidden layer -> output layer. Generally speaking, a neural network with more than two hidden layers is called a deep neural network. Deep learning is a machine that uses a deep architecture like a deep neural network. Learn method.


#### What is machine Learning {#what-is-machine-learning}

**Artificial intelligence is a technology that uses machines to simulate human cognitive abilities**.

-   Traditional artificial intelligence methods: logical reasoning, expert systems (answering questions based on manually defined rules), etc.;

-   Contemporary artificial intelligence generally acquires the ability to make predictions and judgments through learning-machine learning

<!--listend-->

```text
Normal cat: round head, short face, five fingers on the forelimbs, four toes on the hind limbs, with sharp and curved claws at the ends of the toes,
The claws can stretch. Nocturnal. ---Baidu Encyclopedia
```

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633610156/cv/ml1%5Fzrobow.png" >}}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633610156/cv/ml2%5Flb82ew.png" >}}


#### Typical machine learning process {#typical-machine-learning-process}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633610289/cv/ml3%5Ftzhdmh.png" >}}


#### What is Neural Network {#what-is-neural-network}

<!--list-separator-->

-  How do people think? --Biological Neural Network

    {{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633610519/cv/neuron%5Flhvbvb.png" >}}

    sensor:

    1.  External stimulation passes through nerve endings and turns converted into electrical signals, transduced to nerve cells (Also called neuron)
    2.  Numerous neurons form the nerve center
    3.  The nerve center integrates various signals to do judgement.
    4.  According to the instructions of the nerve center, the human body respond to external stimuli.

<!--list-separator-->

-  How does the machine think? --Artificial neural networks

    {{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633672744/cv/arNeuron%5Fawz0bq.png" >}}

    Artificial neuron

    Input: x1,x2,x3
    Output: output
    Simplified model: It is agreed that each input has only two possible 1 or 0

    All inputs are 1, which means that various conditions are met, and the output is 1;

    All inputs are 0, which means that the condition is not true, and the output is 0

    ```text
    Is watermelon good or bad?
    Color: green; root: curled up; knock: voiced thoughts. ---Good melon
    ```

    ```text
    Family Spring Outing?
    Price: high and low; weather: good or bad; family: can you travel
    ```

<!--list-separator-->

-  The logical architecture of the neural network

    {{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633673214/cv/architectureNeuralNetworkOne%5Fsijbou.png" >}}

    {{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633673216/cv/architectureNeuralNetworkTwo%5Fl4dsh1.png" >}}

    {{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633673225/cv/architectureNeuralNetworkThree%5Fcuepcr.png" >}}


#### What is Deep Learning {#what-is-deep-learning}

Deep neural network & deep learning

-   The traditional neural network has developed to a situation with multiple hidden layers,

-   Neural networks with multiple hidden layers are called deep neural networks, and machine learning research based on deep neural networks is called deep learning.

    {{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633673700/cv/DeepLearning%5Ftq9n1e.png" >}}


### The foreseeable future of artificial intelligence {#the-foreseeable-future-of-artificial-intelligence}


#### Computer vision {#computer-vision}

-   Typical technology:

Face detection, tracking, recognition and attribute analysis, pedestrian and vehicle detection, tracking, recognition and attribute analysis, text detection and recognition, object detection and recognition

-   Typical application:

Face authentication, intelligent transportation, robot vision (such as drones), image search engine, image and video understanding, image and video beautification


#### Speech Recognition {#speech-recognition}

-   Typical technology:

Voice recognition, voiceprint recognition, multi-microphone array system

-   Typical application:

Voice input, voice control, intelligent assistant, machine translation, robot hearing


#### natural language {#natural-language}

-   Typical technology:

Words and sentences embedded, semantic modeling

-   Typical application:

Chatbot, smart assistant, smart customer service, video Frequency understanding, machine translation


## Computer vision (CV) {#computer-vision--cv}


### What is CV {#what-is-cv}

Several more rigorous definitions:

-   "Construct a clear and meaningful description of the objective objects in the image" (Ballard & Brown, 1982)

-   "Calculate the characteristics of the three-dimensional world from one or more digital images" (Trucco & Verri, 1998)

-   "Based on perceptual images to make useful decisions for objective objects and scenes" (Sockman & Shapiro, 2001)

Overview in one sentence:

It means that the computer has the ability to see, know, and think. It can be said that the computer has vision, that is, computer vision.


### Deep learning and CV {#deep-learning-and-cv}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633674756/cv/computerVisionOne%5Fkjgmyf.png" >}}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633674755/cv/computerVisionTwo%5Fl2tvqa.png" >}}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633674756/cv/computerVisionThree%5Frdqpta.png" >}}


### Application of CV {#application-of-cv}


#### Image Classification {#image-classification}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633678185/cv/classificationOne%5Flqnjcd.png" >}}

Image Classification - Neural Neural Network (CNN)

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633678184/cv/classificationTwo%5Fpu6kuc.png" >}}

Linear rectifier layer--RELU

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633678183/cv/classificationThree%5Fzhnzgk.png" >}}

Pooling layer-pool

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633678183/cv/classificationFour%5Fk9lyy9.png" >}}


#### Target Detection {#target-detection}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633678492/cv/detactionOne%5Frsz53f.png" >}}

R-CNN

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633678492/cv/detactionTwo%5Flnellb.png" >}}


#### Target Tracking {#target-tracking}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633678587/cv/tracking%5Frjkb2z.png" >}}


#### Semantic Image Segmentation {#semantic-image-segmentation}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633678681/cv/SegmentationOne%5Fzfgix9.png" >}}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633678681/cv/SegmentationTwo%5Forkdal.png" >}}


#### Instance Segmentation {#instance-segmentation}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633678767/cv/instanceOne%5Fduswl8.png" >}}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633678767/cv/instanceTwo%5Fosehjy.png" >}}


### CV skills tree construction {#cv-skills-tree-construction}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633680105/cv/treeOne%5Fkbmiwg.png" >}}

{{< figure src="https://res.cloudinary.com/dkvj6mo4c/image/upload/v1633680106/cv/treeTwo%5Fwchdqb.png" >}}

