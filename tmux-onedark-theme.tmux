#!/bin/bash
onedark_black="#16181C"
onedark_blue="#61afef"
onedark_yellow="#e5c07b"
onedark_red="#e06c75"
onedark_white="#aab2bf"
onedark_light_green="#98c379"
onedark_green="#85b861"
onedark_visual_grey="#3e4452"
onedark_comment_grey="#5c6370"
cyan="#56b6c2"
purple="#b8aaf0"

get() {
   local option=$1
   local default_value=$2
   local option_value="$(tmux show-option -gqv "$option")"

   if [ -z "$option_value" ]; then
      echo "$default_value"
   else
      echo "$option_value"
   fi
}

set() {
   local option=$1
   local value=$2
   tmux set-option -gq "$option" "$value"
}

setw() {
   local option=$1
   local value=$2
   tmux set-window-option -gq "$option" "$value"
}

set "status" "on"
set "status-justify" "centre"

set "status-left-length" "100"
set "status-right-length" "100"
set "status-right-attr" "none"

set "message-fg" "$onedark_white"
set "message-bg" "$onedark_black"

set "message-command-fg" "$onedark_white"
set "message-command-bg" "$onedark_black"

set "status-attr" "none"
set "status-left-attr" "none"

setw "window-status-fg" "$onedark_black"
setw "window-status-bg" "$onedark_black"
setw "window-status-attr" "none"

setw "window-status-activity-bg" "$onedark_black"
setw "window-status-activity-fg" "$onedark_black"
setw "window-status-activity-attr" "none"

setw "window-status-separator" ""

set "window-style" "fg=$onedark_comment_grey"
set "window-active-style" "fg=$onedark_white"

set "pane-border-fg" "$onedark_white"
set "pane-border-bg" "$onedark_black"
set "pane-active-border-fg" "$onedark_green"
set "pane-active-border-bg" "$onedark_black"

set "display-panes-active-colour" "$onedark_yellow"
set "display-panes-colour" "$onedark_blue"

set "status-bg" "$onedark_black"
set "status-fg" "$onedark_white"

set "@prefix_highlight_fg" "$onedark_black"
set "@prefix_highlight_bg" "$onedark_green"
set "@prefix_highlight_copy_mode_attr" "fg=$onedark_black,bg=$onedark_green"
set "@prefix_highlight_output_prefix" "  "

# status_widgets=$(get "@onedark_widgets")
time_format=$(get "@onedark_time_format" "%R")
date_format=$(get "@onedark_date_format" "%a %d %b")

onedark_status_right="#[fg=$onedark_blue,bg=$onedark_black,bold]#[fg=$onedark_black,bg=$onedark_blue,nobold]${time_format}#[fg=$onedark_blue,bg=$onedark_black,bold] #[fg=$onedark_yellow,bg=$onedark_black]#[fg=$onedark_black,bg=$onedark_yellow,nobold]${date_format}#[fg=$onedark_yellow,bg=$onedark_black,bold] #[fg=$onedark_red,bg=$onedark_black]#[fg=$onedark_black,bg=$onedark_red,nobold,noitalics]#h#[fg=$onedark_red,bg=$onedark_black,noitalics]"

onedark_status_left="#[fg=$cyan,bg=$onedark_black,bold]#[fg=$onedark_black,bg=$cyan]#S#[fg=$cyan,bg=$onedark_black]"
onedark_window_status_format="#[fg=$onedark_black,bg=$onedark_black]#[fg=$onedark_visual_grey,bg=$onedark_black, bold]#I:#W#[fg=$onedark_black,bg=$onedark_black]"
onedark_window_status_current_format="#[fg=$onedark_visual_grey,bg=$onedark_black,bold]#[fg=$onedark_light_green,bg=$onedark_visual_grey,bold]#I-#W#[fg=$onedark_visual_grey,bg=$onedark_black]"

set "status-right" "$onedark_status_right"
set "status-left"  "$onedark_status_left"

set "window-status-format" "$onedark_window_status_format"
set "window-status-current-format" "$onedark_window_status_current_format"
