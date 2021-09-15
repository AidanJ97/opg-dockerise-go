# Technical challenge - Aidan Johnson

## My Approach

### Initial setup
- Made a fork of the repo and cloned locally.
- Installed Golang and Docker. I opted to use my personal machine and not work machine so that these steps would be necessary.
- Ran the api as is using `go run ./app/main.go` to check everything was working as expected.

### Setting up my environment variables   
- Initially I made an `.env` file to hold my environment variables, however `os package` does not support loading environment variables this way.
    - Realising this I temporarily set the environment variable `APP_STATUS` using `os.Setenv()` function to test.
    - I kept my `.env` as I would later use this when setting environment variables in docker.
- Added `.gitignore` and added `.env` to this.
    - This isn't necessary but is good practice if we were to be storing secret keys, DB variables, etc.

### Dockerising
- As I was setting up on my personal windows machine as opposed to my work mac, it was necessary to enable "Windows Subsystem for Linux" and then use "WSL2".
    - After doing this my Docker engine was successfully running.
- Next I put together a `Dockerfile` following the Docker docs for Go, I opted for a multi-stage build as this would result in a smaller image.
- Next I added `docker-compose.yml`. This isn't necessary for a single container application but is cleaner and allowed me to call my `.env`.
    - Calling environment variables from a git ignored file and not setting them in a docker configurations prevents exposing them in the repo if it were to be publicly visible.

## Running my dockerised application
- After cloning the repo, copy `.env.example` and rename the copy `.env`.
- In `.env` set `APP_STATUS` to `OK`.
- Boot up Docker and ensure the engine is running.
- In the root of the project folder run `docker-compose up` in a command window.
- The container will be now available at `http://localhost:8080/`.
- Back in the command window `ctrl+c` to stop the container.
