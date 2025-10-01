# How to start working with this repo?

## 1. Proxy that EC2 in `local computer`

```ssh -N -f -L 8888:localhost:8888 aws-server```

## 2. SSH to EC2 and run jupyter notebook in `EC2 server`

```vim ~/.ssh/authorized_keys```

```ssh aws-server```

```jupyter notebook --no-browser --port=8888```

Open the URL given by the jupyter notebook command  

The URL will be something like ```http://localhost:8888/?token=...```


---

# Installation

## 1. Setup EC2 on AWS

## 2. Clone Repo

```git clone https://github.com/Liny-sia/CityFlow.git```

## 3. Setup anaconda
#### 3.1 ```cd CityFlow```

#### 3.2 ```./install.sh```
This script will install all the required library (cmake, wheel, etc) 
