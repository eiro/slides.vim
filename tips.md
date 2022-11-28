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

# cyberpunk theme

cool-retro-term¹ emulates the old terminals, even hardware glitches.

    apt install cool-retro-term

I made a theme for this: check `myretrofuture.json`.

¹: https://github.com/Swordfish90/cool-retro-term

