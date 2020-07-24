if [[ $(ps --no-header --pid=$PPID --format=cmd) != "fish" ]]
then
    cat $HOME/.cache/wal/sequences
	exec fish
fi
