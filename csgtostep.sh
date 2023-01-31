#!/bin/bash

# ──────────────────────────────────────────────────────────────────────────

usage="$(basename "$0") [-h] [-i INPUT] [-o OUTPUT]
Converts a CSG file (\".csg\" extension) to a STEP file (\".step\" extension) using FreeCAD, where:
    -h  shows this help text
    -i  input file name with extension; must be \".csg\"
    -o  output file name with extension must be \".step\""

# ──────────────────────────────────────────────────────────────────────────

while getopts ":hi:o:" opt; do
    case ${opt} in
        i)
            INPUT=$OPTARG
            ;;
        o)
            OUTPUT=$OPTARG
            ;;
        h)
            echo "$usage"
            ;;
        \?)
            echo "Invalid option: $OPTARG" 1>&2
            echo "$usage"
            exit 1
            ;;
        :)
            echo "Invalid option: $OPTARG requires an argument" 1>&2
            echo "$usage"
            exit 1
            ;;
    esac
done
shift $((OPTIND -1))

# ──────────────────────────────────────────────────────────────────────────

if [ ! "$INPUT" ]; then
    echo "Input file must be provided."
    exit 1
fi

# ──────────────────────────────────────────────────────────────────────────

docker run --rm --volume "$(pwd):/data" dkllrjr/csgtostep:latest $INPUT $OUTPUT
