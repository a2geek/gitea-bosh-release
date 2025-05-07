# Ops Files

These ops files are supplied to help configure Gitea and the action runners.

| Name | Description |
| :--- | :--- |
| `dev.yml` | Used for development to use the latest uploaded version of the Gitea BOSH release. |
| `remove-caddy.yml` | Disable the Caddy-Gitea deployment. Caddy can be problematic, and this allows it to be skipped and not compiled. |
| `scale-action-runners.yml` | Allows scaling of the number of instances (`action_runner_instances`, default `1`) and the capacity (`action_runner_capacity`, default `4`). |
| `set-networks-and-azs-mysql.yml` | Sets the networks (`networks_list`) and azs (`azs_list`) for MySQL. |
| `set-networks-and-azs-postgres.yml` | Sets the networks (`networks_list`) and azs (`azs_list`) for Postgres. |
| `set-networks-and-azs.yml` | Sets the networks (`networks_list`) and azs (`azs_list`) for Gitea components. |
| `use-colocated-postgres-database.yml` | Uses a Postgres database, colocated on the same VM as Gitea. |
| `use-postgres-database.yml` | Uses a Postgres database in a dedicated VM. |
| `use-colocated-mysql-database.yml` | Uses a MySQL database, colocated on the same VM as Gitea. **WARNING:** This uses the [PXC Release](https://github.com/cloudfoundry/pxc-release) and the build disk requirements are somewhere between 20GiB and 40GiB, with 8GiB of memory. |
| `use-mysql-database.yml` | Uses a MySQL database in a dedicated VM. **WARNING:** This uses the [PXC Release](https://github.com/cloudfoundry/pxc-release) and the build disk requirements are somewhere between 20GiB and 40GiB, with 8GiB of memory. |
