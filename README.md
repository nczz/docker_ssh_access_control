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
docker run -d -v path/to/share:/home/root/share -p 1234:22 WHAT_EVER_YOU_WANT
```
