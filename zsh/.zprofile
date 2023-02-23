#!/bin/sh

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
	exec ${XDG_CONFIG_HOME}/x11/startx
fi
