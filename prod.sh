#!/bin/sh
mkdir -p log/sasl
erl -sname leni -setcookie nocookie -pa $PWD/apps/*/ebin $PWD/deps/*/ebin -boot start_sasl -s leni -s reloader -detached
