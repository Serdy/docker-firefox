#!/bin/bash
if [ -z "$@"  ]; then
	bash -c "/usr/bin/firefox -new-instance" || exec bash -c "/usr/bin/firefox -new-instance" 2> /dev/null
fi
exec "$@"
