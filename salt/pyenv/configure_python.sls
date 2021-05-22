# vim: sts=2 ts=2 sw=2 et ai
{% from "pyenv/map.jinja" import pyenv with context %}

configure_python_version:
  cmd.run:
    - name: eval $(pyenv init --path) && eval $(pyenv init -) && pyenv install {{ pyenv.python.version }}
    - runas: {{ pyenv.user }}
    - env:  
      - PYENV_ROOT: "$HOME/.pyenv"
      - PATH: "$PYENV_ROOT/bin:$PATH"
