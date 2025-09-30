#!/usr/bin/env bash

last_date_time_stamp=$1
for d in ~/stash/*/.git; do
    r=${d%.git}
    # echo "$r"
    git -C "$r" log \
        --committer=iorife \
        --after=$last_date_time_stamp \
        --reverse \
	--pretty='format:%h%C(Cyan)  %cd%C(Green)  %s'
done
