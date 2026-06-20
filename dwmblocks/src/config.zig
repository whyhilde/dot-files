const dwmblocks = @import("dwmblocks.zig");

pub const delimiter = " | ";

pub const blocks = [_]dwmblocks.Block{
    .{
        .icon = "",
        .command = "xset -q | grep LED | awk '{ if (substr ($10,5,1) == 1) print \"[RU]\"; else print \"[EN]\"; }'",
        .interval = 10,
        .signal = 1,
    },
    .{
        .icon = "",
        .command = "LC_TIME=en_US.UTF-8 date +'%I:%M %p'",
        .interval = 1,
        .signal = 0,
    },
    .{
        .icon = "",
        .command = "uptime -p | sed s/\\ days,/d/ | sed s/\\ hours,/h/ | sed s/\\ minutes/m/",
        .interval = 1,
        .signal = 0,
    },
    // .{
    //     .icon = "",
    //     .command = "echo \"$(cat /sys/class/power_supply/BAT0/capacity)\"",
    //     .interval = 1,
    //     .signal = 0,
    // },
};
