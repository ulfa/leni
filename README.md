# Overview

This application is the graphical interface to horst.
If you want to know more about sue, please look here : https://github.com/ulfa/horst

## Feature

* display all actors in a network
* display all sensors in a network
* display all configured messages for the drivers on a node
* interaction with some actors like switches

# Installation and starting

To install the application on your machine, please do the following steps :

```bash
$ git clone https://github.com/ulfa/leni
$ cd leni
$ make all
$ ./dev.sh
```
Type in your browser http://localhost:8001/actors

## Dependencies

Before you can install this appliction on your machine, you have to install an [erlang R15] (https://www.erlang-solutions.com/downloads/download-erlang-otp) runtime. 
After installing the runtime, you have to install [rebar] (https://github.com/basho/rebar) on your machine. rebar is the build tool for erlang.

* [erlang R15] (https://www.erlang-solutions.com/downloads/download-erlang-otp) erlang for Raspberry Pi
* [rebar] (https://github.com/basho/rebar) the build tool for erlang

## 3rd party libraries

* [mochiweb] (https://github.com/mochi/mochiweb) a HTTP server
* [webmachine](https://github.com/basho/webmachine) REST toolkit
* [erlydtl](https://github.com/evanmiller/erlydtl) template engine
* [jsx](https://github.com/talentdeficit/jsx) json library
* [lager](https://github.com/basho/lager) a logging framework
