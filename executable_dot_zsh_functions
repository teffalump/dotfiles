### Function definitions to be sourced by .zshrc

#get current branch
function current_branch()
    {
        BRANCH=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
        [ "$BRANCH" ] && echo -n "$BRANCH" || echo -n "-none-"
    }

#The first, up() will change your directory. The second will instead just print the desired directory name.  This makes it easy for you to mv a file up higher or something.
#If you pass no arguments, it just goes up one directory.
#If you pass a numeric argument it will go up that number of directories.
#If you pass a string argument, it will look for a parent directory with that name and go up to it.

up()
{
    dir=""
    if [ -z "$1" ]; then
        dir=..
    elif [[ $1 =~ ^[0-9]+$ ]]; then
        x=0
        while [ $x -lt ${1:-1} ]; do
            dir=${dir}../
            x=$(($x+1))
        done
    else
        dir=${PWD%/$1/*}/$1
    fi
    cd "$dir";
}

upstr()
{
    echo "$(up "$1" && pwd)";
}

#Query Wikipedia via console over DNS
wikisole ()
{
	COLUMNS=`tput cols`
	dig +short txt "${1}".wp.dg.cx | sed -e 's/\\//g' -e 's/" "//g' -e 's/^"//g' -e 's/"$//g' -e 's/ http:/\n\nhttp:/' | fmt -w $COLUMNS
}
py_directory () {
  cd "$(python -c "import os.path as _, ${1}; \
    print _.dirname(_.realpath(${1}.__file__[:-1]))"
  )"
}
