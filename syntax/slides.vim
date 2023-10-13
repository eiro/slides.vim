syn region Emphasize  matchgroup=emphasizeConceal  start=" " end=" " oneline concealends
syn match Hook        "^.*\ze›" conceal
syn match Slidetitle  "› .*"
