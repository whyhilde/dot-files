#! /usr/bin/env bash
set -e


echo $(playerctl metadata --format "  {{artist}} - {{title}}" 2>/dev/null || echo "  Nothing Playing")
