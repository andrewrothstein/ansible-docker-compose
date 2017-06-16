andrewrothstein.docker-compose
===========================
[![Build Status](https://travis-ci.org/andrewrothstein/ansible-docker-compose.svg?branch=master)](https://travis-ci.org/andrewrothstein/ansible-docker-compose)

A role for installing [docker-compose](https://github.com/docker/compose)

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
