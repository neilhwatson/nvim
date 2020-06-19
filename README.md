# Vim build, install, and configure

Build, install, and configure Vim for everyday use. This is for my use so it's
very opinionated but you can fork and adapt it to your own needs.

```shell
cd ansible
ansible-playbook playbook.yaml -K
```

## Tags for separate build and config runs

    ansible-playbook playbook.yaml -K --tags [build|config]

