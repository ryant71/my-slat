# vim: sts=2 ts=2 sw=2 et ai
{% from "pyenv/map.jinja" import pyenv with context %}
{% set current_path = salt['environ.get']('PATH', '/bin:/usr/bin') %}

configure_python_version:
  cmd.run:
    - name: eval $(pyenv init --path) && eval $(pyenv init -) && pyenv install {{ pyenv.python.version }}
    - runas: {{ pyenv.user }}
    - env:  
      - PATH: {{ [current_path, '~/.pyenv/bin']|join(':') }}
