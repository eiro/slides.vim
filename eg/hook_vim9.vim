command! Hook exec matchstr(getline("."),"^\\v^[^›]+")
\|call system('scrot')
