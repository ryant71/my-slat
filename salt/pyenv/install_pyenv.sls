# vim: sts=2 ts=2 sw=2 et ai
{% from "pyenv/map.jinja" import pyenv with context %}

dependencies:
  pkg.latest:
    - pkgs:
      - make
      - build-essential
      - libssl-dev
      - zlib1g-dev
      - libbz2-dev
      - libreadline-dev
      - libsqlite3-dev
      - wget
      - curl
      - llvm
      - libncursesw5-dev
      - xz-utils
      - tk-dev
      - libxml2-dev
      - libxmlsec1-dev
      - libffi-dev
      - liblzma-dev

clone_pyenv_repo:
  cmd.run:
    - name: git clone https://github.com/pyenv/pyenv.git /tmp/pyenv
    - runas: {{ pyenv.user }}

install_pyenv:
  cmd.run:
    - name: src/configure && make -C src
    - cwd: /tmp/pyenv
    - runas: {{ pyenv.user }}

configure_shellrc:
  file.append:
    - name: /home/{{ pyenv.user }}/{{ pyenv.shellrc }}
    - runas: {{ pyenv.user }}
    - text:
      - export PYENV_ROOT="$HOME/.pyenv"
      - export PATH="$PYENV_ROOT/bin:$PATH"
      - eval "$(pyenv init --path)"
      - eval "$(pyenv init -)"

configure_shell_profile:
  file.append:
    - name: /home/{{ pyenv.user }}/{{ pyenv.shell_profile }}
    - runas: {{ pyenv.user }}
    - text:
      - export PYENV_ROOT="$HOME/.pyenv"
      - export PATH="$PYENV_ROOT/bin:$PATH"
      - eval "$(pyenv init --path)"
