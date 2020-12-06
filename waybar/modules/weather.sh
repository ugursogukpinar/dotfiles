#!/bin/bash
report=$(curl wttr.in/Kocaeli?format="%C,+%t\n" | sed -e 's/,.*:/:/')
echo $report
