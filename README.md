# packer-digitalocean
- Developed with Packer `1.3.5`.

---

### 1. Export required environmental variables

```bash
$ export AVAILABLE_REGIONS=nyc1,sfo2
$ export DO_TOKEN=****************
```

### 2. Install Roles from Ansible Galaxy
```bash
$ make install
or
$ ansible-galaxy install kadenlnelson.ansible_role_ubuntu_base
$ ansible-galaxy install kadenlnelson.ansible_role_docker_traefik
```

### 3. _(Optional)_ Inspect Packer Images
```bash
$ make inspect
or
$ packer inspect images/ubuntu/base.json
```

### 4. Validate Packer Template
```bash
$ make validate
or
$ packer validate images/ubuntu/base.json
```

### 5. Build Packer Template
```bash
$ make build
or
$ packer build images/ubuntu/base.json
```
