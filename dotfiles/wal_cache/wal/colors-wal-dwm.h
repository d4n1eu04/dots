static const char norm_fg[] = "#e2cbc6";
static const char norm_bg[] = "#1c1c1c";
static const char norm_border[] = "#9e8e8a";

static const char sel_fg[] = "#e2cbc6";
static const char sel_bg[] = "#eb55eb";
static const char sel_border[] = "#e2cbc6";

static const char urg_fg[] = "#e2cbc6";
static const char urg_bg[] = "#6b55eb";
static const char urg_border[] = "#6b55eb";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
