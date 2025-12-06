#! /usr/bin/env bash
set -e


SONG_INFO=$(playerctl metadata --format "  {{artist}} - {{title}}")
echo "$SONG_INFO"
