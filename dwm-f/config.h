#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
#define CMD(...) { .v = (const char*[]){ __VA_ARGS__, NULL } }


// OPTIONS
static const unsigned int borderpx = 5; // border size
static const unsigned int snap = 50; // snap pixel
static const unsigned int gappih = 10; // horiz inner gap
static const unsigned int gappiv = 10; // vert inner gap
static const unsigned int gappoh = 10; // horiz outer gap
static const unsigned int gappov = 10; // vert outer gap
static const int smartgaps_fact = 1; // gap factor when there is only one client
static const int showbar = 1; // 0 means no bar
static const int topbar = 1; // 0 means bottom bar
// status is to be shown on: -1 (all monitors), 0 (a specific monitor by index), 'A' (active monitor)
static const int statusmon = 'A';
static const unsigned int systrayspacing = 2; // systray spacing
static const int showsystray = 1; // 0 means systray


// FONTS
static const char *fonts[] = {
  "JetBrains Mono NF:size=16:style=bold",
};
static const char dmenufont[] = "JetBrains Mono NF:size=16:style=bold";


// COLORS
static char c000000[] = "#000000"; // placeholder value

static char normfgcolor[] = "#d3c6aa";
static char normbgcolor[] = "#272e33";
static char normbordercolor[] = "#565761";
static char normfloatcolor[] = "#a7c080";

static char selfgcolor[] = "#e4e4e0";
static char selbgcolor[] = "#a7c080";
static char selbordercolor[] = "#a7c080";
static char selfloatcolor[] = "#a7c080";

static char titlenormfgcolor[] = "#d3c6aa";
static char titlenormbgcolor[] = "#272e33";
static char titlenormbordercolor[] = "#44475a";
static char titlenormfloatcolor[] = "#db8fd9";

static char titleselfgcolor[] = "#e4e4e0";
static char titleselbgcolor[] = "#a7c080";
static char titleselbordercolor[] = "#a7c080";
static char titleselfloatcolor[] = "#a7c080";

static char tagsnormfgcolor[] = "#d3c6aa";
static char tagsnormbgcolor[] = "#272e33";
static char tagsnormbordercolor[]        = "#444444";
static char tagsnormfloatcolor[] = "#db8fd9";

static char tagsselfgcolor[] = "#444444";
static char tagsselbgcolor[] = "#a7c080";
static char tagsselbordercolor[] = "#a7c080";
static char tagsselfloatcolor[] = "#a7c080";

static char hidnormfgcolor[] = "#a7c080";
static char hidselfgcolor[] = "#6272a4";
static char hidnormbgcolor[] = "#272e33";
static char hidselbgcolor[] = "#272e33";

static char urgfgcolor[] = "#d3c6aa";
static char urgbgcolor[] = "#272e33";
static char urgbordercolor[] = "#e67e80";
static char urgfloatcolor[] = "#db8fd9";

static char *colors[][ColCount] = {
  //                       fg                bg                border                float
  [SchemeNorm]         = { normfgcolor,      normbgcolor,      normbordercolor,      normfloatcolor },
  [SchemeSel]          = { selfgcolor,       selbgcolor,       selbordercolor,       selfloatcolor },
  [SchemeTitleNorm]    = { titlenormfgcolor, titlenormbgcolor, titlenormbordercolor, titlenormfloatcolor },
  [SchemeTitleSel]     = { titleselfgcolor,  titleselbgcolor,  titleselbordercolor,  titleselfloatcolor },
  [SchemeTagsNorm]     = { tagsnormfgcolor,  tagsnormbgcolor,  tagsnormbordercolor,  tagsnormfloatcolor },
  [SchemeTagsSel]      = { tagsselfgcolor,   tagsselbgcolor,   tagsselbordercolor,   tagsselfloatcolor },
  [SchemeHidNorm]      = { hidnormfgcolor,   hidnormbgcolor,   c000000,              c000000 },
  [SchemeHidSel]       = { hidselfgcolor,    hidselbgcolor,    c000000,              c000000 },
  [SchemeUrg]          = { urgfgcolor,       urgbgcolor,       urgbordercolor,       urgfloatcolor },
};


// AUTOSTART
static const char *const autostart[] = {
  "xrandr", "--output", "None-1", "--mode", "1920x1080", "--rate", "165", NULL,
  "setxkbmap", "us,ru", "-option", "grp:win_space_toggle", NULL,
  "xset", "r", "rate", "275", "30", NULL,
  "feh", "--bg-scale", "/home/whyhilde/dwm-f/assets/wallpaper.png", "--no-fehbg", NULL,
// dwmblocks &
// dwm

	"alacritty", NULL,
	NULL /* terminate */
};


// TAGS
static char *tagicons[][NUMTAGS] = {
  [DEFAULT_TAGS] = { "I", "II", "III", "IV", "V" },
};


// RULES
static const Rule rules[] = {
  RULE(.wintype = WTYPE "DIALOG", .isfloating = 1)
  RULE(.wintype = WTYPE "UTILITY", .isfloating = 1)
  RULE(.wintype = WTYPE "TOOLBAR", .isfloating = 1)
  RULE(.wintype = WTYPE "SPLASH", .isfloating = 1)
  RULE(.class = "zen", .tags = 1 << 2)
  RULE(.title = "search", .isfloating = 1)
};

