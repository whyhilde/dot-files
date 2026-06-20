const std = @import("std");
const config = @import("config.zig");

const c = @cImport({
    @cInclude("signal.h");
    @cInclude("X11/Xlib.h");
});

pub const Block = struct {
    icon: []const u8,
    command: []const u8,
    interval: u32,
    signal: u8,
};

const RuntimeBlock = struct {
    config: Block,
    output: []const u8 = &.{},
    // last_update: u64 = 0,
    last_update: ?std.Io.Timestamp = null,
};

pub fn main(init: std.process.Init) !void {
    const allocator = init.gpa;
    const io = init.io;

    var blocks: [config.blocks.len]RuntimeBlock = undefined;

    inline for (config.blocks, 0..) |block, i| {
        blocks[i] = .{
            .config = block,
        };
    }

    // try updateBlock(allocator, io, &blocks[0]);

    // std.debug.print("{s}\n", .{blocks[0].output});

    // allocator.free(blocks[0].output);

    const display = c.XOpenDisplay(null);
    if (display == null)
        return error.CannotOpenDisplay;
    defer _ = c.XCloseDisplay(display);

    const root = c.DefaultRootWindow(display);

    // for (&blocks) |*block| {
    //     try updateBlock(allocator, io, block);
    // }
    //
    // const status = try buildStatus(allocator, &blocks);
    // defer allocator.free(status);
    //
    // setStatus(display.?, root, status);
    //
    // for (&blocks) |*block| {
    //     if (block.output.len != 0)
    //         allocator.free(block.output);
    // }
    while (true) {
        // const now = std.Io.Timestamp.now(io, .awake);

        for (&blocks) |*block| {
            if (block.last_update == null or block.last_update.?.untilNow(io, .awake).toSeconds() >= block.config.interval) {
                try updateBlock(allocator, io, block);
                // continue;
            }

            // const elapsed = block.last_update.?.untilNow(io, .awake).;

            // if (elapsed.toSeconds() >= block.config.interval) {
            //     try updateBlock(allocator, io, block);
            // }
            // try updateBlock(allocator, io, block);
        }

        const status = try buildStatus(allocator, &blocks);

        setStatus(display.?, root, status);

        allocator.free(status);

        try io.sleep(.fromSeconds(1), .awake);
    }
}

fn runCommand(allocator: std.mem.Allocator, io: std.Io, command: []const u8) ![]const u8 {
    const result = try std.process.run(allocator, io, .{
        .argv = &.{
            "/bin/sh",
            "-c",
            command,
        },
    });
    defer allocator.free(result.stdout);
    defer allocator.free(result.stderr);

    const trimmed = std.mem.trim(u8, result.stdout, "\n");

    return try allocator.dupe(u8, trimmed);
}

fn updateBlock(allocator: std.mem.Allocator, io: std.Io, block: *RuntimeBlock) !void {
    if (block.output.len != 0)
        allocator.free(block.output);

    block.output = try runCommand(allocator, io, block.config.command);
    block.last_update = std.Io.Timestamp.now(io, .awake);
}

fn buildStatus(allocator: std.mem.Allocator, blocks: []const RuntimeBlock) ![]u8 {
    var list: std.ArrayList(u8) = .empty;
    errdefer list.deinit(allocator);

    for (blocks, 0..) |block, i| {
        try list.appendSlice(allocator, block.config.icon);
        try list.appendSlice(allocator, block.output);

        if (i + 1 != blocks.len)
            try list.appendSlice(allocator, config.delimiter);
    }

    return try list.toOwnedSlice(allocator);
}

fn setStatus(display: *c.Display, root: c.Window, status: []const u8) void {
    _ = c.XStoreName(display, root, @ptrCast(status.ptr));

    _ = c.XSync(display, c.False);
}
