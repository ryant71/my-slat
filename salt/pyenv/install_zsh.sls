# vim: sts=2 ts=2 sw=2 et ai
{% from "pyenv/map.jinja" import pyenv with context %}

zsh:
  pkg.latest

user_present:
  user.present:
    - name: {{ pyenv.user }}

make_zsh_default:
  cmd.run:
    - name: chsh -s /bin/zsh {{ pyenv.user }}
