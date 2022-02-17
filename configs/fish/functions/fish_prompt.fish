# MZish 2.0

set -gx docls 'false'

function _is_git_dirty
  echo (command git status -s --ignore-submodules=dirty 2> /dev/null)
end

function fish_prompt
  if [ "$docls" = "true" ]
    clear
  end

	if [ $COLUMNS -lt 57 ]; or [ $LINES -lt 30 ]
		set -gx dols 'false'
	else
		set -gx dols 'true'
  end

  set_color -o $fish_color_autosuggestion[2]
  if test (ls -a |wc -l) -lt 40 && [ "$dols" = "true" ] && [ "$status" = "0" ]
    #tree -h -L 1 && echo
    ls -lh & echo
  end
  set_color -o yellow
  printf '%s' (__fish_git_prompt)
  if [ (_is_git_dirty) ]
    set_color brred
    printf '* '
  end
  set_color -o green
	set symbol      
	set index (random 1 6)
	set_color -o red
  printf ' %s ' (prompt_pwd)
	set_color -o green
	#printf '  '
  printf '%s  ' $symbol[$index]

  set_color normal
end
