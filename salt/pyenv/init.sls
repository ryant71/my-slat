# vim: sts=2 ts=2 sw=2 et ai
{% from "pyenv/map.jinja" import pyenv with context %}

include:
{% if pyenv.shellrc == '.zshrc' %}
  - pyenv.install_zsh
{% endif %}
  - pyenv.install_pyenv
  - pyenv.configure_python
