# Ops Files

These ops files are supplied to help configure Gitea and the action runners.

| Name | Description |
| :--- | :--- |
| `dev.yml` | Used for development to use the latest uploaded version of the Gitea BOSH release. |
| `scale-action-runners.yml` | Allows scaling of the number of instances (`action_runner_instances`, default `1`) and the capacity (`action_runner_capacity`, default `4`). |
| `use-colocated-postgres-database.yml` | Uses a Postgres database, colocated on the same VM as Gitea. |