FROM python:latest 

COPY xterm-256color-italic.terminfo /root
RUN tic /root/xterm-256color-italic.terminfo
ENV TERM=xterm-256color-italic

RUN apt-get update && apt-get -y upgrade && apt-get -y install wget zsh rcm git

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN wget -O /tmp/nvim-linux64.deb https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb && apt-get install -y /tmp/nvim-linux64.deb
RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN python -m pip install -U jedi-language-server

CMD /usr/bin/zsh
