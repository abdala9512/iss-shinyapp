# iss-shinyapp

International Space Station Current position


![iss-screenshot](https://github-images-9512.s3.amazonaws.com/iss-app/iss-screenshot.PNG)


# API
http://open-notify.org/Open-Notify-API/ISS-Location-Now/

# Docker Hub
https://hub.docker.com/repository/docker/abdala9512/iss-shiny

# Docker image building

```
docker build . -t iss-shiny:latest
```

# Docker Run

```
docker container run --rm -p 3838:3838 \
				 -v /home/ec2-user/rstudio_docker/:/srv/shiny-server/rstudio_docker  \
				 -v /home/ec2-user/log/shiny-server:/var/log/shiny-server abdala9512/iss-shiny
```

# Contact
You can contribute or send me an email to miguel.arquez12@gmail.com :)

