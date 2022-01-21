# slides.vim companions
svtplus  () gawk '/^›/ {printf "%-'${1:-80}'\n",$0 ; next } 1'
svtminus () sed '/^› /s/ *$//'
