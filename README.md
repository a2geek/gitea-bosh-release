# Gitea BOSH Release

This is a BOSH release to deploy Gitea along with the specified number of action runners via [act_runner](https://gitea.com/gitea/act_runner) and support for Gitea pages via [caddy-gitea](https://github.com/42wim/caddy-gitea).

The current configuration is to run the `act_runner` via BPM and bypass Docker completely. (It appears that Docker is just a container for the action to run in -- that is, the `act_runner` container, so there is little benefit to Docker over any other container.) The `git` CLI is installed on both the Gitea and the runner nodes, while Node v20 is installed on the runner nodes (as this is required for most actions).

"caddy-gitea" has a dependency on Caddy, so the build requires internet access. This builds the caddy tooling, which then allows caddy-gitea to be built. Be warned that due to the online nature of this build, the Go dependencies may change and cause grief. (Hence, the dependency is an option instead of a default.)

Note that Gitea is deployed with the `INSTALL_LOCK` set to `true`. This means that you cannot change configuration options from the user interface. This is due to the fact that any deployment would have to (a) either over-writes the `app.ini` file, (b) ignore any changes, or (c) somehow try to merge any updates. Since the `app.ini` file is just a simple template, adding additional options to it should relatively straight forward.

The server certificate is currently a generated self-signed certificate. Again, it should be relatively simple to allow a custom certificate to be specified. Note that the `.pem` files are already present, so any certificate should be able to be used by setting `gitea_web.certificate` and `gitea_web.private_key`. Currently `gitea_web` is a BOSH generated certificate.

## Configuration

Configuration is fairly simple at this time. Required variables (say, in `vars.yml`):

```yaml
---
gitea_server_domain: <gitea domain, ex: gitea.gdc.lan>
gitea_admin_username: <primary admin user>
gitea_admin_email: <primary admin email>
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
