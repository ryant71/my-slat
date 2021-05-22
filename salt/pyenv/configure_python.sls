# vim: sts=2 ts=2 sw=2 et ai
{% from "pyenv/map.jinja" import pyenv with context %}

configure_python_version:
  cmd.run:
    - name: source {{ pyenv.shellrc }} && pyenv install {{ pyenv.python.version }}
    - runas: {{ pyenv.user }}
    - cwd: /home/{{ pyenv.user }}
    - shell: {{ pyenv.shell }}
