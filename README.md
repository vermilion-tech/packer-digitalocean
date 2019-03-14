# packer-digitalocean
- Only supports Ubuntu 18.04 Docker.

- Developed with Packer `1.3.5`.

---


### 0. _(Optional)_ Inspect Packer Template

```bash
$ make inspect
```

or

```bash
$ packer inspect ubuntu-18.04-docker-traefik.json
```

### 1. Export required environmental variables

```bash
$ export AVAILABLE_REGIONS=nyc1,sfo2
$ export DO_TOKEN=****************
```

### 2. Validate Packer Template

```bash
$ make validate
```

or

```bash
$ packer validate ubuntu-18.04-docker-traefik.json
```

### 3. Build Packer Template

```bash
$ make build
```

or

```bash
$ packer build ubuntu-18.04-docker-traefik.json
```
