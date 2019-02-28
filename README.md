# packer-digitalocean
- Only supports Ubuntu 18.04 Docker.

- Developed with Packer `1.3.4`.

---


### 0. _(Optional)_ Inspect Packer Template

```bash
$ make inspect
```

or

```bash
$ packer inspect ubuntu-18.04-docker.json
```

### 1. Create a `variables.json` file with `api_token` variable.

```bash
$ vim variables.json

{
  "api_token": "digitalocean_api_token"
}
```

### 2. Validate Packer Template

```bash
$ make validate
```

or

```bash
$ packer validate \
    -var-file variables.json \
    ubuntu-18.04-docker.json
```

### 3. Build Packer Template

```bash
$ make build
```

or

```bash
$ packer build \
    -var-file variables.json \
    ubuntu-18.04-docker.json
```
