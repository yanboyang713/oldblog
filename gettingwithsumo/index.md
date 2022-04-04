# Getting started with Simulation of Urban Mobility (SUMO)


## Introduction {#introduction}

The Simulation of Urban Mobility (SUMO) platform is an open source platform that enables simulation of traffic flows in complex environments. There aren’t many tutorials I’ve come across that teach you how to create a complex traffic simulation from start to finish.


## Installation {#installation}

There are multiple ways to [install SUMO](https://sumo.dlr.de/docs/Downloads.php), but I prefer the pip install way, that installs **SUMO** as well as the **python libraries** to interface with SUMO.

```bash
conda create -n SUMO
conda activate SUMO
pip install eclipse-sumo
pip install traci
pip install pytz
pip install pandas
pip install openpyxl
```

That’s it! Now let’s get to creating your first simulation of traffic flow on a network!


## Simulating traffic in grid networks {#simulating-traffic-in-grid-networks}


## Generate Map/networks {#generate-map-networks}

In urban planning, grid road networks are pretty common. In SUMO, we setup a 5x5 grid with each road of length 200m, and 3 lanes, as below:
[netgenerate document](https://sumo.dlr.de/docs/netgenerate.html#usage_description)

```bash
netgenerate --grid true --grid.number=5 -L=3 --grid.length=200 --output-file=grid.net.xml
```


## Generate Random Trip/Flow {#generate-random-trip-flow}

Next, we use randomTrips.py located in the tools folder within the SUMO home directory (**sumo** -&gt; **tools**), to generate random trips for a certain number of vehicles (200 vehicles in the example below). The begin and end times denote the times during which the vehicles enter the simulation. I’ve chosen 0&amp;1, meaning all vehicles enter the simulation in the first 1 second of the simulation. Period denotes the arrival rate of vehicles.

```bash
../sumo/tools/randomTrips.py -n grid.net.xml -o flows.xml -b 0 -e 1 -p 1 --flows 200
```


## Generate the Routes {#generate-the-routes}

Next, we generate the routes taken by individual vehicles using SUMO’s [jtrrouter](https://sumo.dlr.de/docs/jtrrouter.html), between times 0 to 10000.

```bash
jtrrouter --route-files flows.xml --net-file grid.net.xml --output-file grid.rou.xml --begin 0 --end 100 --accept-all-destinations true
```

Finally, for simplicity we want to maintain a constant density. The most obvious way to do this is by vehicles driving randomly, and not exiting the simulation. For this, we use the Manhattan traffic model, where vehicles encountering an intersection choose to either go straight, left, or right based on set probabilities. By default in SUMO, vehicles exit the simulation once they reach their destination. However, SUMO has an implementation of the Manhattan model, using a continuous rerouter python script.

```bash
../sumo/tools/generateContinuousRerouters.py -n grid.net.xml --end 100 -o rerouter.add.xml
```


## SUMO configuration file {#sumo-configuration-file}

Next, we create a sumo config file, in order to run the simulation in SUMO, which is basically a .xml file with certain attributes, containing the names of the network file, route file, and additional rerouting file for vehicles to stay in the simulation until the simulation is completed. We define an output file: **grid.sumocfg**, to store the detailed vehicle information during the traffic simulation.

```bash
nvim grid.sumocfg
```

```xml
<configuration>
    <input>
        <net-file value="grid.net.xml"/>
        <route-files value="grid.rou.xml"/>
        <additional-files value="rerouter.add.xml"/>
    </input>
    <time>
        <begin value="0"/>
        <end value="10000"/>
    </time>
    <output>
        <fcd-output value="grid.output.xml"/>
    </output>
</configuration>
```

Finally, we run the simulation in the terminal as below. Period denotes the time interval at which data is saved — 100 denotes saving vehicular information i.e. speed and position, every 100 timesteps.

[sumo-gui](https://sumo.dlr.de/docs/sumo-gui.html) document.

```bash
sumo-gui -c ./grid.sumocfg --device.fcd.period 100
```

Running this pops up the SUMO GUI, where you can see the entire simulation!

Vehicle colors indicate their speeds from slowest (red) to fastest (green).


## Simulating Realistic Traffic {#simulating-realistic-traffic}

