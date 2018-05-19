# live questions (slides + tmux + vim)

I was unable to make it to the Journées Perl 2018 so i gave my talk remotely.
As Kai asked what was my slides system, i'll describe it.

first, i started the irc client and joined the channel:

    ii -s irc.perl.org -n eiro
    echo "/join #mongueurs" > ~/irc/irc.freenode.net/in

then i started a terminal (terminology with solarized_light theme)
and run a tmux session with 2 panes:

    tmux \
        new -s jp18 \
            vim readme.slides \;\
        split-window -dbl2 \
            tail -fn0 /home/mc/irc/irc.perl.org/\#mongueurs/out

so the layer is

     ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
     ┃questions from irc         ┃
     ┣━━━━━━━━━━━━━━━━━━━━━━━━━━━┫
     ┃                           ┃
     ┃ journées perl slides      ┃
     ┃                           ┃
     ┃    bullet                ┃
     ┃    bullet                ┃
     ┃                           ┃
     ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

# old school look and feel

## compile and use cool-retro-term

run a docker

    mkdir /tmp/crt
    docker run --rm -it -v /tmp/crt:/code debian:buster

inside the docker

    apt update
    apt install git build-essential \
        qmlscene qt5-qmake qt5-default  \
        qtdeclarative5-dev qml-module-qtquick-controls \
        qml-module-qtgraphicaleffects qml-module-qtquick-dialogs \
        qml-module-qtquick-localstorage qml-module-qtquick-window2 \
        qml-module-qt-labs-settings qml-module-qt-labs-folderlistmodel
    git clone --recursive https://github.com/Swordfish90/cool-retro-term.git
    cd cool-retro-term/
    qmake && make

while compiling, install runtime dependencies on your system

    sudo aptitude install \
        qml-module-qt-labs-folderlistmodel \
        qml-module-qt-labs-settings \
        qml-module-qtquick-dialogs \
        qml-module-qtquick-localstorage \
        qml-module-qtquick-controls


when everything is ready

    # choose your own ~/local/bin :)
    cp /tmp/crt/cool-retro-term/cool-retro-term ~/local/bin
    rehash
    cool-retro-term

