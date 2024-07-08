# <div align="center">⚙️ Inception (a [42](https://42perpignan.fr/) project) ⚙️</div>

Subject : [en.subject.pdf](en.subject.pdf)

## Grade
[![drenassi's 42 Inception Score](https://badge42.coday.fr/api/v2/clph33bao098101t6vnzqbe17/project/3663763)](https://github.com/Coday-meric/badge42)

## Introduction
This project is about using **docker** and **docker compose**. We learned how to create and write a Dockerfile, and how to link different docker containers using docker compose.

Here we had to create 3 containers: **nginx**, **mariaDB** and **wordpress**. Then we needed to link them together with a docker-compose.yml file in order to display a wordpress page using a database.

To learn this project, I used a tutorial that I found on the [grademe website](https://tuto.grademe.fr/inception/).

I did this project without any bonus. To see what the bonuses were, refer to the subject.

## Prerequisites
You can modify the .env file to choose your IDs and passwords for the site and the databases.

Replace the USER variable with your computer's username. For example, if your username is bob, replace `USER=drenassi` with `USER=bob`.

You also need to create the volumes folder. For this, go into `/home/` folder, and into your username's folder: `/home/YOUR_USERNAME/`. There, create a folder named `data`.

Now you need to modify the docker-compose.yml file:

At line 51, replace `device: '/home/drenassi/data/mariadb'` with `device: '/home/YOUR_USERNAME/data/mariadb'`.

At line 57, replace `device: '/home/drenassi/data/wordpress'` with `device: '/home/YOUR_USERNAME/data/wordpress'`.

## Usage
Clone the repository and enter in it:
```sh
git clone https://github.com/Arawyn42/42_inception.git && cd 42_inception
```

Please unsure you followed the prerequisites instructions above before compiling the project.

Compile the project:
```sh
make
```

Now you can open a browser and connect to:
```
https://localhost
```

If you want another domain name, you can redirect the domain of your choice into localhost by modifying the `/etc/hosts` file. Be careful with this file and don't forget to cancel changes when you're done.