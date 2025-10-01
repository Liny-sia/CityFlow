# How to start working with this repo?

## 1. SSH to EC2

```ssh aws-server```

## 2. Proxy that EC2 in `local computer`

```ssh -N -f -L 8888:localhost:8888 aws-server```


## 3. Run jupyter notebook in `EC2 server`

```cd CityFlow```

```jupyter notebook --no-browser --port=8888```


## 4. Open the jupyter url that we receive from previous step 

This is the URL that you have to click ```http://localhost:8888/?token=...```, find it inside the terminal once you run the jupyter notebook




# Installation

## 1. Setup EC2 on AWS

## 2. Clone Repo

```git clone https://github.com/Liny-sia/CityFlow.git```

## 3. Setup anaconda
#### 3.1 ```cd CityFlow```

#### 3.2 ```./install.sh```
This script will install all the required library (cmake, wheel, etc) 
