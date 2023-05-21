
# Oracle DB for MacOS M1

Instruction and script to install and start Oracle DB for Mac OS with M1 / ARM



## Install
    1. Install brew, open terminal and type:
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

    2. Install colima via brew:
`brew install colima`

    3. Install docker via brew:
`brew install docker`

    4. Run script startdb.sh
`sh ./startdb.sh`

In this point you may need one more additional step, set full permissions access to script:
`sudo chmod +x startdb.sh`

During the first startup, the Internet will be required so that the docker oracle image can be downloaded. This may take several minutes.

After that you will be on the container scope in terminal.

To finish configuration you should add user to db and give him permissions.

    5. When you see "sh-4.4$" type in temrinal:
`sqlplus system/SysPassword1@//localhost/XEPDB1` to connect with db in container.

    6. Add user and set permissions:
`create user demo identified by demo quota unlimited on users;`

`grant connect, resource to demo;`

Thats all!
Now you can connect via Oracle SQL DEVELOPER:

`Database user: demo`

`Password: demo`

`Hostname: localhost`

`PORT: 1521`

`Service name: XEPDB1`




## Start Database
For start db just run in terminal
`sh ./startdb.sh`

When the script finishes running you will be taken to the terminal level of the container.
## Close Containers
To close containers open terminal and type:

`docker stop 21-full`

and after that:

`colima stop`

## Additional informations
Container with oracle db is named: `21-full`

You can check logs of this container: `docker logs -f 21-full`

Docker image link: https://hub.docker.com/r/gvenzl/oracle-xe/

First db user: system  | passowrd: SysPassword1@
