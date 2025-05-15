# Ops Files

These ops files are supplied to help configure Gitea and the action runners.

| Name | Description |
| :--- | :--- |
| `dev.yml` | Used for development to use the latest uploaded version of the Gitea BOSH release. |
| `enable-action-runners.yml` | Used to enable action runners for activation of local actions. |
| `enable-caddy.yml` | Used to enable caddy-gitea for "pages" capability. Set `pages_domain` for publishing address. **WARNING:** Caddy has an odd custom build; am currently specifying versions, but do not be surprised if some software version has changed anyway and it doesn't compile. Please drop a ticket or PR if this occurs. |
| `scale-action-runners.yml` | Allows scaling of the number of instances (`action_runner_instances`, default `1`) and the capacity (`action_runner_capacity`, default `4`). |
| `set-networks-and-azs-action-runners.yml` | Sets the networks (`networks_list`) and azs (`azs_list`) for Action Runners. |
| `set-networks-and-azs-caddy.yml` | Sets the networks (`networks_list`) and azs (`azs_list`) for Caddy. |
| `set-networks-and-azs-gitea.yml` | Sets the networks (`networks_list`) and azs (`azs_list`) for Gitea. |
| `set-networks-and-azs-mysql.yml` | Sets the networks (`networks_list`) and azs (`azs_list`) for MySQL. |
| `set-networks-and-azs-postgres.yml` | Sets the networks (`networks_list`) and azs (`azs_list`) for Postgres. |
| `use-colocated-postgres-database.yml` | Uses a Postgres database, colocated on the same VM as Gitea. |
| `use-postgres-database.yml` | Uses a Postgres database in a dedicated VM. |
| `use-colocated-mysql-database.yml` | Uses a MySQL database, colocated on the same VM as Gitea. **WARNING:** This uses the [PXC Release](https://github.com/cloudfoundry/pxc-release) and the build disk requirements are somewhere between 20GiB and 40GiB, with 8GiB of memory. |
| `use-mysql-database.yml` | Uses a MySQL database in a dedicated VM. **WARNING:** This uses the [PXC Release](https://github.com/cloudfoundry/pxc-release) and the build disk requirements are somewhere between 20GiB and 40GiB, with 8GiB of memory. |
