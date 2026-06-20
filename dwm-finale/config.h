#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }
#define CMD(...)   { .v = (const char*[]){ __VA_ARGS__, NULL } }


// border pixel of windows
static const unsigned int borderpx = 5;
// snap pixel
static const unsigned int snap = 50;
// horiz inner gap between windows
static const unsigned int gappih = 10;
// vert inner gap between windows
static const unsigned int gappiv = 10;
// horiz outer gap between windows and screen edge
static const unsigned int gappoh = 10;
// vert outer gap between windows and screen edge
static const unsigned int gappov = 10;
// gap factor when there is only one client; 0 = no gaps, 3 = 3x outer gaps
static const int smartgaps_fact = 1;
// 0 means no bar
static const int showbar = 1;
// 0 means bottom bar
static const int topbar = 1;
// status is to be shown on: -1 (all monitors), 0 (a specific monitor by index), 'A' (active monitor)
static const int statusmon = 'A';
// systray spacing
static const unsigned int systrayspacing = 2;
// 0 means no systray
static const int showsystray = 1;
// indicators: see patch/bar_indicators.h for options
// static int tagindicatortype = INDICATOR_TOP_LEFT_SQUARE;
// static int tiledindicatortype            = INDICATOR_NONE;
// static int floatindicatortype            = INDICATOR_TOP_LEFT_SQUARE;
// fonts
static const char *fonts[]               = { "JetBrains Mono NF:size=16:style=bold" };
static const char dmenufont[]            = "JetBrains Mono NF:size=16:style=bold";

static char c000000[]                    = "#000000"; // placeholder value

static char normfgcolor[] = "#f8f8f2";
static char normbgcolor[] = "#282a36";
static char normbordercolor[] = "#565761";
static char normfloatcolor[] = "#bd93f9";

static char selfgcolor[] = "#e4e4e0";
static char selbgcolor[] = "#bd93f9";
static char selbordercolor[] = "#bd93f9";
static char selfloatcolor[] = "#bd93f9";

static char titlenormfgcolor[] = "#f8f8f2";
static char titlenormbgcolor[] = "#282a36";
static char titlenormbordercolor[] = "#44475a";
static char titlenormfloatcolor[] = "#db8fd9";

static char titleselfgcolor[] = "#e4e4e0";
static char titleselbgcolor[] = "#bd93f9";
static char titleselbordercolor[] = "#bd93f9";
static char titleselfloatcolor[] = "#bd93f9";

static char tagsnormfgcolor[] = "#f8f8f2";
static char tagsnormbgcolor[] = "#282a36";
static char tagsnormbordercolor[]        = "#444444";
static char tagsnormfloatcolor[] = "#db8fd9";

static char tagsselfgcolor[] = "#e4e4e0";
static char tagsselbgcolor[] = "#bd93f9";
static char tagsselbordercolor[] = "#bd93f9";
static char tagsselfloatcolor[] = "#bd93f9";

static char hidnormfgcolor[] = "#bd93f9";
static char hidselfgcolor[] = "#6272a4";
static char hidnormbgcolor[] = "#282a36";
static char hidselbgcolor[] = "#282a36";

static char urgfgcolor[] = "#f8f8f2";
static char urgbgcolor[] = "#282a36";
static char urgbordercolor[] = "#ff5555";
static char urgfloatcolor[] = "#db8fd9";

