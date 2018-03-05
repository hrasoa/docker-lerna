# Docker lerna

#### 1. Copy files

Login on npm with: ```npm login```, this will create/update your ```~/.npmrc``` file.

Execute these commands inside same folder as the ```Dockerfile```:

```
$ cp -R ~/.ssh .ssh # ssh keys
$ cp ~/.gitconfig . # git user infos 
$ cp ~/.netrc . # git credentials
$ cp ~/.npmrc . # npm credentials.
``` 

#### 2. Configure

Somewhere in a ```docker-compose.yml``` file:

```
  app:
    build: path/to/the/dockerfile/folder
    user: "node"
    working_dir: /home/node/app
    ports:
      - "3000:3000"
    volumes:
      - ./path/to/the/app:/home/node/app
```

#### 3. Build and run

Inside the same folder as the ```docker-compose.yml```:

```
$ docker-compose build app
$ docker-compose run app /bin/sh
~app $ npm init
~app $ lerna init
```

