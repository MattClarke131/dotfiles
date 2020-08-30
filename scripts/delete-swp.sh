#!/usr/bin/env bash
#### DESCRIPTION: Finds and deletes all .swp files within current directory (and its children)

find . -name '*.swp' -exec rm {} \;
