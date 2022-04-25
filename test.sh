#!/bin/bash

echo "Shell PID $$"
sh -c "echo $$ ; sleep 10 && echo Sleep $! ; ps aux | grep $$" 