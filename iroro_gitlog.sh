#!/usr/bin/env bash

for d in ~/stash/*/.git; do
    r=${d%.git}
    # echo "$r"
    git -C "$r" log \
        --committer=iorife \
        --after=2023-08-15 \
        --reverse \
	--pretty='format:%h%C(Cyan)  %cd%C(Green)  %s'
done
