@echo off

set "GIT_URL=https://github.com/Nicktofal/OSST.git

git add --all

git commit -m "Auto-sync %date%"

git push --recurse-submodules=on-demand "%GIT_URL%" main

pause