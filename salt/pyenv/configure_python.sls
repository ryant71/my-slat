{% from "pyenv/map.jinja" import pyenv with context %}

configure_python_version:
  cmd.run:
    - name: pyenv install {{ pyenv.python.version }}
    - runas: {{ pyenv.user }}
