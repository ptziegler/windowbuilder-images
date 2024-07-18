#!/bin/bash
cd eclipse-svg

# Convert all svg to png files (in eclipse-svg)
SVG_FILES=$(find . -type f -name "*.svg")
for f in $SVG_FILES; do
  echo $f
  inkscape $f -d 96 -o ${f%.svg}.png;
  inkscape $f -d 192 -o ${f%.svg}@2x.png;
done 

cd ..
rm -r eclipse-png
# Move all png files from eclipse-svg to eclipse-png
rsync -rv --include='*.png' --include='*/' --exclude='*' --remove-source-files --prune-empty-dirs eclipse-svg/ eclipse-png/
