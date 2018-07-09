# ✉️ mailslurper 🥤

A handy SMTP mail server useful for local and team application development.

> Latest release as of [v1.14.1](https://github.com/mailslurper/mailslurper/releases).

Docker image using MailSlurper which is a handy SMTP mail server useful for local and team application development. You can use this image to send mail to a SMTP host and MailSlurper provides the SMTP server and visual UI. For more information on MailSlurper please see [MailSlurper](http://http://mailslurper.com/).

### Building the image

`docker build -t docker-mailslurper .`

### Running the image

`docker run -it --rm docker-mailslurper`

### MailSlurper Configuration

The image contains a default MailSlurper config file (`config.json`). A custom config file can be used and this needs to be mounted for a container.

Example custom config file `custom-config.json`:

```
{
  "wwwAddress": "0.0.0.0",
  "wwwPort": 8080,
  "serviceAddress": "0.0.0.0",
  "servicePort": 8085,
  "smtpAddress": "0.0.0.0",
  "smtpPort": 2500,
  "dbEngine": "SQLite",
  "dbHost": "",
  "dbPort": 0,
  "dbDatabase": "./mailslurper.db",
  "dbUserName": "",
  "dbPassword": "",
  "maxWorkers": 1000,
  "autoStartBrowser": true,
  "keyFile": "",
  "certFile": "",
  "adminKeyFile": "",
  "adminCertFile": "",
  "authenticationScheme": "",
  "authSecret": "",
  "authSalt": "",
  "authTimeoutInMinutes": 120,
  "credentials": {}
}
```

Run the image using: `docker run -v $PWD/custom-config.json:/opt/mailslurper/config.json -p 2500:2500 -p 8080:8080 -p 8085:8085 marcopas/docker-mailslurper`

### Using Docker Compose

```
version: '3.6'

services:

  mailslurper:
    image: derekahn/mailslurper
    ports:
      - 2500:2500
      - 9000:8080
      - 8085:8085
    volumes:
      - $PWD/custom-config.json:/opt/mailslurper/config.json
```

`docker-compose up --build`
