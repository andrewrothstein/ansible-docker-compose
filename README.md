andrewrothstein.docker-compose
===========================
![Build Status](https://github.com/andrewrothstein/ansible-docker-compose/actions/workflows/build.yml/badge.svg)

Installs [docker-compose](https://github.com/docker/compose).

Requirements
------------

See [meta/main.yml](meta/main.yml)

Role Variables
--------------

See [defaults/main.yml](defaults/main.yml)

Dependencies
------------

See [meta/main.yml](meta/main.yml)

Example Playbook
----------------

```yml
- hosts: servers
  roles:
    - andrewrothstein.docker-compose
```

License
-------

MIT

Author Information
------------------

Andrew Rothstein <andrew.rothstein@gmail.com>
