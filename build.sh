#!/bin/bash
for f in *.svg; do
  inkscape $f --export-png-antialias 0 -d 96 -o ${f%.svg}.png;
  inkscape $f --export-png-antialias 0 -d 192 -o ${f%.svg}@2x.png;
done 