static char *colors[][ColCount] = {
  /*                       fg                bg                border                float */
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

// tags
static char *tagicons[][NUMTAGS] = {
  [DEFAULT_TAGS] = { "1", "2", "3", "4", "5" },
};

/* There are two options when it comes to per-client rules:
 *  - a typical struct table or
 *  - using the RULE macro
 *
 * A traditional struct table looks like this:
 *    // class      instance  title  wintype  tags mask  isfloating  monitor
 *    { "Gimp",     NULL,     NULL,  NULL,    1 << 4,    0,          -1 },
 *    { "Firefox",  NULL,     NULL,  NULL,    1 << 7,    0,          -1 },
 *
 * The RULE macro has the default values set for each field allowing you to only
 * specify the values that are relevant for your rule, e.g.
 *
 *    RULE(.class = "Gimp", .tags = 1 << 4)
 *    RULE(.class = "Firefox", .tags = 1 << 7)
 *
 * Refer to the Rule struct definition for the list of available fields depending on
 * the patches you enable.
 */
static const Rule rules[] = {
  RULE(.wintype = WTYPE "DIALOG", .isfloating = 1)
  RULE(.wintype = WTYPE "UTILITY", .isfloating = 1)
  RULE(.wintype = WTYPE "TOOLBAR", .isfloating = 1)
  RULE(.wintype = WTYPE "SPLASH", .isfloating = 1)
  RULE(.class = "zen", .tags = 1 << 2)
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

/* layout(s) */
static const float mfact = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster = 1;    /* number of clients in master area */
static const int resizehints = 0;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */
static const int refreshrate = 120;  /* refresh rate (per second) for client move/resize */

static const Layout layouts[] = {
  { "tile", tile },
  { "dwindle", dwindle },
  { "monocle", monocle },
  { "float", NULL },
};


/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = {
	"dmenu_run",
	"-m", dmenumon,
	"-fn", dmenufont,
	"-nb", normbgcolor,
	"-nf", normfgcolor,
	"-sb", selbgcolor,
	"-sf", selfgcolor,
	NULL
};
static const char *termcmd[]  = { "alacritty", NULL };

static const Key keys[] = {
	// modifier, key, function, argument
	{ MODKEY, XK_d, spawn, { .v = dmenucmd } },
	{ MODKEY, XK_Return, spawn, { .v = termcmd } },
	{ MODKEY, XK_b, togglebar, { 0 } },
	{ MODKEY, XK_j, focusstack, { .i = +1 } },
	{ MODKEY, XK_k, focusstack, { .i = -1 } },
  { MODKEY, XK_h, setmfact, { .f = -0.05 } },
	{ MODKEY, XK_l, setmfact, { .f = +0.05 } },
	{ MODKEY, XK_Tab, view, { 0 } },
	{ MODKEY, XK_c, killclient, { 0 } },
	{ MODKEY, XK_q, quit, { 0 } },
	{ MODKEY, XK_f, setlayout, { .v = &layouts[3] } },
	{ MODKEY, XK_v, nextlayout, { 0 } },
	{ MODKEY, XK_0, view, { .ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,          tag,                    {.ui = ~0 } },
	{ MODKEY,                       XK_comma,      focusmon,               {.i = -1 } },
	{ MODKEY,                       XK_period,     focusmon,               {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,      tagmon,                 {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period,     tagmon,                 {.i = +1 } },
  { MODKEY|Mod1Mask,              XK_r,          quit,                   { 1 } },
  TAGKEYS(                        XK_1,                                  0)
	TAGKEYS(                        XK_2,                                  1)
	TAGKEYS(                        XK_3,                                  2)
	TAGKEYS(                        XK_4,                                  3)
	TAGKEYS(                        XK_5,                                  4)
	TAGKEYS(                        XK_6,                                  5)
	TAGKEYS(                        XK_7,                                  6)
	TAGKEYS(                        XK_8,                                  7)
	TAGKEYS(                        XK_9,                                  8)
};

/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
  /* click                event mask           button          function        argument */
  { ClkLtSymbol,          0,                   Button1,        setlayout,      {0} },
  { ClkLtSymbol,          0,                   Button3,        setlayout,      {.v = &layouts[2]} },
  { ClkWinTitle,          0,                   Button2,        zoom,           {0} },
  { ClkStatusText,        0,                   Button2,        spawn,          {.v = termcmd } },
  { ClkClientWin,         MODKEY,              Button1,        movemouse,      {0} },
  { ClkClientWin,         MODKEY,              Button2,        togglefloating, {0} },
  { ClkClientWin,         MODKEY,              Button3,        resizemouse,    {0} },
  { ClkTagBar,            0,                   Button1,        view,           {0} },
  { ClkTagBar,            0,                   Button3,        toggleview,     {0} },
  { ClkTagBar,            MODKEY,              Button1,        tag,            {0} },
  { ClkTagBar,            MODKEY,              Button3,        toggletag,      {0} },
};
