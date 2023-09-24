<table align="center"><tr><td align="center" width="9999">
<img src="icons/docker_jenkins.png" align="center" width="150" alt="Docker icon">

# jenkins-docker-agent

</td></tr></table>

Simple docker agent for Jenkins. Use this docker image mainly as a docker agent (node) in Jenkins environment.
This docker image instantiated containers running proccess (`CMD`) is sshd daemon.

# Build image

```sh
docker image build --network host --pull --tag jenkins-docker-agent:1.0 .
```

# Run container

```sh
docker container run -d --name jenkins-agent --restart always -p 38787:22 jenkins-docker-agent:1.0
```


