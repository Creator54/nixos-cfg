set -gx EDITOR vim
set -gx VISUAL vim
set -gx PAGER "bat"

alias v "bat"
alias x "rm -rf"
alias se "e /etc/nixos/configuration.nix"
alias sw "nixos-rebuild switch"
alias q "nix-env -q"
alias r "nix-env --uninstall"
alias he "cmd home-manager edit"
alias gi "git init; git branch -M main"
alias gs "git status"
alias gb "git branch"
alias gck "git checkout"
alias gd "git diff"
alias gl "git log"
alias gc "git commit"
alias gr "git remote"
alias gx "git reset --hard"

if status is-interactive
  and not set -q TMUX
  if tmux ls
    exec tmux attach
  else
    exec tmux
  end
end

function cmd
  echo CMD: $argv; echo
  $argv
end

function build
  set path "/home/creator54/website-stuff"
  if [ $PWD = "$path/main" ] 
    zola build
  else if [ $PWD = "$path/blog" ]
    nix-shell --run "bundle exec jekyll build"
  else
    echo "Wrong directory !"\n
    echo "Only meant for $path/main & $path/blog !"
  end
  sudo nixos-rebuild switch
end

function i
  if [ $argv[1] = "-l" ];or [ $argv[1] = "-latest" ]
    echo "Channel: Creator54/nixpkgs"
    nix-env -f /home/$USER/nixpkgs -iA $argv[2]
  else
    echo "Channel: NIXOS" && nix-env -iA nixos.$argv;
  end
end

function gpull
  git pull origin (git branch | sed 's/^* //') --force
end

function gpush
  if [ -z "$argv" ]
    git push origin (gb | grep -e '*' | cut -d ' ' -f2) --force
  else
    git push origin $argv
  end
end

function ga
  if [ -z "$argv" ]
    git add .
  else
    git add $argv
  end
end

function e
  switch $argv[1]
  case '-d'
    c $argv[2] && $EDITOR (echo $argv[2]|sed 's/^.*\///')
  case '*'
    $EDITOR $argv
  end
end

function c
  if [ -z $argv ]
    cd ..
  else if [ -d $argv ]
    cd $argv
  else if [ -e $argv ]
    set filename (echo $argv | cut -d/ -f3)
    cd (string replace $filename '' $argv)
  else if string match -qr '^[0-9]+$' $argv
    if [ $argv = "1" ] #browsing through /nix/store sometimes doesnt work so workaround for now
      cd ..
    else
      set dir_count (pwd | grep -o "/" | wc -l)
      set go_back (math $dir_count - $argv + 2)
      cd (pwd | awk -F (pwd | cut -d'/' -f$go_back) '{print $1}')
    end
  else
    echo "Directory doesn't exit !"
    read -P "Press enter to create ! " ans #fish use P, bash uses p
    if [ "$ans" = "y" ] || [ "$ans" = "" ]
      mkdir -p $argv;
      cd $argv;
    end
  end
end

function hs
  switch $argv[1]
    case '-h'
      echo "Usage: "
      echo "-h  : help"
      echo "-g  : list generations"
      echo "-r  : -r num, goes back num generations"
    case '-g'
      cmd home-manager generations | bat
    case '-r'
      switch $argv[2]
        case ''
          set argv[2] 1
      end
      set gobackto (home-manager generations | head -n $argv[2]|tail -n 1)
      echo "Reverting to Generation:" (echo $gobackto|cut -d' ' -f5)
      cmd (echo $gobackto|cut -d' ' -f7)/activate
    case '*'
      cmd home-manager switch
  end
end

function fish_greeting
  set -l msg "Welcome back !" "I am up !" "What are we going to do today !" "How may i help ?"
  set index (random 1 4)
  printf '\n%s\n\n' $msg[$index]
end

function __fish_command_not_found_handler --on-event fish_command_not_found
  set -l exit_string "You know what you are doing, right ?" "Are you sure about that ?" "Sorry can't find what you are looking for :(" "IDK what you mean !" "Invalid command !" "You in the right mood mate ?"
  set index (random 1 6)
  printf '%s\n' $exit_string[$index]
end
direnv hook fish | source
