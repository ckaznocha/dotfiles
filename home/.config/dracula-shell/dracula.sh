#!/bin/sh
# Base16 Embers - Shell color setup script
# Jannik Siebert (https://github.com/janniks)

if [ "${TERM%%-*}" = 'linux' ]; then
    # This script doesn't support linux console (use 'vconsole' template instead)
    return 2>/dev/null || exit 0
fi

color00="26/26/26" # Base 00 - Black
color01="E3/56/A7" # Base 08 - Red
color02="42/E6/6C" # Base 0B - Green
color03="E4/F3/4A" # Base 0A - Yellow
color04="9B/6B/DF" # Base 0D - Blue
color05="E6/47/47" # Base 0E - Magenta
color06="75/D7/EC" # Base 0C - Cyan
color07="EF/A5/54" # Base 05 - White
color08="7A/7A/7A" # Base 03 - Bright Black
color09="FF/79/C6" # Base 08 - Bright Red
color10="50/FA/7B" # Base 0B - Bright Green
color11="F1/FA/8C" # Base 0A - Bright Yellow
color12="BD/93/F9" # Base 0D - Bright Blue
color13="FF/55/55" # Base 0E - Bright Magenta
color14="8B/E9/FD" # Base 0C - Bright Cyan
color15="DB/D6/D1" # Base 07 - Bright White
color_foreground="F8/F8/F2" # Base 05
color_background="28/2A/36" # Base 00
color_cursor="F8/F8/F2" # Base 05

if [ -n "$TMUX" ]; then
  # tell tmux to pass the escape sequences through
  # (Source: http://permalink.gmane.org/gmane.comp.terminal-emulators.tmux.user/1324)
  printf_template="\033Ptmux;\033\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033Ptmux;\033\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033Ptmux;\033\033]%s%s\007\033\\"
elif [ "${TERM%%-*}" = "screen" ]; then
  # GNU screen (screen, screen-256color, screen-256color-bce)
  printf_template="\033P\033]4;%d;rgb:%s\007\033\\"
  printf_template_var="\033P\033]%d;rgb:%s\007\033\\"
  printf_template_custom="\033P\033]%s%s\007\033\\"
else
  printf_template="\033]4;%d;rgb:%s\033\\"
  printf_template_var="\033]%d;rgb:%s\033\\"
  printf_template_custom="\033]%s%s\033\\"
fi

# 16 color space
printf $printf_template 0  $color00
printf $printf_template 1  $color01
printf $printf_template 2  $color02
printf $printf_template 3  $color03
printf $printf_template 4  $color04
printf $printf_template 5  $color05
printf $printf_template 6  $color06
printf $printf_template 7  $color07
printf $printf_template 8  $color08
printf $printf_template 9  $color09
printf $printf_template 10 $color10
printf $printf_template 11 $color11
printf $printf_template 12 $color12
printf $printf_template 13 $color13
printf $printf_template 14 $color14
printf $printf_template 15 $color15


# foreground / background / cursor color
if [ -n "$ITERM_SESSION_ID" ]; then
  # iTerm2 proprietary escape codes
  printf $printf_template_custom Pg F8F8F2 # forground
  printf $printf_template_custom Ph 282A36 # background
  printf $printf_template_custom Pi A39A90 # bold color
  printf $printf_template_custom Pj 44475A # selection color
  printf $printf_template_custom Pk F8F8F2 # selected text color
  printf $printf_template_custom Pl F8F8F2 # cursor
  printf $printf_template_custom Pm 282A36 # cursor text
else
  printf $printf_template_var 10 $color_foreground
  printf $printf_template_var 11 $color_background
  printf $printf_template_var 12 $color_cursor
fi

# clean up
unset printf_template
unset printf_template_var
unset color00
unset color01
unset color02
unset color03
unset color04
unset color05
unset color06
unset color07
unset color08
unset color09
unset color10
unset color11
unset color12
unset color13
unset color14
unset color15
unset color_foreground
unset color_background
unset color_cursor
