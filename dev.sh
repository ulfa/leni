#!/bin/sh
erl -sname leni -setcookie nocookie -pa $PWD/ebin $PWD/deps/*/ebin -boot start_sasl -s leni -s reloader  -s erlbuild
