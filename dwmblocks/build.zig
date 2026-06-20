const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "dwmblocks",
        .root_module = b.createModule(.{
            .root_source_file = b.path("src/dwmblocks.zig"),
            .target = target,
            .optimize = optimize,
            .link_libc = true,
        }),
    });

    exe.root_module.linkSystemLibrary("X11", .{});

    b.installArtifact(exe);
}