/* Bar rules allow you to configure what is shown where on the bar, as well as
 * introducing your own bar modules.
 *
 *    monitor:
 *      -1  show on all monitors
 *       0  show on monitor 0
 *      'A' show on active monitor (i.e. focused / selected) (or just -1 for active?)
 *    bar - bar index, 0 is default, 1 is extrabar
 *    alignment - how the module is aligned compared to other modules
 *    widthfunc, drawfunc, clickfunc - providing bar module width, draw and click functions
 *    name - does nothing, intended for visual clue and for logging / debugging
 */
static const BarRule barrules[] = {
  // monitor, bar, alignment, widthfunc, drawfunc, clickfunc, hoverfunc, name
	{ -1, 0, BAR_ALIGN_LEFT, width_tags, draw_tags, click_tags, hover_tags, "tags" },
	{ 0, 0, BAR_ALIGN_RIGHT, width_systray, draw_systray, click_systray, NULL, "systray" },
	{ -1, 0, BAR_ALIGN_LEFT, width_ltsymbol, draw_ltsymbol, click_ltsymbol, NULL, "layout" },
	{ statusmon, 0, BAR_ALIGN_RIGHT, width_status, draw_status, click_status, NULL, "status" },
	{ -1, 0, BAR_ALIGN_NONE, width_wintitle, draw_wintitle, click_wintitle, NULL, "wintitle" },
};


// LAYOUTS
static const float mfact = 0.5; // factor of master area size
static const int nmaster = 1; // number of clients in master area
static const int resizehints = 0; // 1 means respect size hints in tiled resizals
static const int lockfullscreen = 1; // 1 will force focus on the fullscreen window
static const int refreshrate = 120; // refresh rate (per second) for client move/resize

static const Layout layouts[] = {
  { "tile", tile },
  // { "dwindle", dwindle },
  { "monocle", monocle },
  { "float", NULL },
};


// KEYBINDS
#define MOD Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MOD, KEY, view, { .ui = 1 << TAG } }, \
	{ MOD|Mod1Mask, KEY, tag, { .ui = 1 << TAG } }, \
	{ MOD|ControlMask, KEY, toggleview, { .ui = 1 << TAG } }, \
	{ MOD|ControlMask|Mod1Mask, KEY, toggletag, { .ui = 1 << TAG } },

static char dmenumon[2] = "0";
static const char *dmenucmd[] = {
  "dmenu_run",
  "-p", "type & search",
  // "-m", dmenumon,
  "-fn", dmenufont,
  "-nb", normbgcolor,
  "-nf", normfgcolor,
  "-sb", selbgcolor,
  "-sf", selfgcolor,
  NULL
};

static const Key keys[] = {
  // modifier, key, function, argument
  { MOD, XK_d, spawn, { .v = dmenucmd } },
  { MOD, XK_Return, spawn, CMD("alacritty") },
  { MOD, XK_g, spawn, SHCMD("alacritty --title search -e python  ~/.config/hypr/scripts/search.py")},

  { MOD, XK_j, focusstack, { .i = +1 } },
  { MOD, XK_k, focusstack, { .i = -1 } },
  { MOD, XK_h, setmfact, { .f = -0.05 } },
  { MOD, XK_l, setmfact, { .f = +0.05 } },

  { MOD, XK_b, togglebar, { 0 } },
  { MOD, XK_Tab, view, { 0 } },
  { MOD, XK_c, killclient, { 0 } },
  { MOD, XK_q, quit, { 0 } },
  // { MOD, XK_f, setlayout, { .v = &layouts[2] } },
  { MOD, XK_v, nextlayout, { 0 } },
  { MOD, XK_0, view, { .ui = ~0 } },
  { MOD|ShiftMask, XK_0, tag, { .ui = ~0 } },
  { MOD, XK_comma, focusmon, { .i = -1 } },
  { MOD, XK_period, focusmon, { .i = +1 } },
  { MOD|ShiftMask, XK_comma, tagmon, { .i = -1 } },
  { MOD|ShiftMask, XK_period, tagmon, { .i = +1 } },
  { MOD|Mod1Mask, XK_r, quit, { 1 } },

  TAGKEYS(XK_1, 0)
  TAGKEYS(XK_2, 1)
  TAGKEYS(XK_3, 2)
  TAGKEYS(XK_4, 3)
  TAGKEYS(XK_5, 4)
  TAGKEYS(XK_6, 5)
  TAGKEYS(XK_7, 6)
  TAGKEYS(XK_8, 7)
  TAGKEYS(XK_9, 8)
};

static const Button buttons[] = {
  // click, event mask, button, function, argument
  // { ClkLtSymbol, 0, Button1, setlayout, { 0 } },
  { ClkLtSymbol, 0, Button3, setlayout, { .v = &layouts[2]} },
  // { ClkWinTitle, 0, Button2, zoom, { 0 } },
  // { ClkStatusText, 0, Button2, spawn, { .v = termcmd } },
  { ClkClientWin, MOD, Button1, movemouse, { 0 } },
  { ClkClientWin, MOD, Button2, togglefloating, { 0 } },
  { ClkClientWin, MOD, Button3, resizemouse, { 0 } },
  { ClkTagBar, 0, Button1, view, { 0 } },
  { ClkTagBar, 0, Button3, toggleview, { 0 } },
  // { ClkTagBar, MOD,              Button1,        tag,            {0} },
  // { ClkTagBar, MOD,              Button3,        toggletag,      {0} },
};
