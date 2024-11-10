# Gitea BOSH Release

This is a BOSH release to deploy Gitea along with the specified number of action runners and support for Gitea pages via [caddy-gitea](https://github.com/42wim/caddy-gitea).

The current configuration is to run the `act_runner` via BPM and bypass Docker completely. (It appears that Docker just gives a container for the action to run in -- that is, the `act_runner` container, so there is little benefit.) The `git` CLI is installed on both the Gitea and the runner nodes, while Node v20 is installed on the runner nodes (hypothetically, this is required for most actions).

Note that Gitea is deployed with the `INSTALL_LOCK` set to `true`. This means that you cannot change much of the configuration options from the user interface. This is due to the fact that any deployment either over-writes the `app.ini` file, ignores any changes, or somehow tries to merge it. Since the `app.ini` file is just a template, adding options to it should relatively straight forward.

The server certificate is currently a generated self-signed certificate. Again, it should be relatively simple to allow a custom certificate to be specified. Note that the `.pem` files are already present, so any certificate should be able to be used by setting `gitea_web.certificate` and `gitea_web.private_key`. Currently `gitea_web` is a BOSH generated certificate.

## Configuration

Configuration is fairly simple at this time. Required variables (say, in `vars.yml`):

```yaml
---
gitea_server_domain: <gitea domain, ex: gitea.gdc.lan>
gitea_admin_username: <primary admin user>
gitea_admin_email: <primary admin email>
pages_domain: <pages domain, ex: pages.gdc.lan>
```

The primary admin will have the default pasword of `changeme` and Gitea will require the admin user to change the password.

## Ops Files

See the ops files [README](ops/README.md).

## Deployment

This should be a relatively simple deployment:

```bash
bosh -d gitea deploy manifest.yml --vars-file vars.yml
```

## Contributing

Pull requests are welcome!
