#!/bin/bash

echo This file is not ready.
exit 1

mkdir build/files/games/doom/fabs
cp ../src/prefabs build/files/games/doom/fabs
zip build/ObFab.pk3 build/files/*

echo build complete
# exit 0