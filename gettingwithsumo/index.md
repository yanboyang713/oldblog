# Getting started with Simulation of Urban Mobility (SUMO)


## Introduction {#introduction}

The Simulation of Urban Mobility (SUMO) platform is an open source platform that enables simulation of traffic flows in complex environments. There aren’t many tutorials I’ve come across that teach you how to create a complex traffic simulation from start to finish.


## Installation {#installation}

There are multiple ways to [install SUMO](https://sumo.dlr.de/docs/Downloads.php), but I prefer the pip install way, that installs **SUMO** as well as the **python libraries** to interface with SUMO.

```bash
conda create -n SUMO
conda activate SUMO
pip install eclipse-sumo
```

That’s it! Now let’s get to creating your first simulation of traffic flow on a network!


## Simulating traffic in grid networks {#simulating-traffic-in-grid-networks}

In urban planning, grid road networks are pretty common. In SUMO, we setup a 5x5 grid with each road of length 200m, and 3 lanes, as below:
[netgenerate document](https://sumo.dlr.de/docs/netgenerate.html#usage_description)

```bash
netgenerate --grid true --grid.number=5 -L=3 --grid.length=200 --output-file=grid.net.xml
```

Next, we use randomTrips.py located in the tools folder within the SUMO home directory (sumo -&gt; tools), to generate random trips for a certain number of vehicles (200 vehicles in the example below). The begin and end times denote the times during which the vehicles enter the simulation. I’ve chosen 0&amp;1, meaning all vehicles enter the simulation in the first 1 second of the simulation. Period denotes the arrival rate of vehicles.

