import FreeCAD
import Part
import importCSG
import sys
import os

# ──────────────────────────────────────────────────────────────────────────
# getting input file and output file

args = sys.argv[1::]

if len(args) < 1:
    sys.exit("No input file given.")

in_file = args[0]
if os.path.splitext(in_file)[1] != '.csg':
    sys.exit("Input file name extension is not \".csg\"")

if len(args) > 1:
    out_file = args[1]
    if os.path.splitext(out_file)[1] != '.step':
        sys.exit("Output file name extension is not \".step\"")
else:
    out_file = os.path.splitext(in_file)[0] + '.step'

# ──────────────────────────────────────────────────────────────────────────
# converting csg file to step file

importCSG.open(in_file)
Part.export([FreeCAD.ActiveDocument.Objects[-1]], out_file)
