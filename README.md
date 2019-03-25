# packer-digitalocean
- Developed with Packer `1.3.5`.

---

### 1. Create `variables.json`
```json
{
  "token": "DIGITALOCEAN_API_TOKEN",
  "build_region": "nyc1",
  "snapshot_regions": "nyc1,sfo2"
}
```

### 2. Install Ansible Roles from Ansible Galaxy
```bash
$ make install
or
$ ansible-galaxy install -r ansible/requirements.yml
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
$ packer validate -var-file variables.json images/ubuntu/base.json
```

### 5. Build Packer Template
```bash
$ make build
or
$ packer build -var-file variables.json images/ubuntu/base.json
```
