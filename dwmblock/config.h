static const Block blocks[] = {
  // icon, command, update interval, update signal
  // { " ", "xset -q | grep LED | awk '{ if (substr ($10,5,1) == 1) print \"[RU]\"; else print \"[EN]\"; }'", 0, 1 },
  // { "h", "xset -q | grep LED | awk '{ if (substr ($10,5,1) == 1) print \"[RU]\"; else print \"[EN]\"; }'", 0, 1 },

  {"", "uptime -p", 1, 0},

  // {" " , "curl -s 'wttr.in/Tashkent?format=%t'", 300, 0},
  // { "", "echo $(date +%I:%M) && echo $(date +%p)", 1, 0 },
  // { "", "date '+%I:%M %p'", 1, 0 },
  { "", "date '+%b %d (%a) %I:%M%p'", 1, 0 },
};

static char *delim = " | ";
