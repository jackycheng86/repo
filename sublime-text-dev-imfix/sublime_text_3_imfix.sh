#!/bin/sh

# Please note that Sublime Text 3 for some reason opens an empty instance
# if the project you're trying to open is already open in another instance,
# instead of just giving it focus.

SUBLIME_HOME=/opt/sublime_text_3
LD_LIB="${SUBLIME_HOME}/libsublime-imfix.so"
BIN="${SUBLIME_HOME}/sublime_text"

PID=$(pidof -o %PPID ${BIN} 2>/dev/null)
ARGS="--class=sublime-text"

if [[ ${1:(-16)} == ".sublime-project" ]]; then
  ARGS="${ARGS} --project"
fi

if [[ -n ${PID} ]]; then
  LD_PRELOAD=${LD_LIB} ${BIN} ${ARGS} "$@"
else
  LD_PRELOAD=${LD_LIB} ${BIN} ${ARGS} "$@" &
fi

# vim:set ts=2 sw=2 et:
