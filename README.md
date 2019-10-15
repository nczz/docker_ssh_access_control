### Repo Info.

SSH service Docker image source.

> You need to change the key to place in container.
> > `ssh-keygen -b 4096 -f access.key` 

Build method:

```bash
docker build -t WHAT_EVER_YOU_WANT .
```

Run:

```bash
docker run -d --restart=always -v /path/to/HOST_FOLDER:/root/publish_html -p HOST_PORT_NUM:22 --name SSH_CLIENT WHAT_EVER_YOU_WANT
```

Edit:

```bash
docker exec -it SSH_CLIENT bash
vi /root/.ssh/authorized_keys
```
