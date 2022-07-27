function fgit
  if echo $argv[1]| grep "git@" &>/dev/null
    set dirname (echo $argv[1]|cut -d'/' -f2)
  else
    set dirname (echo $argv[1]| cut -d'/' -f5)
  end

  if [ -z $argv[1] ]
    echo "usage: fgit https://github.com/repo_owner/repo_name"
  else
    git clone --filter=blob:none --no-checkout --depth 1 --sparse $argv[1] &>/dev/null
    cd $dirname
    git sparse-checkout init --cone
    echo
    read -P "get $dirname/" subdir
    echo
    git sparse-checkout add $subdir
    git checkout
    mv $subdir ../ #move requested dir to current dir
    rm -rf ../$dirname #remove useless repo
    cd ../
  end
end

