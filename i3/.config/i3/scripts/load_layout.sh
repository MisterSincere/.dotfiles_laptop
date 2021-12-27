#!/bin/bash

# append saved layout to workspace m
i3-msg "workspace 1; append_layout ~/.config/i3/trees/tmp.json"

# and finally we fill the containers with programs
(terminator &)
(terminator &)
(terminator &)
