#!/bin/sh
erl -sname leni -setcookie nocookie -pa $PWD/apps/*/ebin $PWD/deps/*/ebin -boot start_sasl -s leni -s reloader -s toolbar -s erlbuild
